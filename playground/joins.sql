SELECT
    customers.name,
    customers.email,
    orders.order_date,
    orders.total_amount
FROM
    customers
JOIN_TYPE JOIN orders ON customers.id = orders.customer_id;

# If JOIN_TYPE is 'INNER':
-- Customer `Dont Order` is  NOT returned
-- Order without customer is NOT returned
-- Because it returns only the rows that have matching values in both tables

# If JOIN_TYPE is 'LEFT':
-- Customer `Dont Order` is returned
-- Order without customer is NOT returned
-- Because it returns all the rows from the left table
-- and the matched rows from the right table

# If JOIN_TYPE is 'RIGHT':
-- Customer `Dont Order` is NOT returned
-- Order without customer is returned
-- Because it returns all the rows from the right table
-- and the matched rows from the left table

# If JOIN_TYPE is 'FULL':
-- Customer `Dont Order` is returned
-- Order without customer is returned
-- Because it returns all rows from both tables
