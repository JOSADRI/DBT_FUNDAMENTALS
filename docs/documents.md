{% docs order_status %}

| status         | definition                                                 |
| -------------- | ---------------------------------------------------------- |
| placed         | Order placed but not yet shipped                           |
| shipped        | Order has been shipped but hasn't yet been delivered       |
| completed      | Order has been recived by customers                        |
| return_pending | Customer has indicated they would like to return this item |
| returned       | Item has been returned                                     |

{% enddocs %}

{% docs payment_methods %}

| method         | definition                                                 |
| -------------- | ---------------------------------------------------------- |
| credit_card    | Tarjeta de crédito                                         |
| coupon         | Cupón                                                      |
| bank_transfer  | Transferencia Bancaria                                     |
| gift_card      | Tarjeta de Regalo                                          |

{% enddocs %}