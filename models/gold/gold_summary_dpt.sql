SELECT 
    {{ handle_null_amount('COUNT(*)') }} AS total_records,
    SUM({{ handle_null_amount('amount') }}) AS total_amount
FROM {{ ref('silver_cleaned_dpt') }}