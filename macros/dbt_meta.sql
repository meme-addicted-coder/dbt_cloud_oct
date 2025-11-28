{% macro jodo(col1, col2) %}
        {{ col1 }} || ' ' || {{ col2 }}
{% endmacro %}

{% macro dbt_meta() %}
        '{{ invocation_id }}'::varchar  AS dbt_batch_id,
        '{{ run_started_at.strftime("%Y-%m-%d") }}'::timestamp AS dbt_batch_ts
{% endmacro %}


