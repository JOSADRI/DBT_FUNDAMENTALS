with customers as (
    SELECT * FROM {{ ref('stg_customers') }}
),
orders as (
    SELECT * FROM {{ ref('stg_orders') }}
),
payments as (
    SELECT * FROM {{ ref('stg_payments') }}
),
customer_order as (
    SELECT
        A.CUSTOMER_ID,
        MIN(A.ORDER_DATE) AS FIRST_ORDER_DATE,
        MAX(A.ORDER_DATE) AS MOST_RECENT_ORDER_DATE,
        COUNT(A.ORDER_ID) AS NUMBER_OF_ORDERS,
        SUM(B.AMOUNT) AS LIFETIME_VALUE
    FROM
        orders A INNER JOIN payments B USING(CUSTOMER_ID)
    GROUP BY 1
),
final as (
    SELECT
        customers.CUSTOMER_ID,
        customers.FIRST_NAME,
        customers.LAST_NAME,
        customer_order.FIRST_ORDER_DATE,
        customer_order.MOST_RECENT_ORDER_DATE,
        coalesce(customer_order.NUMBER_OF_ORDERS,0) as NUMBER_OF_ORDERS,
        LIFETIME_VALUE

    FROM
        customers LEFT JOIN customer_order USING(CUSTOMER_ID)
)

SELECT * FROM final