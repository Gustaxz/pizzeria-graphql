/*
  Warnings:

  - You are about to drop the column `pizzasId` on the `Order` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_pizzasId_fkey";

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "pizzasId";

-- CreateTable
CREATE TABLE "_OrderToPizzas" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_OrderToPizzas_AB_unique" ON "_OrderToPizzas"("A", "B");

-- CreateIndex
CREATE INDEX "_OrderToPizzas_B_index" ON "_OrderToPizzas"("B");

-- AddForeignKey
ALTER TABLE "_OrderToPizzas" ADD CONSTRAINT "_OrderToPizzas_A_fkey" FOREIGN KEY ("A") REFERENCES "Order"("clientId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OrderToPizzas" ADD CONSTRAINT "_OrderToPizzas_B_fkey" FOREIGN KEY ("B") REFERENCES "pizzas"("id") ON DELETE CASCADE ON UPDATE CASCADE;
