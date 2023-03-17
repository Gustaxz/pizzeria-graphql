import { Args, Query, Resolver } from '@nestjs/graphql';
import { PizzasType } from './dto/pizzas.dto';
import { PizzasService } from './pizzas.service';

@Resolver((of) => PizzasType)
export class PizzasResolver {
  constructor(private readonly pizzasService: PizzasService) {}

  @Query((returns) => [PizzasType])
  async pizzas(): Promise<PizzasType[]> {
    return await this.pizzasService.findAll();
  }

  @Query((returns) => PizzasType)
  async pizza(@Args('id') id: number): Promise<PizzasType> {
    return await this.pizzasService.findOne(id);
  }
}
