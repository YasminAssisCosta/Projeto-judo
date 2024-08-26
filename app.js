const express = require('express');
const app = express();
const mysql = require('mysql');
app.set('view engine', 'ejs')
app.use(express.static("public"));
app.use(express.json());

app.use(express.urlencoded({ extended: true }))
app.set('view engine', 'ejs')
app.get('/', (req, res) => {
    res.render('main.ejs');
});

app.get('/inicio', (req, res) => {
    const query = "SELECT * FROM tb_faixa";
    con.query(query, (err, result) => {
        if (err) throw err;
        res.render('inicio.ejs', { faixas: result });
    });
});

app.get('/inicio', (req, res) => {
    res.render('inicio.ejs');
});

app.get('/menu', (req, res) => {
    res.render('menu.ejs');
});

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

app.listen(3000, function () {
    console.log("Servidor Escutando na porta 3000");
});
