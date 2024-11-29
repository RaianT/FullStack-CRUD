import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient()
const Materials = prisma.materiaprima

export const getNameMaterials = async (req, res) => {
  try {
    const materials = await prisma.materiaprima.findMany({
      select: { matnome: true }, // Retorna apenas o campo `matnome`
    });

    res.json(materials); // Retorna um array de objetos [{ matnome: "Material 1" }, { matnome: "Material 2" }]
  } catch (error) {
    console.error('Erro ao buscar materials:', error);
    res.status(500).json({ error: 'Erro ao buscar materials.' });
  }
};

// Função para listar todos os produtos
export const getMaterials = async (req, res) => {
  try {
    const materials = await Materials.findMany();
    res.status(200).json(materials);
  } catch (error) {
    console.error('Erro ao buscar materials:', error);
    res.status(500).json({ error: 'Erro ao buscar materials.' });
  }
};

export const createMaterials = async (req, res) => {
  try {
    const { matnome, matdescricao, matqtdestoque, matpreco, matcor, matfornecedor } = req.body;

    // Converta os campos para os tipos esperados
    const matduct = await Materials.create({
      data: {
        matnome,
        matcor,
        matdescricao,
        matfornecedor,
        matqtdestoque: parseInt(matqtdestoque), // Converte para inteiro
        matpreco: parseFloat(matpreco),         // Converte para float
      },
    });
    res.redirect('/listaMaterial');

  } catch (e) {
    console.log(e)
    res.status(500).json({ error: e });
  }
}

export const deleteMaterial = async (req, res) => {
  try {
    const id = req.params.id

    await Materials.delete({
      where: {
        matcod: Number(id)
      }
    })
    res.status(200).json({ message: 'Matéria-prima excluída com sucesso.' });
  } catch (e) {
    res.status(500).json({ error: e });
  }
}

export const editMaterial = async (req, res) => {
  try {
    const id = parseInt(req.params.id); 
    if (!id) {
      return res.status(400).json({ error: 'ID inválido ou ausente.' });
  }

    const { matnome, matdescricao, matcor, matpreco, matqtdestoque, matfornecedor } = req.body;

    console.log('Dados recebidos para atualização:', { id, ...req.body }); 

    const updatedMaterial = await Materials.update({
      where: { matcod: id },
      data: {
        matnome,
        matdescricao,
        matcor,
        matpreco: parseFloat(matpreco), 
        matqtdestoque: parseInt(matqtdestoque), 
        matfornecedor,
      },
    });

    console.log('Material atualizado:', updatedMaterial); 

    res.status(200).json({ message: 'Matéria-prima alterada com sucesso.', material: updatedMaterial });
  } catch (e) {
    console.error('Erro ao editar material:', e);
    res.status(500).json({ error: e.message });
  }
};
