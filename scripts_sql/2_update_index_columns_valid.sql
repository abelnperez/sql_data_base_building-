-- Añado indices a las columnas--

-- ALTER TABLE category -- realizamo una alteracion en la tabla category --
-- ADD INDEX idx_category_id (category_id); -- inluimos un indice que mejora la velocidad de recuperacion de filas a category_id --

-- ALTER TABLE actor
-- ADD INDEX idx_actor_id (actor_id);

-- ALTER TABLE customer
-- ADD INDEX idx_customer_id (customer_id);

-- ALTER TABLE film
-- ADD INDEX idx_film_id (film_id);

-- ALTER TABLE film_actor NO LE PONGO INDICE 
-- ADD INDEX idx_film_actor (film_actor);

ALTER TABLE inventory
ADD INDEX idx_inventory_id (inventory_id);

ALTER TABLE rental
ADD INDEX idx_rental_id (rental_id);

ALTER TABLE language
ADD INDEX idx_language_id (language_id);


