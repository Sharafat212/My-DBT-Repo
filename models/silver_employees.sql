{{ config(
    materialized='table',
    schema='silver_db'
) }}

with raw_source as (
    select * 
    from workspace.source_db.source_raw_data
),

cleaned_data as (
    select 
        id,
        {{ clean_text('employee_name') }} as employee_name,
        {{ clean_text('department') }} as department,
        {{ handle_null_amount('salary') }} as salary,
        join_date
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
    cast(join_date as date) as join_date
from deduplicated_data
where row_num = 1