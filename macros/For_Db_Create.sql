{% macro create_source_db() %}
  {% set query %}
    CREATE DATABASE IF NOT EXISTS Source_db;
  {% endset %}

  {% do run_query(query) %}
  {% do log("Database 'Source_db' created successfully!", info=True) %}
{% endmacro %}