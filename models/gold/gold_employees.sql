SELECT 
    Department,
    
    -- Employees count
    COUNT(id) AS Total_Employees,
    
    -- Total Salary
    {{ calculate_total('salary') }} AS Total_Salary,
    
    -- Average salary
    {{ calculate_average('salary', 2) }} AS Avg_Salary

FROM {{ ref('silver_employees') }}

GROUP BY Department