{% macro create_db(db_name) %}
  {% set query %}
    CREATE DATABASE IF NOT EXISTS {{ db_name }};
  {% endset %}

  {% do run_query(query) %}
  {% do log("Database '" ~ db_name ~ "' created successfully!", info=True) %}
{% endmacro %}
-- isko change ni krna just terminal main command pass kry or db create kr lain 
--dbt run-operation create_db --args "{db_name: Name here}"