import express from 'express';
import productsRoutes from './src/routes/productRoutes.js';
import path from 'path';
import materialsRoutes from './src/routes/materialsRoutes.js';

const app = express();

// Middleware para servir arquivos estáticos, como CSS e JS, se necessário
app.use(express.json()); // Middleware para JSON
app.use(express.urlencoded({ extended: true }));

// Rotas para as páginas HTML
app.get('/cadMaterial', (req, res) => {
    res.sendFile(path.resolve('pages/cadMaterial.html'));
});

app.get('/cadProdutos', (req, res) => {
    res.sendFile(path.resolve('pages/cadProdutos.html'));
});

app.get('/listaMaterial', (req, res) => {
    res.sendFile(path.resolve('pages/listaMaterial.html'));
});

app.get('/listaProdutos', (req, res) => {
    res.sendFile(path.resolve('pages/listaProdutos.html'));
});

// Rotas de API
app.use(productsRoutes);
app.use(materialsRoutes);

// Porta do servidor
const PORT = 3001;

app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
