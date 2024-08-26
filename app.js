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




con.connect(function (err) {
    if (err) throw err;
    console.log("Conectado!");
});