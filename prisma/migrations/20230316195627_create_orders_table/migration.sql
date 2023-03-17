-- CreateTable
CREATE TABLE "Order" (
    "clientId" TEXT NOT NULL,
    "pizzasId" INTEGER NOT NULL,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("clientId")
);

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_pizzasId_fkey" FOREIGN KEY ("pizzasId") REFERENCES "pizzas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
