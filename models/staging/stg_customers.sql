with
    customers as (
        select customer_id
        , company_name
        , contact_name
        , adress
        , city
        , country
        from {{source('northwind', 'customers')}}
    )

select *
from customers