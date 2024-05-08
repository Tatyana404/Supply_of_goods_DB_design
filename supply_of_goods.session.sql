DROP TABLE IF EXISTS "goods";
/**/
CREATE TABLE "goods"(
  "code" serial PRIMARY KEY,
  "name" varchar(64) NOT NULL CHECK ("name" != '') UNIQUE,
  "price" decimal(16, 2) NOT NULL CHECK ("price" > 0)
);
/**/
DROP TABLE IF EXISTS "customers";
/**/
CREATE TABLE "customers" (
  "id" serial PRIMARY KEY,
  "name" varchar(64) NOT NULL CHECK ("name" != ''),
  "address" varchar(255) NOT NULL CHECK ("address" != ''),
  "phone" varchar(20) NOT NULL CHECK ("phone" != ''),
  UNIQUE ("address", "phone")
);
/**/
DROP TABLE IF EXISTS "contracts";
/**/
CREATE TABLE "contracts"(
  "number" serial PRIMARY KEY,
  "date" timestamp NOT NULL DEFAULT current_timestamp
);
/**/
DROP TABLE IF EXISTS "orders";
/**/
CREATE TABLE "orders"(
  "code" serial PRIMARY KEY,
  "customer" integer NOT NULL REFERENCES "customers"("id"),
  "contract" integer NOT NULL REFERENCES "contracts"("number"),
  "goods_code" integer NOT NULL REFERENCES "goods"("code"),
  "planned_delivery_qty" integer NOT NULL CHECK ("planned_delivery_qty" > 0)
);
/**/
DROP TABLE IF EXISTS "shipments";
/**/
CREATE TABLE "shipments" (
  "shipment_code" serial PRIMARY KEY,
  "order_code" integer NOT NULL REFERENCES "orders"("code"),
  "is_shipped_to_customer" boolean NOT NULL DEFAULT false
);
/**/
DROP TABLE IF EXISTS "goods_to_shipments";
/**/
CREATE TABLE "goods_to_shipments" (
  "goods_code" integer NOT NULL REFERENCES "goods"("code"),
  "shipment_code" integer NOT NULL REFERENCES "shipments"("shipment_code"),
  "date" timestamp NOT NULL DEFAULT current_timestamp,
  "qty" integer NOT NULL CHECK ("qty" > 0),
  PRIMARY KEY ("goods_code", "shipment_code")
);