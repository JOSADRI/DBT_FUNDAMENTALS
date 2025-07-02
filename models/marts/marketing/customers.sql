/*{{
  config(
    materialized='view'
  )
}}
*/
with customers as (
    SELECT * FROM {{ ref('stg_customers') }}
),
orders as (
    SELECT * FROM {{ ref('stg_orders') }}
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