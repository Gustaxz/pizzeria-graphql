import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const pizzas = [
  {
    name: 'Margherita',
    price: 5,
    ingredients: ['tomato', 'mozzarella'],
  },
  {
    name: 'Bufala',
    price: 6,
    ingredients: ['tomato', 'mozarella di bufala'],
  },
  {
    name: 'Romana',
    price: 5,
    ingredients: ['tomato', 'mozzarella', 'anchovies', 'oregano', 'oil'],
  },
  {
    name: 'Diavola',
    price: 7,
    ingredients: ['tomato', 'mozzarella', 'spicy salami'],
  },
  {
    name: 'Pizza Bianca',
    price: 5,
    ingredients: ['mozzarella', 'oregano'],
  },
];

async function main() {
  console.log('Seeding...');

  await prisma.pizzas.createMany({
    data: pizzas,
  });
}

main()
  .catch((e) => console.error(e))
  .finally(async () => {
    await prisma.$disconnect();
  });
