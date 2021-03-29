CREATE TABLE "goods"(
  "Id" serial PRIMARY KEY,
  "Product_code" bigint NOT NULL,
  "Name" varchar(64) NOT NULL CHECK("Name" != '') UNIQUE,
  "Price" decimal(16, 2) NOT NULL CHECK ("Price" > 0)
);
/**/
DROP TABLE IF EXISTS "goods";
/**/
CREATE TABLE "customers"(
  "Id" serial PRIMARY KEY,
  "Name" varchar(64) NOT NULL CHECK("Name" != ''),
  "Address" varchar(256) NOT NULL CHECK ("Address" != ''),
  "Phone" bigint NOT NULL,
  UNIQUE ("Name", "Address", "Phone")
);
/**/
DROP TABLE IF EXISTS "customers";
/**/
CREATE TABLE "contract"(
  "Number" serial PRIMARY KEY,
  "Customer_name" integer REFERENCES "customers" ("Id"),
  "Goods_name" integer REFERENCES "goods"("Id"),
  "Date_of_creation" timestamp NOT NULL DEFAULT current_timestamp,
  "Planned_delivery" integer NOT NULL
);
/**/
DROP TABLE IF EXISTS "contract";
/**/
CREATE TABLE "orders"(
  "Code_o" serial PRIMARY KEY,
  "Number_of_contract" integer REFERENCES "contract"("Number"),
  "Shipped" boolean NOT NULL
);
/**/
DROP TABLE IF EXISTS "orders";
/**/
CREATE TABLE "shipment"(
  "Code_s" serial PRIMARY KEY,
  "The_date" timestamp NOT NULL DEFAULT current_timestamp
);
/**/
DROP TABLE IF EXISTS "shipment";
/**/
CREATE TABLE "shipment_to_orders_goods"(
  "Code_s" integer NOT NULL,
  "Code_o" integer NOT NULL,
  "Id" integer NOT NULL,
  FOREIGN KEY("Code_s") REFERENCES "shipment"("Code_s"),
  FOREIGN KEY("Code_o") REFERENCES "orders"("Code_o"),
  FOREIGN KEY("Id") REFERENCES "goods"("Id"),
  PRIMARY KEY("Code_s", "Code_o", "Id"),
  "Goods shipped" integer NOT NULL
);
/**/
DROP TABLE IF EXISTS "shipment_to_orders_goods";
/**/
/**/
/**/
CREATE TABLE "orders_to_goods"(
  "Code_o" integer NOT NULL,
  "Id" integer NOT NULL,
  FOREIGN KEY("Code_o") REFERENCES "orders"("Code_o"),
  FOREIGN KEY("Id") REFERENCES "goods"("Id"),
  PRIMARY KEY("Code_o", "Id")
);
/**/
DROP TABLE IF EXISTS "orders_to_goods";
/**/
CREATE TABLE "shipment_to_orders"(
  "Code_s" integer NOT NULL,
  "Code_o" integer NOT NULL,
  FOREIGN KEY("Code_s") REFERENCES "shipment"("Code_s"),
  FOREIGN KEY("Code_o") REFERENCES "orders"("Code_o"),
  PRIMARY KEY ("Code_s", "Code_o")
);
/**/
DROP TABLE IF EXISTS "shipment_to_orders";
/**/
CREATE TABLE "shipment_to_goods"(
  "Code_s" integer NOT NULL,
  "Id" integer NOT NULL,
  FOREIGN KEY("Code_s") REFERENCES "shipment"("Code_s"),
  FOREIGN KEY("Id") REFERENCES "goods"("Id"),
  PRIMARY KEY("Code_s", "Id")
);
/**/
DROP TABLE IF EXISTS "shipment_to_goods";