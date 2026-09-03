{{ config(
    materialized='table'
) }}

SELECT 
    Department,

    -- Employees count (Silver layer ka Emp_id)
    COUNT(Emp_id) AS Total_Employees,

    -- Total Salary (Silver layer ka Salary column)
    {{ calculate_total('Salary') }} AS Total_Salary,

    -- Average salary
    {{ calculate_average('Salary', 2) }} AS Avg_Salary

FROM {{ ref('silver_employees') }}

GROUP BY Department