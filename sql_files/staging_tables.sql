CREATE SCHEMA IF NOT EXISTS stg;

CREATE SCHEMA IF NOT EXISTS dw;

CREATE TABLE IF NOT EXISTS stg.orders (
  order_id text,
  customer_id text,
  order_status text,
  order_purchase_timestamp timestamp,
  order_approved_at timestamp,
  order_delivered_carrier_date timestamp,
  order_delivered_customer_date timestamp,
  order_estimated_delivery_date timestamp
);

CREATE TABLE IF NOT EXISTS stg.order_items (
  order_id text,
  order_item_id int,
  product_id text,
  seller_id text,
  shipping_limit_date timestamp,
  price numeric,
  freight_value numeric
);

CREATE TABLE IF NOT EXISTS stg.order_payments (
  order_id text,
  payment_sequential int,
  payment_type text,
  payment_installments int,
  payment_value numeric
);


CREATE TABLE IF NOT EXISTS stg.customers (
  customer_id text,
  customer_unique_id text,
  customer_zip_code_prefix int,
  customer_city text,
  customer_state text
);


CREATE TABLE IF NOT EXISTS stg.products (
  product_id text,
  product_category_name text,
  product_name_lenght int,
  product_description_lenght int,
  product_photos_qty int,
  product_weight_g int,
  product_length_cm int,
  product_height_cm int,
  product_width_cm int
);

