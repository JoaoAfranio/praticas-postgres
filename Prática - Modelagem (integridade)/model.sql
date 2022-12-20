CREATE DATABASE bank;

CREATE TABLE "states"(
   	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "cities"(
   	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
    "stateId" INT NOT NULL,
    FOREIGN KEY ("stateId") REFERENCES "states"("id")
);

CREATE TABLE "customers"(
   	"id" serial PRIMARY KEY,
	"fullName" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL
);

CREATE TABLE "customerPhones"(
   	"id" serial PRIMARY KEY,
	"customerId" INT NOT NULL,
    "number" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    FOREIGN KEY ("customerId") REFERENCES "customers"("id")
);

CREATE TABLE "customerAddresses"(
   	"id" serial PRIMARY KEY,
	"customerId" INT NOT NULL,
    "cityId" INT NOT NULL,
    "street" TEXT NOT NULL,
    "number" INT NOT NULL,
    "complement" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    FOREIGN KEY ("customerId") REFERENCES "customers"("id"),
    FOREIGN KEY ("cityId") REFERENCES "cities"("id")
);


CREATE TABLE "bankAccount"(
   	"id" serial PRIMARY KEY,
	"customerId" INT NOT NULL,
    "accountNumber" INT NOT NULL,
    "agency" TEXT NOT NULL,
    "openDate" DATE NOT NULL,
    "closeDate" DATE,
    FOREIGN KEY ("customerId") REFERENCES "customers"("id")
);

CREATE TABLE "transactions"(
   	"id" serial PRIMARY KEY,
	"bankAccountId" INT NOT NULL,
    "amount" NUMERIC NOT NULL,
    "type" TEXT NOT NULL,
    "time" TIMESTAMP NOT NULL,
    "description" TEXT NOT NULL,
    "cancelled" BOOLEAN NOT NULL,
    FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id")
);


CREATE TABLE "creditCards"(
   	"id" serial PRIMARY KEY,
	"bankAccountId" INT NOT NULL,
    "name" TEXT NOT NULL,
    "number" INT NOT NULL,
    "securityCode" INT NOT NULL,
    "expirationMonth" TEXT NOT NULL,
    "expirationYear" TEXT NOT NULL,
    "password" INT NOT NULL,
    "limit" NUMERIC NOT NULL,
    FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id")
);
