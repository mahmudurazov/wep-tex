CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE warehouses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    address TEXT NOT NULL
);

CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    description TEXT,
    specs JSONB,
    weight NUMERIC,
    barcode TEXT
);

CREATE TABLE inventory (
    warehouse_id UUID REFERENCES warehouses(id),
    product_id UUID REFERENCES products(id),
    quantity INT,
    price NUMERIC,
    discount NUMERIC DEFAULT 0,
    PRIMARY KEY (warehouse_id, product_id)
);

CREATE TABLE analytics (
    warehouse_id UUID,
    product_id UUID,
    sold_quantity INT,
    total_sum NUMERIC,
    PRIMARY KEY (warehouse_id, product_id)
);
