

const express = require('express');


const app = express();
const port = 8080;

const ipAddress = '061cd4be9c53'; 
const hostname = 'host';
const version = process.env.VERSION;

app.get('/health', (req, res) => {
    res.sendStatus(200);
});

app.get('/', (req, res) => {
  res.send(`Adres IP serwera: ${ipAddress}<br>Nazwa serwera (hostname): ${hostname}<br>Wersja aplikacji: ${version}`);
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

