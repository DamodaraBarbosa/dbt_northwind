with
    category as (
        select *
        from {{ source('northwind', 'category') }}
    )

select *
from category