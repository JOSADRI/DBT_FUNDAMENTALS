SELECT
    ORDER_ID,
    CUSTOMER_ID,
    AMOUNT
FROM
    {{ ref('stg_payments') }}