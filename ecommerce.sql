--Using the ecommerce database
--USE ecommerceDB;


--Brand table
CREATE TABLE Brand(
    brandId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    logo_url VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--Product table
CREATE TABLE Product(
    productId INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100)  NOT NULL,
    brand_id,
    FOREIGN KEY(brand_id) REFERENCES Brand(brand_id),
    basePrice DECIMAL(10,2),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

--Product_image table
CREATE TABLE Product_image(
    product_image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_item_id VARCHAR(200) NOT NULL,
    image_url VARCHAR(200),
    alt_text VARCHAR(200),
    is_primary BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--Attribute_category table
CREATE TABLE Attribute_category(
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--Attribute_type table
CREATE TABLE Attribute_type(
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(100),
    description TEXT
);

--Product_atrribute table
CREATE TABLE Product_atrribute(
    product_attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT ,
    attribute_category_id,
    attribute_type_id,
    attribute_name VARCHAR(100) ,
    atrribute_value VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(product_id) REFERENCES Product(product_id),
    FOREIGN KEY(attribute_category_id) REFERENCES Attribute_category(attribute_category_id),
    FOREIGN KEY(attribute_type_id) REFERENCES Attribute_type(attribute_type_id)
);

--Color table
CREATE TABLE Color(
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(50),
    color_code VARCHAR(7),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-Pproduct_category table
CREATE TABLE Product_category(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100),
    parent_category_id,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(parent_category_id) REFERENCES Product_category(category_id) ON DELETE SET NULL
);

--Size_category table
CREATE TABLE Size_category(
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--Product_item table
CREATE TABLE Product_item(
    product_item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id,
    is_active BOOLEAN DEFAULT TRUE,
    stock_keeping_unit VARCHAR(50) UNIQUE NOT NULL,
    stock_quantity INT,
    price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(product_id) REFERENCES Product(product_id)
);

--Size_option table
CREATE TABLE Size_option(
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id,
    size_label VARCHAR(50),
    sort_order INT,
    FOREIGN KEY(size_category_id) REFERENCES Size_category(size_category_id)
);

--Product_variation table
CREATE TABLE Product_variation(
    product_variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_item_id,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY(product_item_id) REFERENCES Product_item(product_item_id),
    FOREIGN KEY(color_id) REFERENCES Color(color_id),
    FOREIGN KEY(size_option_id) REFERENCES Size_option(size_option_id)
);
