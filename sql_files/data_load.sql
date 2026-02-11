COPY stg.orders FROM '/tmp/data_files/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;
COPY stg.order_items FROM '/tmp/data_files/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;
COPY stg.order_payments FROM '/tmp/data_files/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;
COPY stg.customers FROM '/tmp/data_files/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;
COPY stg.products FROM '/tmp/data_files/olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

