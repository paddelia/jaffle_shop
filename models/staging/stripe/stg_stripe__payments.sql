-- stg_stripe__payments.sql

with

source as (

    select * from {{ source('stripe','payments') }}

),

renamed as (

    select
        -- ids
        id as payment_id,
        order_id as order_id,

        -- strings
        payment_method as payment_method,
        case
            when payment_method in ('stripe', 'paypal', 'credit_card', 'gift_card') then 'credit'
            else 'cash'
        end as payment_type,
        [status],

        -- numerics
        amount as amount_cents,
        amount / 100.0 as amount,
        
        -- booleans
        case
            when status = 'successful' then true
            else false
        end as is_completed_payment,

        -- dates
        date_trunc('day', created) as created_date,

        -- timestamps
        created::timestamp_ltz as created_at

    from source

)

select * from renamed