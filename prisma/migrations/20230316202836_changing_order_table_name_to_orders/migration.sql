/*
  Warnings:

  - You are about to drop the `Order` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_OrderToPizzas` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_OrderToPizzas" DROP CONSTRAINT "_OrderToPizzas_A_fkey";

-- DropForeignKey
ALTER TABLE "_OrderToPizzas" DROP CONSTRAINT "_OrderToPizzas_B_fkey";

-- DropTable
DROP TABLE "Order";

-- DropTable
DROP TABLE "_OrderToPizzas";

-- CreateTable
CREATE TABLE "Orders" (
    "clientId" TEXT NOT NULL,

    CONSTRAINT "Orders_pkey" PRIMARY KEY ("clientId")
);

-- CreateTable
CREATE TABLE "_OrdersToPizzas" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_OrdersToPizzas_AB_unique" ON "_OrdersToPizzas"("A", "B");

-- CreateIndex
CREATE INDEX "_OrdersToPizzas_B_index" ON "_OrdersToPizzas"("B");

-- AddForeignKey
ALTER TABLE "_OrdersToPizzas" ADD CONSTRAINT "_OrdersToPizzas_A_fkey" FOREIGN KEY ("A") REFERENCES "Orders"("clientId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OrdersToPizzas" ADD CONSTRAINT "_OrdersToPizzas_B_fkey" FOREIGN KEY ("B") REFERENCES "pizzas"("id") ON DELETE CASCADE ON UPDATE CASCADE;
