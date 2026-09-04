/** Yeh macro Gold layer mein automatic count,
 sum, avg, aur max metrics generate karega:**/

 {% macro aggregate_metrics(group_col, sum_col) %}
    {{ group_col }},
    count(*) as total_records,
    sum({{ sum_col }}) as total_amount,
    avg({{ sum_col }}) as avg_amount,
    max({{ sum_col }}) as max_amount
{% endmacro %}