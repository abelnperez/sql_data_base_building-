-- ACTOR data types update --
ALTER TABLE actor
MODIFY actor_id INT NOT NULL;
ALTER TABLE actor
MODIFY first_name VARCHAR(20) NOT NULL;
ALTER TABLE actor
MODIFY last_name VARCHAR(20) NOT NULL;

-- CATEGORY data types update --
ALTER TABLE category
MODIFY category_id INT NOT NULL;
ALTER TABLE category
MODIFY category_name VARCHAR(20) NOT NULL;

-- CUSTOMER data types update --
ALTER TABLE customer
MODIFY customer_id INT NOT NULL;
ALTER TABLE customer
MODIFY cu_fname VARCHAR(20) NOT NULL;
ALTER TABLE customer
MODIFY cu_lname VARCHAR(20) NOT NULL;
ALTER TABLE customer
MODIFY address VARCHAR(50) NOT NULL;
ALTER TABLE customer
MODIFY phone VARCHAR(50);
ALTER TABLE customer
MODIFY city VARCHAR(40) NOT NULL;
ALTER TABLE customer
MODIFY state VARCHAR(20) NOT NULL;
ALTER TABLE customer
MODIFY zip INT NOT NULL;

-- FILM data types update --
ALTER TABLE film
MODIFY film_id INT NOT NULL;
ALTER TABLE film
MODIFY title VARCHAR(50) NOT NULL;
ALTER TABLE film
MODIFY description mediumtext;
ALTER TABLE film
MODIFY release_year INT  NOT NULL;
ALTER TABLE film
MODIFY language_id INT  NOT NULL;
ALTER TABLE film
MODIFY rental_duration INT NOT NULL;
ALTER TABLE film
MODIFY rental_rate INT  NOT NULL;
ALTER TABLE film
MODIFY length INT  NOT NULL;
ALTER TABLE film
MODIFY replacement_cost INT NOT NULL;
ALTER TABLE film
MODIFY rating VARCHAR(50) NOT NULL;
ALTER TABLE film
MODIFY special_features VARCHAR(60) NOT NULL;

-- FILM_ACTOR data types update --
ALTER TABLE film_actor
MODIFY first_name VARCHAR(20) NOT NULL;
ALTER TABLE film_actor
MODIFY last_name VARCHAR(20) NOT NULL;
ALTER TABLE film_actor
MODIFY title VARCHAR(50) NOT NULL;
ALTER TABLE film_actor
MODIFY release_year INT NOT NULL;
ALTER TABLE film_actor
MODIFY category_id INT NOT NULL;

-- INVENTORY data types update --
ALTER TABLE inventory
MODIFY inventory_id INT NOT NULL;
ALTER TABLE inventory
MODIFY film_id INT NOT NULL;

-- LANGAUGE data types update --
ALTER TABLE language
MODIFY language_id INT NOT NULL;
ALTER TABLE language
MODIFY language_name VARCHAR(20) NOT NULL;

-- RENTAL data types update --
ALTER TABLE rental
MODIFY rental_id INT NOT NULL;
ALTER TABLE rental
MODIFY rental_date datetime;
ALTER TABLE rental
MODIFY inventory_id INT NOT NULL;
ALTER TABLE rental
MODIFY customer_id INT NOT NULL;
ALTER TABLE rental
MODIFY return_date datetime;
ALTER TABLE rental
MODIFY staff_id INT NOT NULL;


