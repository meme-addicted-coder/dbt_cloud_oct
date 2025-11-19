{% macro unload()%}
{% do run_query("create or replace stage stage_analytics ")%}
{%do run_query("copy into @stage_analytics from stg_nations partition by (REGION_ID) 
FILE_FORMAT = (TYPE=CSV COMPRESSION = NONE NULL_IF=(''))
HEADER = TRUE;")%}
{% endmacro %}
