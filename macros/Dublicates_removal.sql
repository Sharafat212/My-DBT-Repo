{% macro deduplicate(partition_by, order_by) %}
    row_number() over (
        partition by {{ partition_by }} 
        order by {{ order_by }} desc
    )
{% endmacro %}