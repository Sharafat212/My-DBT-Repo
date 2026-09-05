{{ config(
    materialized='incremental',
    unique_key='id',
    incremental_strategy='merge',
    schema='silver_db'
) }}

with raw_source as (
    select * 
    from {{ ref('source_raw_data') }}

    {% if is_incremental() %}
      where _loaded_at > (select coalesce(max(_loaded_at), '1900-01-01') from {{ this }})
    {% endif %}
),

cleaned_data as (
    select 
        id,
        {{ clean_text('employee_name') }} as employee_name,
        {{ clean_text('department') }} as department,
        {{ handle_null_amount('salary') }} as salary,
        cast(join_date as date) as join_date,
        _loaded_at
    from raw_source
    where id is not null 
    and employee_name is not null
    and department is not null
),

latest_data as (
    select 
        *,
        row_number() over (partition by id order by _loaded_at desc) as row_num
    from cleaned_data
)

select 
    id,
    employee_name,
    department,
    salary,
    join_date,
    _loaded_at
from latest_data
where row_num = 1