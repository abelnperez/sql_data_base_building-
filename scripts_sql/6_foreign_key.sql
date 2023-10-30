-- Relation between film and category;
ALTER TABLE film
ADD CONSTRAINT fk_film_category
FOREIGN KEY (category_id)
REFERENCES category(category_id);

-- Relation between film and language;
ALTER TABLE film
ADD CONSTRAINT fk_film_language
FOREIGN KEY (language_id)
REFERENCES language(language_id);

-- Relation between inventory and film;
ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_film
FOREIGN KEY (film_id)
REFERENCES film(film_id);

-- Relation between rental and inventory
ALTER TABLE rental
ADD CONSTRAINT fk_rental_inventory
FOREIGN KEY (inventory_id)
REFERENCES inventory(inventory_id);

-- Relation between rental and customer
ALTER TABLE rental
ADD CONSTRAINT fk_rental_customer
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);

-- Relation between rental and staff
ALTER TABLE rental
ADD CONSTRAINT fk_rental_staff
FOREIGN KEY (staff_id)
REFERENCES staff(staff_id);

