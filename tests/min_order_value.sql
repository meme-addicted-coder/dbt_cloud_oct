with orders as (
    select * from Analytics.dbt_bhabna.stg_orders
)
select order_id, total_price from orders where total_price <= 800