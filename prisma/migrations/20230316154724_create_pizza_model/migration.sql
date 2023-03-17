-- CreateTable
CREATE TABLE "pizzas" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "ingredients" TEXT[],
    "price" INTEGER NOT NULL,

    CONSTRAINT "pizzas_pkey" PRIMARY KEY ("id")
);
