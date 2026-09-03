SELECT 
    id,
    {{ clean_text('customer_name') }} AS customer_name,
    {{ handle_null_amount('amount') }} AS amount,
    CAST(order_date AS DATE) AS order_date
FROM {{ ref('bronze_raw_dpt') }}
WHERE id IS NOT NULL
QUALIFY ROW_NUMBER() OVER (PARTITION BY id ORDER BY order_date DESC) = 1