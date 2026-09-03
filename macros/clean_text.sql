{% macro clean_text(column_name) %}
    trim(upper({{ column_name }}))
{% endmacro %}