/*
  Warnings:

  - You are about to drop the column `ordersClientName` on the `pizzas` table. All the data in the column will be lost.
  - You are about to drop the column `ordersId` on the `pizzas` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "pizzas" DROP CONSTRAINT "pizzas_ordersId_fkey";

-- AlterTable
ALTER TABLE "pizzas" DROP COLUMN "ordersClientName",
DROP COLUMN "ordersId";

-- CreateTable
CREATE TABLE "_OrdersToPizzas" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_OrdersToPizzas_AB_unique" ON "_OrdersToPizzas"("A", "B");

-- CreateIndex
CREATE INDEX "_OrdersToPizzas_B_index" ON "_OrdersToPizzas"("B");

-- AddForeignKey
ALTER TABLE "_OrdersToPizzas" ADD CONSTRAINT "_OrdersToPizzas_A_fkey" FOREIGN KEY ("A") REFERENCES "Orders"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OrdersToPizzas" ADD CONSTRAINT "_OrdersToPizzas_B_fkey" FOREIGN KEY ("B") REFERENCES "pizzas"("id") ON DELETE CASCADE ON UPDATE CASCADE;
