import { ObjectType, Field, Int, ID } from '@nestjs/graphql';

@ObjectType()
export class PizzasType {
  @Field(() => ID)
  readonly id: number;
  @Field()
  readonly name: string;
  @Field(() => Int)
  readonly price: number;
  @Field(() => [String])
  readonly ingredients: string[];
}
