import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

// Função para listar todos os produtos
export const getProducts = async (req, res) => {
  try {
    // Busca todos os produtos no banco de dados
    const products = await prisma.product.findMany();
    res.status(200).json(products);
  } catch (error) {
    console.error('Erro ao buscar produtos:', error);
    res.status(500).json({ error: 'Erro ao buscar produtos.' });
  }
};
