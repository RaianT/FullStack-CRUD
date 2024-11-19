const mysql = require('mysql2');

function testDatabaseConnection(config) {
    const connection = mysql.createConnection(config);

    connection.connect((err) => {
        if (err) {
            console.error('Erro ao conectar ao banco de dados:', err.message);
        } else {
            console.log('Conexão com o banco de dados estabelecida com sucesso!');
        }

        // Fecha a conexão
        connection.end((endErr) => {
            if (endErr) {
                console.error('Erro ao encerrar a conexão:', endErr.message);
            } else {
                console.log('Conexão com o banco de dados encerrada.');
            }
        });
    });
}

// Configurações do banco de dados
const config = {
    host: 'localhost', // Endereço do servidor
    user: 'root', // Nome de usuário
    password: '12345678', // Senha
    database: 'minaehelo', // Nome do banco de dados
};

// Testa a conexão
testDatabaseConnection(config);
