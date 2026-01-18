const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

async function main() {
  console.log('🔄 Start...')
  
  const ticket = await prisma.ticket.create({
    data: {
      title: "Downgrade success",
      message: "Version 5 works perfectly!",
    },
  })
  console.log('✅ Тікет створено:', ticket)

  const products = await prisma.product.findMany({ take: 1 })
  if (products.length > 0) {
      console.log('✅ Товар знайдено:', products[0])
  } else {
      console.log('⚠ Товарів немає, але база підключена!')
  }
}

main()
  .catch((e) => { console.error(e); process.exit(1) })
  .finally(async () => { await prisma.$disconnect() })