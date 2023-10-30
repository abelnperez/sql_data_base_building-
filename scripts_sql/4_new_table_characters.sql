-- Creation new table CHARACTERS and deletion film_actor since it can´t be join as lack of PK  --

CREATE TABLE characters (
    actor_id INT NOT NULL,
    film_id INT NOT NULL,
    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);
-- Insert data in characters --
INSERT INTO characters (actor_id, film_id)
SELECT a.actor_id, f.film_id
FROM actor AS a
JOIN film_actor AS fa ON a.first_name = fa.first_name AND a.last_name = fa.last_name
JOIN film AS f ON f.title = fa.title;














