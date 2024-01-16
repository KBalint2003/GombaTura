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


//kapcsolat function, segítségével csatlakoztatni tudjuk az adatbázist a backend szerverrel, a backend csak akkor indul el, ha a bach-db közötti kapcsolat sikeres.
async function kapcsolat() {
    try {
        await sequelize.authenticate();
        console.log('Sikeres kapcsolat az adatbázissal!');

        app.listen(PORT, () => {
            console.log(`A szerver elindult és elérhető a http://localhost:${PORT} URL-en!`)
        })
      } 
      catch (error) {
        console.error('Nem sikerült csatlakozni az adatbázishoz.', error);
      }
}

//A HTTP Szerver indítása a 3000-es porton
kapcsolat();  


