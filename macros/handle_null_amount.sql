-- Null Values k liye 
{% macro handle_null_amount(column_name) %}
    coalesce({{ column_name }}, 0)
{% endmacro %}