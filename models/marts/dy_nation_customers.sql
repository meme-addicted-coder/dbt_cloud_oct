{{ config(
    materialized='dynamic_table',
    target_lag='5 minutes',
    snowflake_warehouse='transform_wh',
    refresh_mode= 'incremental'
)}}

with dy as (
    SELECT
    n.name,
    COUNT(c.customer_id)      AS total_customers,
    SUM(c.account_balance)     AS total_account_balance
FROM {{ ref('stg_customer') }} c
JOIN {{ ref('stg_nations') }} n
    ON c.nation_id = n.nation_id
GROUP BY
    n.name
ORDER BY
    n.name
)
select * from dy
