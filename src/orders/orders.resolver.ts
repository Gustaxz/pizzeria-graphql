import { Args, Mutation, Query, Resolver } from '@nestjs/graphql';
import { CreateOrderInputType, CreateOrderType } from './dto/create-order.dto';
import { OrdersType } from './dto/orders.dto';
import { OrdersService } from './orders.service';

@Resolver((of) => OrdersType)
export class OrdersResolver {
  constructor(private readonly ordersService: OrdersService) {}

  @Query((returns) => [OrdersType])
  async orders(): Promise<OrdersType[]> {
    return await this.ordersService.findOrders();
  }

  @Query((returns) => [OrdersType])
  async orderByName(
    @Args('clientName') clientName: string,
  ): Promise<OrdersType[]> {
    return await this.ordersService.findOneOrder(clientName);
  }

  @Mutation((returns) => CreateOrderType)
  async createOrder(
    @Args('input') input: CreateOrderInputType,
  ): Promise<CreateOrderType> {
    return await this.ordersService.createOrder({
      clientName: input.clientName,
      pizzas: input.pizzas,
    });
  }
}
