SELECT COUNT(*) AS total_suppliers
FROM suppliers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_purchase_orders
FROM purchase_orders;

SELECT COUNT(*) AS inventory_records
FROM inventory;

SELECT COUNT(*) AS total_payments
FROM payments;

SELECT
ROUND(SUM(procurement_cost),2) AS total_procurement_spend
FROM purchase_orders;

SELECT
ROUND(AVG(procurement_cost),2) AS avg_procurement_cost
FROM purchase_orders;

SELECT
SUM(quantity) AS total_quantity
FROM purchase_orders;

SELECT
ROUND(AVG(lead_time),2) AS avg_lead_time
FROM purchase_orders;

SELECT
ROUND(AVG(delivery_delay),2) AS avg_delivery_delay
FROM purchase_orders;

SELECT
s.supplier_name,
ROUND(SUM(po.procurement_cost),2) AS total_spend
FROM purchase_orders po
JOIN products p
ON po.product_id=p.product_id
JOIN suppliers s
ON p.supplier_id=s.supplier_id
GROUP BY s.supplier_name
ORDER BY total_spend DESC;

SELECT
supplier_name,
supplier_rating
FROM suppliers
ORDER BY supplier_rating DESC;

SELECT
s.supplier_name,
COUNT(*) AS total_orders
FROM purchase_orders po
JOIN products p
ON po.product_id=p.product_id
JOIN suppliers s
ON p.supplier_id=s.supplier_id
GROUP BY s.supplier_name
ORDER BY total_orders DESC;

SELECT
s.supplier_name,
ROUND(AVG(po.procurement_cost),2) AS avg_cost
FROM purchase_orders po
JOIN products p
ON po.product_id=p.product_id
JOIN suppliers s
ON p.supplier_id=s.supplier_id
GROUP BY s.supplier_name
ORDER BY avg_cost DESC;

SELECT
contract_type,
COUNT(*) AS suppliers
FROM suppliers
GROUP BY contract_type;

SELECT
p.product_name,
SUM(po.quantity) AS quantity
FROM purchase_orders po
JOIN products p
ON po.product_id=p.product_id
GROUP BY p.product_name
ORDER BY quantity DESC
LIMIT 10;

SELECT
product_name,
product_price
FROM products
ORDER BY product_price DESC
LIMIT 10;

SELECT
p.category_name,
ROUND(SUM(po.procurement_cost),2) AS total_spend
FROM purchase_orders po
JOIN products p
ON po.product_id=p.product_id
GROUP BY p.category_name
ORDER BY total_spend DESC;

SELECT
category_name,
COUNT(*) AS products
FROM products
GROUP BY category_name
ORDER BY products DESC;

SELECT
category_name,
ROUND(AVG(product_price),2) AS avg_price
FROM products
GROUP BY category_name;

SELECT
inventory_status,
COUNT(*) AS products
FROM inventory
GROUP BY inventory_status;

SELECT
COUNT(*) AS reorder_required
FROM inventory
WHERE inventory_status='Reorder Required';

SELECT
warehouse,
SUM(inventory_level) AS stock
FROM inventory
GROUP BY warehouse;

SELECT
ROUND(AVG(safety_stock),2) AS avg_safety_stock
FROM inventory;

SELECT
p.product_name,
i.inventory_level
FROM inventory i
JOIN products p
ON i.product_id=p.product_id
ORDER BY inventory_level DESC
LIMIT 10;

SELECT
delivery_status,
COUNT(*) AS orders
FROM purchase_orders
GROUP BY delivery_status;

SELECT
shipping_mode,
COUNT(*) AS shipments
FROM purchase_orders
GROUP BY shipping_mode;

SELECT
shipping_mode,
ROUND(AVG(delivery_delay),2) AS avg_delay
FROM purchase_orders
GROUP BY shipping_mode;

SELECT
order_country,
ROUND(SUM(procurement_cost),2) AS spend
FROM purchase_orders
GROUP BY order_country
ORDER BY spend DESC
LIMIT 10;

SELECT
order_region,
ROUND(SUM(procurement_cost),2) AS spend
FROM purchase_orders
GROUP BY order_region
ORDER BY spend DESC;

SELECT
payment_status,
COUNT(*) AS payments
FROM payments
GROUP BY payment_status;

SELECT
COUNT(*) AS pending_payments
FROM payments
WHERE payment_status='Pending';

SELECT
COUNT(*) AS overdue_payments
FROM payments
WHERE payment_status='Overdue';

SELECT
order_id,
procurement_cost
FROM purchase_orders
ORDER BY procurement_cost DESC
LIMIT 10;

SELECT
YEAR(order_date) AS year,
MONTH(order_date) AS month,
ROUND(SUM(procurement_cost),2) AS total_spend
FROM purchase_orders
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY year,month;

SELECT
YEAR(order_date) AS year,
MONTH(order_date) AS month,
COUNT(*) AS total_orders
FROM purchase_orders
GROUP BY YEAR(order_date),MONTH(order_date);

SELECT
s.supplier_name,
ROUND(AVG(p.product_price),2) AS avg_price
FROM products p
JOIN suppliers s
ON p.supplier_id=s.supplier_id
GROUP BY s.supplier_name;

SELECT
s.supplier_name,
SUM(po.quantity) AS total_quantity
FROM purchase_orders po
JOIN products p
ON po.product_id=p.product_id
JOIN suppliers s
ON p.supplier_id=s.supplier_id
GROUP BY s.supplier_name
ORDER BY total_quantity DESC
LIMIT 5;

SELECT
p.product_name,
i.inventory_level
FROM inventory i
JOIN products p
ON i.product_id=p.product_id
ORDER BY inventory_level
LIMIT 10;

SELECT
s.supplier_name,
ROUND(AVG(po.lead_time),2) AS avg_lead_time
FROM purchase_orders po
JOIN products p
ON po.product_id=p.product_id
JOIN suppliers s
ON p.supplier_id=s.supplier_id
GROUP BY s.supplier_name
ORDER BY avg_lead_time;