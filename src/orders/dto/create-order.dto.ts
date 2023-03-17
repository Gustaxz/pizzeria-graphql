import { Field, ID, InputType, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class CreateOrderType {
  @Field()
  readonly clientName: string;

  @Field(() => [Number])
  readonly pizzas: number[];
}

@InputType()
export class CreateOrderInputType {
  @Field()
  readonly clientName: string;

  @Field(() => [Number])
  readonly pizzas: number[];
}
