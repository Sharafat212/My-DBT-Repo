{{ config(
    materialized='table'
) }}
SELECT 
emp_id AS Emp_id,

{{clean_text('first_name')}} As First_Name,
{{clean_text('last_name')}} As Last_Name,
{{clean_text('department')}} AS Department,
{{clean_text('status')}} As Status,
{{handle_null_amount('salary') }}AS Salary
from
{{ref('seeds_1')}}