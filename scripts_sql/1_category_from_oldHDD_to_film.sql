ALTER TABLE FILM
ADD category_id INT;

UPDATE film as f
SET f.category_id = (
SELECT fa.category_id
FROM film_actor as fa
WHERE f.title = fa.title
LIMIT 1
);
    
UPDATE film as f
SET category_id = 17
WHERE category_id IS NULL;