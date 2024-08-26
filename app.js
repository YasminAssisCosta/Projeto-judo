const express = require('express');
const app = express();
app.set('view engine', 'ejs')
app.use(express.static("public"));
app.use(express.json());

app.use(express.urlencoded({ extended: true }))
app.set('view engine', 'ejs')
app.get('/', (req, res) => {
    res.render('main.ejs');
});

app.get('/login', (req, res) => {
    res.render('login.ejs');
});

app.get('/cadastro', (req, res) => {
    res.render('cadastro.ejs');
});

app.listen(3000, function () {
    console.log("Servidor Escutando na porta 3000");
});

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "projeto_judo"
});


app.get('/cadastro', function (req, res) {
    res.render('cadastro.ejs', { mensagem: req.flash('error') });
});

app.post('/cadastro', function (req, res) {
    bcrypt.hash(req.body['senha'], saltRounds, function (err, hash) {
        var id_usuario
        var nome = req.body['nome']
        var senha = req.body['senha']
        var confSenha = req.body['confSenha']
        var email = req.body['email']

        if (senha.length >= 8) { //Verifica se a senha tem mais de 8 caracteres
            if (senha === confSenha) { //Verifica se a senha e a confirmação de senha são iguais
                var sql = "SELECT * FROM tb_usuario where email = ?";
                con.query(sql, [email], function (err, result) {
                    if (err) throw err;
                    if (result.length > 0) { //Verifica se o email já foi cadastrado
                        req.flash('error', 'Email já cadastrado');
                        res.redirect('/cadastro');
                    } else {
                        var sql = "INSERT INTO tb_usuario (nome, email, senha) VALUES ?";
                        var values = [
                            [req.body['nome'], req.body['email'], hash]
                        ];
                        con.query(sql, [values], function (err, result) {
                            if (err) throw err;
                            console.log("Numero de registros inseridos: " + result.affectedRows);
                        });
                        res.redirect('/login');
                    }
                });
            } else {
                req.flash('error', 'As duas senhas não coincidem');
                res.redirect('/cadastro');
            }
        } else {
            req.flash('error', 'A senha precisa ter ao menos 8 caracteres');
            res.redirect('/cadastro');
        }
    });
});

con.connect(function (err) {
    if (err) throw err;
    console.log("Conectado!");
});