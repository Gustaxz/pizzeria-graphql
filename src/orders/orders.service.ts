import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { GraphQLError } from 'graphql';
import { PizzasType } from 'src/pizzas/dto/pizzas.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateOrderType } from './dto/create-order.dto';
import { OrdersType } from './dto/orders.dto';

@Injectable()
export class OrdersService {
  constructor(private prisma: PrismaService) {}

  async createOrder(order: CreateOrderType): Promise<CreateOrderType> {
    const pizzasIDs = [];

    order.pizzas.forEach((pizza) =>
      pizzasIDs.push({
        id: pizza,
      }),
    );

    try {
      const result = await this.prisma.orders.create({
        data: {
          clientName: order.clientName,
          pizzas: {
            connect: pizzasIDs,
          },
        },
      });

      return order;
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === 'P2025') {
          throw new GraphQLError('Pizza ID invalid', {
            extensions: {
              code: 'BAD_USER_INPUT',
            },
          });
        }
      }
    }
  }

  async findOrders(): Promise<OrdersType[]> {
    const orders = await this.prisma.orders.findMany({
      select: {
        pizzas: true,
        clientName: true,
        _count: true,
      },
    });

    return orders;
  }

  async findOneOrder(clientName: string): Promise<OrdersType[]> {
    const orders = await this.prisma.orders.findMany({
      where: {
        clientName,
      },
      select: {
        clientName: true,
        pizzas: true,
      },
    });

    return orders;
  }
}
