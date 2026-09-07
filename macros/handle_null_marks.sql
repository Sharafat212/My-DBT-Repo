{% macro handle_null_marks(column_name) %}
    COALESCE({{ column_name }}, 0)
{% endmacro %}
