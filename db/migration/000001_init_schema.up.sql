CREATE TABLE "account" (
  "account_id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint NOT NULL,
  "amount" double precision NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "transactions" (
  "transaction_id" bigserial PRIMARY KEY,
  "from_account_id" bigint NOT NULL,
  "to_account_id" bigint NOT NULL,
  "amount" double precision NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE INDEX ON "account" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transactions" ("from_account_id");

CREATE INDEX ON "transactions" ("to_account_id");

CREATE INDEX ON "transactions" ("from_account_id", "to_account_id");

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "account" ("account_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("from_account_id") REFERENCES "account" ("account_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("to_account_id") REFERENCES "account" ("account_id");