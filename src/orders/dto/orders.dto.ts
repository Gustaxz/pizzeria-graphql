import { ObjectType, Field, ID } from '@nestjs/graphql';
import { PizzasType } from 'src/pizzas/dto/pizzas.dto';

@ObjectType()
export class OrdersType {
  @Field()
  readonly clientName: string;
  @Field(() => [PizzasType])
  readonly pizzas: PizzasType[];
}
