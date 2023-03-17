/*
  Warnings:

  - You are about to drop the `_OrdersToPizzas` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_OrdersToPizzas" DROP CONSTRAINT "_OrdersToPizzas_A_fkey";

-- DropForeignKey
ALTER TABLE "_OrdersToPizzas" DROP CONSTRAINT "_OrdersToPizzas_B_fkey";

-- AlterTable
ALTER TABLE "pizzas" ADD COLUMN     "ordersClientId" TEXT;

-- DropTable
DROP TABLE "_OrdersToPizzas";

-- AddForeignKey
ALTER TABLE "pizzas" ADD CONSTRAINT "pizzas_ordersClientId_fkey" FOREIGN KEY ("ordersClientId") REFERENCES "Orders"("clientId") ON DELETE SET NULL ON UPDATE CASCADE;
