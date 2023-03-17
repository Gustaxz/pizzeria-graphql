import { Module } from '@nestjs/common';
import { PizzasService } from './pizzas.service';
import { PizzasResolver } from './pizzas.resolver';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  providers: [PizzasService, PizzasResolver, PrismaService],
})
export class PizzasModule {}
