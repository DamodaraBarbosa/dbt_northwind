{{ config(error_if = '>10')}}
with
    orders as (
        select *
        from {{ ref("stg_orders") }}
    )

    , order_details as(
        select *
        from {{ ref("stg_order_details") }}
    )

    , test_that as (
        select
            orders.order_date
            , round(sum(order_details.unit_price*order_details.quantity), 2) as revenue
        from orders
        left join order_details on orders.order_id = order_details.order_id
        group by order_date
        order by order_date
    )

select *
from test_that
where revenue = 0