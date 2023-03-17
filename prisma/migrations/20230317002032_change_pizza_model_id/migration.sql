/*
  Warnings:

  - The primary key for the `Orders` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `clientId` on the `Orders` table. All the data in the column will be lost.
  - You are about to drop the column `ordersClientId` on the `pizzas` table. All the data in the column will be lost.
  - Added the required column `clientName` to the `Orders` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "pizzas" DROP CONSTRAINT "pizzas_ordersClientId_fkey";

-- AlterTable
ALTER TABLE "Orders" DROP CONSTRAINT "Orders_pkey",
DROP COLUMN "clientId",
ADD COLUMN     "clientName" TEXT NOT NULL,
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "pizzas" DROP COLUMN "ordersClientId",
ADD COLUMN     "ordersClientName" TEXT,
ADD COLUMN     "ordersId" INTEGER;

-- AddForeignKey
ALTER TABLE "pizzas" ADD CONSTRAINT "pizzas_ordersId_fkey" FOREIGN KEY ("ordersId") REFERENCES "Orders"("id") ON DELETE SET NULL ON UPDATE CASCADE;
