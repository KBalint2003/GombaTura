const express = require('express');
const bcrypt = require('bcrypt');
const passport = require('passport');
const bodyParser = require('body-parser');

const sequelize = require('./models/adatbazisKapcsolat.model')

const regisztracioRouter = require("./routes/regisztracio.route");

//Az express Szerver konfigurálása
const app = express()
const PORT = 3000;

app.use(express.json());

app.use("/",regisztracioRouter);

sequelize.kapcsolat();


//A HTTP Szerver indítása a 3000-es porton
app.listen(PORT, () => {
    console.log(`A szerver elindult és elérhető a http://localhost:${PORT} URL-en!`)
})