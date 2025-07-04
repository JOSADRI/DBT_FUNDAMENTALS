SELECT
    ORDER_ID,
    ID AS CUSTOMER_ID,
    AMOUNT
FROM
    {{ {{ source('stripe', 'payments') }} }}