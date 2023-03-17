import { Injectable } from '@nestjs/common';
import { GraphQLError } from 'graphql';
import { PrismaService } from 'src/prisma/prisma.service';
import { PizzasType } from './dto/pizzas.dto';
import { Pizzas } from '@prisma/client';

@Injectable()
export class PizzasService {
  constructor(private prisma: PrismaService) {}

  async findAll(): Promise<PizzasType[]> {
    return await this.prisma.pizzas.findMany();
  }

  async findOne(id: number): Promise<PizzasType> {
    const result = await this.prisma.pizzas.findFirst({
      where: {
        id,
      },
    });

    if (!result) {
      throw new GraphQLError('Invalid argument value', {
        extensions: {
          code: 'BAD_USER_INPUT',
        },
      });
    }

    return result;
  }
}
