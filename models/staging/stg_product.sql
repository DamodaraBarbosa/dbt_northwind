with
    product as (
        select *
        from {{ source('northwind', 'product' )}}
    )

select *
from product