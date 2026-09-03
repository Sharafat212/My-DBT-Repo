{% macro calculate_total(column_name) %}
    SUM({{ column_name }})
{% endmacro %}