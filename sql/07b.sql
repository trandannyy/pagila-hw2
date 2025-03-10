/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT f.title
FROM film f
JOIN inventory USING (film_id)
LEFT JOIN (
    SELECT country, film_id
    FROM inventory
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
    WHERE country = 'United States'
) s1 USING (film_id)
WHERE country IS NULL
GROUP BY f.title
ORDER BY f.title;

