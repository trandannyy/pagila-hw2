/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT first_name || ' ' || last_name as "Actor Name"
FROM actor
WHERE 'Behind the Scenes' IN (
    SELECT unnest(special_features)
    FROM film
)
GROUP BY "Actor Name"
ORDER BY "Actor Name";
