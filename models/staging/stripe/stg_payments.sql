SELECT
    ORDERID,
    ID AS CUSTOMER_ID,
    AMOUNT
FROM
    {{ source('stripe', 'payments') }}