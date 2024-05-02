CREATE TABLE "goods"(
  "Id_g" serial PRIMARY KEY,
  "Product_code" bigint NOT NULL,
  "Name" varchar(64) NOT NULL CHECK("Name" != '') UNIQUE,
  "Price" decimal(16, 2) NOT NULL CHECK ("Price" > 0)
);
/**/
DROP TABLE "goods";
/**/
CREATE TABLE "customers"(
  "Id_c" serial PRIMARY KEY,
  "Name" varchar(64) NOT NULL CHECK("Name" != ''),
  "Address" varchar(256) NOT NULL CHECK ("Address" != ''),
  "Phone" bigint NOT NULL,
  UNIQUE ("Name", "Address", "Phone")
);
/**/
DROP TABLE "customers";
/**/
CREATE TABLE "contract"(
  "Number" serial PRIMARY KEY,
  "Customer_name" integer REFERENCES "customers" ("Id_c"),
  "Goods_name" integer REFERENCES "goods"("Id_g"),
  "Date_of_creation" timestamp NOT NULL DEFAULT current_timestamp,
  "Planned_delivery" integer NOT NULL
);
/**/
DROP TABLE "contract";
/**/
CREATE TABLE "orders"(
  "Code_o" serial PRIMARY KEY,
  "Name_customer" integer REFERENCES "customers"("Id_c"),
  "Number_of_contract" integer REFERENCES "contract"("Number"),
  "Goods_name" integer REFERENCES "goods"("Id_g"),
  "Shipped" boolean NOT NULL
);
/**/
DROP TABLE "orders";
/**/
CREATE TABLE "shipment"(
  "Code_s" serial PRIMARY KEY,
  "Code_o" integer REFERENCES "orders"("Code_o"),
  "The_date" timestamp NOT NULL DEFAULT current_timestamp
);
/**/
DROP TABLE "shipment";
/**/
CREATE TABLE "shipment_to_orders"(
  "Code_s" integer NOT NULL,
  "Code_o" integer NOT NULL,
  FOREIGN KEY("Code_s") REFERENCES "shipment"("Code_s"),
  FOREIGN KEY("Code_o") REFERENCES "orders"("Code_o"),
  PRIMARY KEY ("Code_s", "Code_o")
);
/**/
DROP TABLE "shipment_to_orders";
/**/
CREATE TABLE "shipment_to_goods"(
  "Code_s" integer NOT NULL,
  "Id_g" integer NOT NULL,
  FOREIGN KEY("Code_s") REFERENCES "shipment"("Code_s"),
  FOREIGN KEY("Id_g") REFERENCES "goods"("Id_g"),
  PRIMARY KEY("Code_s", "Id_g"),
  "Goods shipped" integer NOT NULL
);
/**/
DROP TABLE "shipment_to_goods";