{{ config(
    materialized='incremental',
    unique_key='id',
    schema='silver_db'
) }}

with raw_source as (
    select * 
    from workspace.source_db.source_raw_data
    
    {% if is_incremental() %}
      -- Fix: String literal ko explicitly DATE cast karein taake comparison exact ho
      where cast(join_date as date) > (
          select coalesce(max(cast(join_date as date)), cast('1900-01-01' as date)) 
          from {{ this }}
      )
    {% endif %}
),

cleaned_data as (
    select 
        id,
        {{ clean_text('employee_name') }} as employee_name,
        {{ clean_text('department') }} as department,
        {{ handle_null_amount('salary') }} as salary,
        cast(join_date as date) as join_date
    from raw_source
    where id is not null 
      and employee_name is not null
),

deduplicated_data as (
    select 
        *,
        {{ deduplicate('id', 'join_date') }} as row_num
    from cleaned_data
)

select 
    id,
    employee_name,
    department,
    salary,
    join_date
from deduplicated_data
where row_num = 1