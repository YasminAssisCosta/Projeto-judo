const express = require('express');
const app = express();
const mysql = require('mysql');
const bcrypt = require("bcrypt");
const saltRounds = 10;
const formidable = require('formidable');
const session = require('express-session');

module.exports = app;
app.set('view engine', 'ejs');
app.use(express.static("public"));
app.use(express.json());

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "projeto_judo"
});

con.connect(function (err) {
    if (err) throw err;
    console.log("Conectado!");
});

app.use(express.urlencoded({ extended: true }));
app.use(session({
    secret: '2C44-4D44-WppQ38S',
    resave: false,
    saveUninitialized: true
}));

app.get('/', (req, res) => {
    res.render('main.ejs');
});

app.get('/quizz', (req, res) => {
    res.render('quizz.ejs');
});

app.get('/addConteudo', (req, res) => {
    res.render('addConteudo.ejs');
});

app.post('/addConteudo', function (req, res) {
    var id = req.session.id_usuario;
    var titulo = req.body['titulo'];
    var conteudo = req.body['conteudo'];
    var link = req.body['link'];

    var sql = "INSERT INTO tb_conteudo (titulo, conteudo, id_faixa, id_user, link_video, imagem, autor) VALUES ?"
    var values = [
        [titulo, conteudo, '2', '2', link, '4', 'josé']
    ];

    con.query(sql, [values], function (err, result) {
        if (err) throw err;
        console.log("Numero de registros inseridos: " + result.affectedRows);
    });
    res.redirect('/conteudo');
});

app.get('/inicio', (req, res) => {
    if (req.session.logado) {
        const query = "SELECT * FROM tb_faixa";
        con.query(query, (err, result) => {
            if (err) throw err;
            res.render('inicio.ejs', { faixas: result, id_usuario: req.session.id_usuario });
        });
    } else {
        res.render('login.ejs', { mensagem: "Realize login ou cadastre-se para ter acesso a essa página" });
    }
});

app.get('/menu', (req, res) => {
    res.render('menu.ejs');
});

app.get('/login', (req, res) => {
    res.render('login.ejs');
});

app.post('/login', function (req, res) {
    var senha = req.body['senha'];
    var email = req.body['email'];
    var sql = "SELECT * FROM tb_usuario where email = ?";
    con.query(sql, [email], function (err, result) {
        if (err) throw err;
        if (result.length) {
            bcrypt.compare(senha, result[0]['senha'], function (err, resultado) {
                if (err) throw err;
                if (resultado) {
                    req.session.logado = true;
                    req.session.username = result[0]['nome'];
                    req.session.id_usuario = result[0]['id_usuario'];
                    req.session.email = result[0]['email'];
                    res.redirect('/inicio');
                } else { 
                    res.render('login', { mensagem: "Senha inválida" });
                }
            });
        } else { 
            res.render('login.ejs', { mensagem: "Usuário inexistente" });
        }
    });
});

app.get('/cadastro', (req, res) => {
    res.render('cadastro.ejs');
});

app.post('/cadastro', function (req, res) {
    bcrypt.hash(req.body['senha'], saltRounds, function (err, hash) {
        var nome = req.body['nome'];
        var email = req.body['email'];
        var sql = "SELECT * FROM tb_usuario where email = ?";
        con.query(sql, [email], function (err, result) {
            if (err) throw err;
            if (result.length > 0) {
                res.redirect('/cadastro');
            } else {
                var sql = "INSERT INTO tb_usuario (nome, email, senha) VALUES ?";
                var values = [[nome, email, hash]];
                con.query(sql, [values], function (err, result) {
                    if (err) throw err;
                    console.log("Número de registros inseridos: " + result.affectedRows);
                });
                res.redirect('/login');
            }
        });
    });
});

app.get('/verMaterial', (req, res) => {
    if (req.session.logado) {
        const idTecnica = req.query.id_tecnica; // Mudamos para id_tecnica
        const query = "SELECT * FROM tb_tecnica WHERE id_tecnica = ?";
        con.query(query, [idTecnica], (err, result) => {
            if (err) throw err;
            if (result.length > 0) {
                const conteudo = result[0];
                res.render('verMaterial.ejs', { conteudo });
            } else {
                res.send('Técnica não encontrada.');
            }
        });
    } else {
        res.render('login.ejs', { mensagem: "Realize login ou cadastre-se para ter acesso a essa página" });
    }
});


app.get('/addConteudo', (req, res) => {
    if (req.session.logado) {
        res.render('addConteudo.ejs');
    } else {
        res.render('login.ejs', { mensagem: "Realize login ou cadastre-se para ter acesso a essa página" });
    }
});

app.post('/addConteudo', function (req, res) {
    if (req.session.logado) {
        var id = req.session.id_usuario;
        var descricao = req.body.meta;
        var sql = "INSERT INTO tb_conteudo (titulo, conteudo, id_faixa, id_user, link_video, imagem, autor) VALUES ?";
        var values = [['1', '1', '2', '2', '3', '4', 'josé']];
        con.query(sql, [values], function (err, result) {
            if (err) throw err;
            console.log("Número de registros inseridos: " + result.affectedRows);
        });
        res.redirect('/conteudo');
    } else {
        res.render('login.ejs', { mensagem: "Realize login ou cadastre-se para ter acesso a essa página" });
    }
});

app.get('/conteudo', (req, res) => {
    if (req.session.logado) {
        const faixaId = req.query.faixa; // ID da faixa deve ser passado na URL como parâmetro
        if (!faixaId) {
            return res.status(400).send('Faixa não especificada.');
        }

        // Query apenas na tabela tb_conteudo
        const query = "SELECT * FROM tb_conteudo WHERE id_faixa = ?";
        con.query(query, [faixaId], (err, result) => {
            if (err) throw err;

            // Renderiza a página de conteúdo com apenas os dados filtrados
            res.render('conteudo.ejs', { conteudos: result });
        });
    } else {
        res.render('login.ejs', { mensagem: "Realize login ou cadastre-se para ter acesso a essa página" });
    }
});


app.get('/quizzes', (req, res) => {
    const id_conteudo = req.query.id_conteudo; 

    if (!id_conteudo) {
        return res.status(400).send('ID de conteúdo não especificado.');
    }

    const query = "SELECT * FROM tb_tecnica WHERE id_conetudo = ?";
    con.query(query, [id_conteudo], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            res.render('quizzes', { tecnicas: result }); // Envia `tecnicas` para a view `quizzes`
        } else {
            res.send('Nenhuma técnica encontrada para este conteúdo.');
        }
    });
});
app.get('/questoes', (req, res) => {
    if (!req.session.logado) {
        return res.status(401).send('Você precisa estar logado para acessar essa página.');
    }

    const id_faixa = req.query.id_faixa; // Alterado para pegar o id_faixa da URL

    if (!id_faixa) {
        return res.status(400).send('ID da faixa não especificado.');
    }

    // Consulta para buscar todas as questões associadas ao id_faixa
    const query = "SELECT * FROM tb_questao WHERE id_faixa = ?"; 
    con.query(query, [id_faixa], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            // Passando todas as questões encontradas para a view
            res.render('quizz.ejs', { quiz : result[0]}); 
        } else {
            res.send('Nenhum quiz encontrado para esta faixa.');
        }
    });
});




app.post('/questoes', (req, res) => {
    
    if (!req.session.logado) {
        return res.status(401).send('Você precisa estar logado para enviar suas respostas.');
    }

    const id_usuario = req.session.id_usuario; // Pegar o id do usuário da sessão
    const { id_questao, resposta_um, resposta_dois, resposta_tres, resposta_quatro } = req.body;

    const query = `
        INSERT INTO tb_questao_usuario (id_usuario, id_questao, resposta_um, resposta_dois, resposta_tres, resposta_quatro)
        VALUES (?, ?, ?, ?, ?, ?)
    `;

    con.query(query, [id_usuario, id_questao, resposta_um, resposta_dois, resposta_tres, resposta_quatro], (err) => {
        if (err) throw err;
        res.redirect('/inicio');
    });
});
app.get('/perfil', (req, res) => {
    if (!req.session.logado) {
        return res.status(401).send('Você precisa estar logado para acessar essa página.');
    }

    const userId = req.session.id_usuario;

    const userQuery = "SELECT * FROM tb_usuario WHERE id_usuario = ?";
    const questionsQuery = `
SELECT q.id_questao, q.questao_Um, q.questao_Dois, q.questao_Tres, q.questao_Quatro,
       q.op_correto_Um, q.op_correto_Dois, q.op_correto_Tres, q.op_correto_Quatro,
       qu.resposta_um, qu.resposta_dois, qu.resposta_tres, qu.resposta_quatro,
       f.cor AS faixa_cor
FROM tb_questao_usuario qu
JOIN tb_questao q ON qu.id_questao = q.id_questao
JOIN tb_faixa f ON q.id_faixa = f.id_faixa
WHERE qu.id_usuario = ?`;

    con.query(userQuery, [userId], (err, userResult) => {
        if (err) throw err;
        
        con.query(questionsQuery, [userId], (err, quizResults) => {
            if (err) throw err;

            // Verificação de dados retornados para depuração (opcional)
            console.log("Quiz Results:", quizResults);

            res.render('perfil', { user: userResult[0], quizzes: quizResults });
        });
    });
});






app.get('/sair', (req, res) => {
   
    req.session.destroy((err) => {
        if (err) {
            console.error("Erro ao destruir a sessão:", err);
            return res.redirect('/'); 
        }
        res.redirect('/'); 
    });
});


app.listen(3000, function () {
    console.log("Servidor Escutando na porta 3000");
});

