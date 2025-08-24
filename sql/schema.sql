-- -----------------------------
-- Table: customers
-- Stores customer information
-- -----------------------------
CREATE TABLE customers (
    cust_id INT NOT NULL PRIMARY KEY,
    cust_firstname VARCHAR(50) NOT NULL,
    cust_lastname VARCHAR(50) NOT NULL
);

-- -----------------------------
-- Table: address
-- Stores delivery addresses for customers
-- -----------------------------
CREATE TABLE address (
    add_id INT NOT NULL PRIMARY KEY,
    delivery_address1 VARCHAR(200) NOT NULL,
    delivery_address2 VARCHAR(200),
    delivery_city VARCHAR(50) NOT NULL,
    delivery_zipcode VARCHAR(20) NOT NULL
);

-- -----------------------------
-- Table: item
-- Stores menu items
-- -----------------------------
CREATE TABLE item (
    item_id VARCHAR(10) NOT NULL PRIMARY KEY,
    sku VARCHAR(20) NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    item_cat VARCHAR(100) NOT NULL,
    item_size VARCHAR(10) NOT NULL,
    item_price DECIMAL(10,2) NOT NULL
);

-- -----------------------------
-- Table: ingredient
-- Stores ingredients used in recipes
-- -----------------------------
CREATE TABLE ingredient (
    ing_id VARCHAR(10) NOT NULL PRIMARY KEY,
    ing_name VARCHAR(200) NOT NULL,
    ing_weight DECIMAL(6,2) NOT NULL,
    ing_meas VARCHAR(20) NOT NULL,
    ing_price DECIMAL(6,2) NOT NULL
);

-- -----------------------------
-- Table: orders
-- Tracks customer orders with items, quantity, and delivery
-- -----------------------------
CREATE TABLE orders (
    row_id INT NOT NULL PRIMARY KEY,
    order_id VARCHAR(20) NOT NULL,
    created_at DATETIME NOT NULL,
    item_name VARCHAR(50) NOT NULL,
    item_cat VARCHAR(50) NOT NULL,
    item_size VARCHAR(20) NOT NULL,
    item_price DECIMAL(5,2) NOT NULL,
    quantity INT NOT NULL,
    cust_id INT NOT NULL,
    delivery BOOLEAN NOT NULL,
    add_id INT NOT NULL,
    item_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id),
    FOREIGN KEY (add_id) REFERENCES address(add_id),
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- -----------------------------
-- Table: recipe
-- Stores ingredients required per menu item
-- -----------------------------
CREATE TABLE recipe (
    row_id INT NOT NULL PRIMARY KEY,
    recipe_id VARCHAR(20) NOT NULL,  -- links to item.sku
    ing_id VARCHAR(10) NOT NULL,     -- links to ingredient.ing_id
    quantity DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES item(sku),
    FOREIGN KEY (ing_id) REFERENCES ingredient(ing_id)
);

-- -----------------------------
-- Table: inventory
-- Stores current stock levels for ingredients
-- -----------------------------
CREATE TABLE inventory (
    inv_id INT NOT NULL PRIMARY KEY,
    item_id VARCHAR(10) NOT NULL,    -- links to ingredient.ing_id
    quantity INT NOT NULL,
    FOREIGN KEY (item_id) REFERENCES ingredient(ing_id)
);

-- -----------------------------
-- Table: staff
-- Stores staff information and hourly rates
-- -----------------------------
CREATE TABLE staff (
    staff_id VARCHAR(20) NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(100) NOT NULL,
    hourly_rate DECIMAL(5,2) NOT NULL
);

-- -----------------------------
-- Table: shift
-- Stores shift timings
-- -----------------------------
CREATE TABLE shift (
    shift_id VARCHAR(20) NOT NULL PRIMARY KEY,
    day_of_week VARCHAR(10) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);

-- -----------------------------
-- Table: rota
-- Assigns staff to shifts on specific dates
-- -----------------------------
CREATE TABLE rota (
    row_id INT NOT NULL PRIMARY KEY,
    rota_id VARCHAR(20) NOT NULL,
    date DATETIME NOT NULL,
    shift_id VARCHAR(20) NOT NULL,
    staff_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (shift_id) REFERENCES shift(shift_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
