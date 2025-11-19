{% macro empname() %}
    {% set r = run_query("select EMPLOYEE_NAME from " ~ ref('stg_employee')) %}
    {{ return(r.rows if r else []) }}
{% endmacro %}
