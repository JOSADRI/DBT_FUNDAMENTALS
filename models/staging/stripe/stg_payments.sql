SELECT
    ORDERID as ORDER_ID,
    ID AS PAYMENTS_ID,
    AMOUNT,
    PAYMENTMETHOD AS PAYMENT_METHOD
FROM
    {{ source('stripe', 'payments') }}