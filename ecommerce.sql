--Using the ecommerce database
--USE ecommerceDB;


--brand table
CREATE TABLE brand(
    brandId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    logo_url VARCHAR(200),
    website_url VARCHAR(200)
);

--product table
CREATE TABLE product(
    ProductId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)  NOT NULL,
    basePrice DECIMAL(10,2),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    brandId INT,
    FOREIGN KEY(brandId) REFERENCES brand(brandId)
    );

--product_image table
CREATE TABLE product_image(
    imageId INT PRIMARY KEY AUTO_INCREMENT,
    file_path VARCHAR(200) NOT NULL,
    productId INT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY(productId) REFERENCES Product(productId) 
);

--attribute_category table
CREATE TABLE attribute_category(
    attrCategId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT
);

--attribute_type table
CREATE TABLE attribute_type(
    typeId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    attrCategId INT,
    FOREIGN KEY(attrCategId) REFERENCES attribute_category(attrCategId)
);

--product_atrribute table
CREATE TABLE product_atrribute(
    attributeId INT PRIMARY KEY AUTO_INCREMENT,
    productId INT 
    attribute_name VARCHAR(100) 
    atrribute_value VARCHAR(100)
    unit VARCHAR(50),
    FOREIGN KEY(productId) REFERENCES product(productId)
);

--color table
CREATE TABLE color(
    colorId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    hexValue VARCHAR(7),
    productId INT,
    FOREIGN KEY(productId) REFERENCES product(ProductId)
);

--product_category table
CREATE TABLE product_category(
    categoryId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    category_type VARCHAR(100)
);

--size_category table
CREATE TABLE size_category(
    sizeId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    description TEXT,
    categoryId INT,
    FOREIGN KEY(categoryId) REFERENCES product_category(categoryId)
);

--product_item table
CREATE TABLE product_item(
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    stock_quantity INT,
    is_active BOOLEAN DEFAULT TRUE,
    productId INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sizeId INT,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    colorId INT,
    FOREIGN KEY(productId) REFERENCES product(productId),
    FOREIGN KEY(sizeId) REFERENCES size_category(sizeId),
    FOREIGN KEY(colorId) REFERENCES color(colorId),
);

--product_variation table
CREATE TABLE product_variation(
    variationId INT PRIMARY KEY AUTO_INCREMENT,
    variation_type VARCHAR(100),
    variation_value VARCHAR(100),
    colorId INT,
    sizeId INT,
    FOREIGN KEY(sizeId) REFERENCES size_category(sizeId),
    FOREIGN KEY(colorId) REFERENCES color(colorId)
);

--size_option table
CREATE TABLE size_option(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    value VARCHAR(50),
    description TEXT,
    sizeId INT,
    FOREIGN KEY(sizeId) REFERENCES size_category(sizeId)
);