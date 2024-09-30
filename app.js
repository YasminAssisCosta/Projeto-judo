const express = require('express');
const app = express();
const mysql = require('mysql');
const bcrypt = require("bcrypt");
const saltRounds = 10;
const formidable = require('formidable');


module.exports = app;
var session = require('express-session');

app.set('view engine', 'ejs')
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

app.use(express.urlencoded({ extended: true }))
app.set('view engine', 'ejs')


app.get('/', (req, res) => {
    res.render('main.ejs');
});

// Sessão
app.use(session({
    secret: '2C44-4D44-WppQ38S',
    resave: false,
    saveUninitialized: true
}));

app.get('/inicio', (req, res) => {
    if (req.session.logado) {
        const query = "SELECT * FROM tb_faixa";
        con.query(query, (err, result) => {
            if (err) throw err;
            // Renderiza a página 'inicio.ejs' passando os dados das faixas
            res.render('inicio.ejs', { faixas: result, id_usuario: req.session.id_usuario });
        });
    } else {
        // Se o usuário não estiver logado, redireciona para a página de login
        res.render('login.ejs', { mensagem: "Realize login ou cadastre-se para ter acesso a essa página" });
    }
});


app.get('/inicio', (req, res) => {
    res.render('inicio.ejs');
});

app.get('/menu', (req, res) => {
    res.render('menu.ejs');
});

app.get('/login', (req, res) => {
    res.render('login.ejs');
});



app.post('/login', function (req, res) {
    var senha = req.body['senha']
    var email = req.body['email']
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
                }
                else { res.render('login', { mensagem: "Senha inválida" }) }
            });
        }
        else { res.render('login.ejs', { mensagem: "Usuário inexistente" }) }
    });
});

app.get('/cadastro', (req, res) => {
    res.render('cadastro.ejs');
});

app.post('/cadastro', function (req, res) {
    bcrypt.hash(req.body['senha'], saltRounds, function (err, hash) {
        var id_usuario;
        var nome = req.body['nome'];
        var email = req.body['email'];


        var sql = "SELECT * FROM tb_usuario where email = ?";
        con.query(sql, [email], function (err, result) {
            if (err) throw err;
            if (result.length > 0) { //Verifica se o email já foi cadastrado
                res.redirect('/cadastro');
            } else {
        
                var sql = "INSERT INTO tb_usuario (nome, email, senha) VALUES ?";
                var values = [
                    [nome, email, hash]
                ];
                con.query(sql, [values], function (err, result) {
                    if (err) throw err;
                    console.log("Numero de registros inseridos: " + result.affectedRows);
                });
                res.redirect('/login');
            }
            
        });
        
    });
});

app.get('/conteudo', (req, res) => {
    const faixaId = req.query.faixa;  // Obtém o id_faixa da query string

    if (!faixaId) {
        return res.status(400).send('Faixa não especificada.');
    }

    // Consulta para buscar os conteúdos relacionados à faixa selecionada
    const query = "SELECT * FROM tb_conteudo WHERE id_faixa = ?";
    
    con.query(query, [faixaId], (err, result) => {
        if (err) throw err;

        // Renderiza a página 'conteudo.ejs' passando os conteúdos encontrados
        res.render('conteudo.ejs', { conteudos: result });
    });
});

app.get('/verMaterial', (req, res) => {
    const id_conteudo = req.query.id_conteudo; // Captura o ID do conteúdo da query string

    const query = "SELECT * FROM tb_conteudo WHERE id_conteudo = ?";
    con.query(query, [id_conteudo], (err, result) => {
        if (err) throw err;

        if (result.length > 0) {
            const conteudo = result[0];
            res.render('verMaterial.ejs', { conteudo }); 
        } else {
            res.send('Conteúdo não encontrado.'); 
        }
    });
});



app.listen(3000, function () {
    console.log("Servidor Escutando na porta 3000");
});
