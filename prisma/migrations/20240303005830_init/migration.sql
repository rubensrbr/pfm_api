-- CreateTable
CREATE TABLE "Category" (
    "id" BIGSERIAL NOT NULL,
    "description" VARCHAR(100) NOT NULL,

    CONSTRAINT "mymodels_category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Expense" (
    "uuid" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6),
    "updated_at" TIMESTAMPTZ(6),
    "amount" DECIMAL(15,6) NOT NULL,
    "date" DATE NOT NULL,
    "description" TEXT NOT NULL,
    "category_id" BIGINT
);

-- CreateTable
CREATE TABLE "Income" (
    "uuid" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6),
    "updated_at" TIMESTAMPTZ(6),
    "amount" DECIMAL(15,6) NOT NULL,
    "date" DATE NOT NULL,
    "description" TEXT NOT NULL,
    "source_id" BIGINT
);

-- CreateTable
CREATE TABLE "Source" (
    "id" BIGSERIAL NOT NULL,
    "description" VARCHAR(100) NOT NULL,

    CONSTRAINT "mymodels_source_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "mymodels_expense_uuid_key" ON "Expense"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "mymodels_income_uuid_key" ON "Income"("uuid");

-- AddForeignKey
ALTER TABLE "Expense" ADD CONSTRAINT "mymodels_expense_category_id_69043fe4_fk_mymodels_category_id" FOREIGN KEY ("category_id") REFERENCES "Category"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Income" ADD CONSTRAINT "mymodels_income_source_id_faf03a95_fk_mymodels_source_id" FOREIGN KEY ("source_id") REFERENCES "Source"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
