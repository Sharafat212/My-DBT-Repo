SELECT 
    COUNT(*) AS total_records
FROM {{ ref('silver_cleaned_dpt') }}