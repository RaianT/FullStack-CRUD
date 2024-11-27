import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient()
const Product = prisma.produto

// Função para listar todos os produtos
export const getProducts = async (req, res) => {
  try {
    const products = await Product.findMany();
    res.status(200).json(products);
  } catch (error) {
    console.error('Erro ao buscar produtos:', error);
    res.status(500).json({ error: 'Erro ao buscar produtos.' });
  }
};

export const createProducts = async (req, res) => {
  try {
    const { pronome, procor, prodescricao, proqtdestoque, propreco, procategoria } = req.body;

    // Converta os campos para os tipos esperados
    const product = await Product.create({
      data: {
        pronome,
        procor,
        prodescricao,
        proqtdestoque: parseInt(proqtdestoque), // Converte para inteiro
        propreco: parseFloat(propreco),         // Converte para float
        procategoria,
      },
    });
    res.redirect('/listaProdutos');

  } catch (e) {
    console.log(e)
    res.status(500).json({ error: e });
  }
}

export const deleteProduto = async (req, res) => {
  try {
    const id = req.params.id
    await Product.delete({ where:{
      procod:Number(id)
    }})
    res.status(200).json({ message: 'Produto excluída com sucesso.' });
  } catch(e) {
    res.status(500).json({ error: e });
  }
}
  