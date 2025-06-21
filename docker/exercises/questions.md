## Practice Questions

### Lessons 1-4

1. Write a JOIN query to return all orders with user name and product name.

```sql
SELECT 
  CONCAT(users.first_name, ' ', users.last_name) AS full_name,
  GROUP_CONCAT(products.product_name SEPARATOR ', ') AS products_ordered
FROM users
JOIN orders ON users.id = orders.user_id
JOIN products ON orders.product_id = products.product_id
GROUP BY full_name
;
```

2. Write a JOIN query to list all users who haven’t made any orders (hint: LEFT JOIN + WHERE IS NULL).

```sql
SELECT * FROM users
JOIN orders ON users.id= orders.user_id
WHERE orders.order_id IS NULL
;
```

3. Select full names of all users and show their age (use YEAR() or DATEDIFF()).

```sql
SELECT 
  CONCAT(first_name, ' ', last_name) AS full_name,
  TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age
FROM users
;
```
4. Select top 3 most expensive products.

```sql
SELECT product_id, product_name, product_price
FROM products
ORDER BY product_price DESC
LIMIT 3
;
```

5. Count how many users are in your table.

```sql
SELECT COUNT(id) AS users_count FROM users
;
```

6. Group users by birth year and show how many were born in each year.

```sql
SELECT 
  YEAR(birth_date) AS birth_year,
  COUNT(*) AS total_users
FROM users
GROUP BY YEAR(birth_date)
ORDER BY birth_year
;
```

7. List products with price over 300, sorted by price descending.

```sql
SELECT product_id, product_name, product_price
FROM products
WHERE product_price > 300
ORDER BY product_price DESC
;
```

8. Who are the top 5 users by number of orders?

```sql
SELECT 
    CONCAT(users.first_name, ' ', users.last_name) AS full_name,
    COUNT(orders.order_id) AS total_orders
FROM users
JOIN orders ON users.id = orders.user_id
GROUP BY users.id, users.first_name, users.last_name
ORDER BY total_orders DESC
LIMIT 3
;
```

9. What’s the average age of users who ordered a specific product?

```sql
SELECT
    products.product_name,
    AVG(TIMESTAMPDIFF(YEAR, users.birth_date, CURDATE())) AS average_age
FROM users
JOIN orders ON users.id = orders.user_id
JOIN products ON orders.product_id = products.product_id
GROUP BY products.product_name
;
```

10. Which product has the highest total orders?

```sql
SELECT 
  products.product_name,
  COUNT(orders.order_id) AS total_orders
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_orders DESC
LIMIT 1
;
```