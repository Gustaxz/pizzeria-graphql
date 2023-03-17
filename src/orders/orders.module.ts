import { Module } from '@nestjs/common';
import { OrdersService } from './orders.service';
import { PrismaService } from 'src/prisma/prisma.service';
import { OrdersResolver } from './orders.resolver';

@Module({
  providers: [OrdersService, PrismaService, OrdersResolver],
})
export class OrdersModule {}
