/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

-- SELECT title
-- FROM film
-- WHERE 'Behind the Scenes' IN (
--     SELECT unnest(special_features)
--     FROM film f2
--     WHERE film.film_id = f2.film_id
-- )
-- 
-- SELECT title
-- FROM film
-- WHERE 'Trailers' IN (
--     SELECT unnest(special_features)
--     FROM film f2
--     WHERE film.film_id = f2.film_id
-- )

SELECT s1.title
FROM (SELECT title
FROM film
WHERE 'Behind the Scenes' IN (
    SELECT unnest(special_features)
    FROM film f2
    WHERE film.film_id = f2.film_id
)) AS s1
INNER JOIN (
    SELECT title
FROM film
WHERE 'Trailers' IN (
    SELECT unnest(special_features)
    FROM film f2
    WHERE film.film_id = f2.film_id
)) AS s2
ON s1.title = s2.title

ORDER BY s1.title;
