{{ config(
    materialized = 'dynamic_table',
    target_lag = '5 minutes',
    snowflake_warehouse = 'TRANSFORM_WH'
) }}

with dy as (
    select
        n.name,
        count(c.customer_id) as total_customers,
        sum(c.account_balance) as total_account_balance
    from {{ ref('stg_customer') }} c
    join {{ ref('stg_nations') }} n
        on c.nation_id = n.nation_id
    group by n.name
)

select * from dy

