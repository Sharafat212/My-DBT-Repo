SELECT 
    {{ handle_null_numeric('COUNT(*)') }} AS total_records,
    SUM({{ handle_null_numeric('amount') }}) AS total_amount
FROM {{ ref('silver_cleaned_dpt') }}