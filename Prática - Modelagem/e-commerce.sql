CREATE DATABASE ecommerce;

CREATE TABLE "user"(
   	"id" serial PRIMARY KEY,
	"name" VARCHAR(100) NOT NULL,
	"email" VARCHAR(100) NOT NULL,
	"password" VARCHAR(100) NOT NULL
);

CREATE TABLE "size"(
	"id" serial PRIMARY KEY,
	"size" varchar(10) NOT NULL
);

CREATE TABLE "category"(
	"id" serial PRIMARY KEY,
	"name" VARCHAR(100) NOT NULL
);

CREATE TABLE "adress"(
    "id_user" NOT NULL,
	"adress" varchar(255) NOT NULL,
	"number" smallint NOT NULL,
	"cep" int NOT NULL,
	"complement" varchar(255) NOT NULL,
    FOREIGN KEY ("id_user")
        REFERENCES "user"("id")
);

CREATE TABLE "state"(
    "id" serial PRIMARY KEY,
	"state" varchar(255) NOT NULL
);

CREATE TABLE "product"(
    "id" serial PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
	"price" numeric NOT NULL,
	"id_size" int NOT NULL,
	"id_category" int NOT NULL,
    FOREIGN KEY ("id_size")
        REFERENCES "size"("id"),
    FOREIGN KEY ("id_category")
        REFERENCES "category"("id")
);


CREATE TABLE "photo"(
    "id" serial PRIMARY KEY,
	"id_product" int NOT NULL,
	"isPrincipal" BOOLEAN NOT NULL,
    FOREIGN KEY ("id_product")
        REFERENCES "product"("id")
);


CREATE TABLE "purchase"(
    "id" serial PRIMARY KEY,
	"id_user" int NOT NULL,
	"date" DATE NOT NULL,
	"id_state" int NOT NULL,
	"user_adress" int NOT NULL,
    FOREIGN KEY ("id_user") REFERENCES "user"("id"),
    FOREIGN KEY ("id_state") REFERENCES "state"("id")
);

CREATE TABLE "item"(
    "id_purchase" int NOT NULL,
	"id_product" int NOT NULL,
	"quantity" smallint NOT NULL,
    FOREIGN KEY ("id_purchase")
        REFERENCES "purchase"("id"),
    FOREIGN KEY ("id_product")
        REFERENCES "product"("id")
);



