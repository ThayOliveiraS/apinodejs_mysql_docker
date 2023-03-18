import express from 'express';
import mysql from 'mysql';

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();
app.use(express.json());

const db = mysql.createConnection({
  host: 'mysql1',
  user: 'root',
  password: '123456',
  database: 'mydbprojeto'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Connected!');
});

app.get('/pessoas/:id', (req, res) => {
  const id = Number(req.params.id);
  const sql = 'SELECT * FROM pessoas WHERE idpessoas =' + id;
  db.query(sql, (err, result) => {
    if (err) {
      throw err;
    }
    if (result.length === 0) {
      return res.status(404).send('Pessoa não encontrada');
    }
    res.json(result);
  })
});

app.get('/pessoas/email/:email', (req, res) => {
  const email = req.params.email;
  const sql = 'SELECT * FROM pessoas WHERE email =' + `'${email}'`;
  db.query(sql, (err, result) => {
    if (err) {
      throw err;
    }
    if (result.length === 0) {
      return res.status(404).send('Pessoa não encontrada');
    }
    res.json(result);
  })
});

app.get('/tiposdeclientes', (req, res) => {
  const sql = 'SELECT * FROM tiposdeclientes';
  db.query(sql, (err, result) => {
    if (err) {
      throw err;
    }
    if (result.length === 0) {
      return res.status(404).send('Pessoa não encontrada');
    }
    res.json(result);
  })
});

app.post('/', (req, res) => {
  const msql = 'INSERT INTO endereco (idtiposdelogradouros, logradouro, bairro, cidade, uf) VALUES (?,?,?,?,?)';
  const outravariables = [req.body.idtiposdelogradouros, req.body.logradouro, req.body.bairro, req.body.cidade, req.body.uf];
  let error = false;
  db.query(msql, outravariables, (err) => {
    if (err) {
      error = true
      return res.status(404).send({ err: err });
    }
  });
  if (error) return;

  const sql = 'INSERT INTO pessoas (nome, telefone, email, idtiposdeclientes, cep, idendereco, numero, complemento) VALUES (?,?,?,?,?,?,?,?)';
  const variables = [req.body.nome, req.body.telefone, req.body.email, req.body.idtiposdeclientes, req.body.cep, req.body.idendereco, req.body.numero, req.body.complemento];
  db.query(sql, variables, (err) => {
    if (err) {
      error = true
      return res.status(404).send({ err: err });
    }
  });
  if (error) return;

  res.status(201).send('Produto inserido com Sucesso.');
});

app.listen(PORT, () => {
  console.log('Server is running on port 3000.')
});