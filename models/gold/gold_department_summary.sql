{{ config(
    materialized='table',
    schema='gold_db'
) }}

with silver_data as (
    select * 
    from {{ ref('silver_employees') }}
)

select 
    department,
    count(distinct id) as total_employees,
    sum(salary) as total_salary,
    avg(salary) as avg_salary,
    max(salary) as max_salary,
    max(join_date) as latest_hire_date
from silver_data
group by department