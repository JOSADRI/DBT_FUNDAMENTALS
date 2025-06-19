with customers as (
    SELECT
        ID AS CUSTOMER_ID,
        FIRST_NAME,
        LAST_NAME
    FROM `dbt-fundamentals-463313`.jaffle_shop.customers
),
orders as (
    SELECT
        ID AS ORDER_ID,
        USER_ID AS CUSTOMER_ID,
        ORDER_DATE,
        STATUS
    FROM
        `dbt-fundamentals-463313`.jaffle_shop.orders
),
customer_order as (
    SELECT
        CUSTOMER_ID,
        MIN(ORDER_DATE) AS FIRST_ORDER_DATE,
        MAX(ORDER_DATE) AS MOST_RECENT_ORDER_DATE,
        COUNT(ORDER_ID) AS NUMBER_OF_ORDERS
    FROM
        orders
    GROUP BY 1
),
final as (
    SELECT
        customers.CUSTOMER_ID,
        customers.FIRST_NAME,
        customers.LAST_NAME,
        customer_order.FIRST_ORDER_DATE,
        customer_order.MOST_RECENT_ORDER_DATE,
        coalesce(customer_order.NUMBER_OF_ORDERS,0) as NUMBER_OF_ORDERS
    FROM
        customers LEFT JOIN customer_order USING(CUSTOMER_ID)
)

SELECT * FROM final