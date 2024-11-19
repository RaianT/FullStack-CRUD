const express = require('express');
const bodyParser = require('body-parser');

// Inicializando o Express
const app = express();
const port = 3000;

// Middleware para interpretar o corpo das requisições
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Serve os arquivos estáticos (se necessário)
app.use(express.static('public'));

// Rota para lidar com o envio do formulário
app.post('/submit-form', (req, res) => {
    const { nome, cor, descricao, preco, quantidade, fornecedor } = req.body;

    // Lógica para processar os dados
    console.log('Nome:', nome);
    console.log('Cor:', cor);
    console.log('Descrição:', descricao);
    console.log('Preço:', preco);
    console.log('Quantidade:', quantidade);
    console.log('Fornecedor:', fornecedor);

    // Aqui você pode adicionar lógica para salvar os dados em um banco de dados

    // Respondendo com uma mensagem de sucesso
    res.json({
        message: 'Formulário enviado com sucesso!',
        data: req.body
    });
});

// Iniciar o servidor
app.listen(port, () => {
    console.log(`Servidor rodando na porta http://localhost:${port}`);
});
