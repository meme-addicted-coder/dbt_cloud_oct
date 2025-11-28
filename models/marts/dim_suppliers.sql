{{ config(
    materialized = 'incremental'
) }}
with sup as(
    select 
    supplier_id,
    supplier_name,account_balance,phone_number,supplier_address,
    nation_name,
    region_name,
    supplier_updated_time
    from {{ ref('int_suppliers')}}
    {% if is_incremental()%}
    where supplier_updated_time < (select max(supplier_updated_time) from {{this}})
    {% endif %}

)

select *,{{ dbt_meta() }}
from sup
