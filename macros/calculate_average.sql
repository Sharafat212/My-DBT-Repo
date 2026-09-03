{% macro calculate_average(column_name, decimals=2) %}
    ROUND(AVG({{ column_name }}), {{ decimals }})
{% endmacro %}