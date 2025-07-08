SELECT
    ORDERID as ORDER_ID,
    ID AS PAYMENTS_ID,
    AMOUNT
FROM
    {{ source('stripe', 'payments') }}