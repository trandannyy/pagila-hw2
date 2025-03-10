/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */

SELECT
    "rank",
    "title",
    "revenue",
    "total revenue",
    to_char(100*"total revenue"/sum(revenue) OVER (), 'FM900.00') AS "percent revenue"
FROM (
    SELECT
    RANK () OVER (
        ORDER BY COALESCE(SUM(amount), 0.00) DESC
     ) AS "rank",
    title,
    COALESCE(SUM(amount), 0.00) AS "revenue",
    SUM(COALESCE(SUM(amount), 0.00)) OVER (
        ORDER BY COALESCE(SUM(amount), 0.00) DESC
    ) AS "total revenue"
    FROM film
    LEFT JOIN inventory USING (film_id)
    LEFT JOIN rental USING (inventory_id)
    LEFT JOIN payment USING (rental_id)
    GROUP BY title
    ORDER BY revenue DESC, title
) s1;

