const express = require('express');

const sequelize = require('./adatbazisKapcsolat')
const FelhasznaloModel = require('./models/felhasznalo.model')
const TuraraJelentkezes = require('./models/turaJelentkezes.model')


const regisztracioRouter = require("./routes/regisztracio.route");

//Az express Szerver konfigurálása
const app = express()
const PORT = 3000;

app.use(express.json());

app.use("/",regisztracioRouter);


//kapcsolat function, segítségével csatlakoztatni tudjuk az adatbázist a backend szerverrel, a backend csak akkor indul el, ha a bach-db közötti kapcsolat sikeres.

sequelize.authenticate().then(() => {
  console.log('Sikeres kapcsolat az adatbázissal!');

  sequelize.modelManager.addModel(FelhasznaloModel);
  sequelize.modelManager.addModel(TuraraJelentkezes);

  sequelize.sync({force:true}).then(() =>{
    app.listen(PORT, () => {
      console.log(`A szerver elindult és elérhető a http://localhost:${PORT} URL-en!`)
  })
  })
}).catch((error) => {
  console.log("Az adatbázissszerverrel való kapcsolat sikertelen")
  console.log(error);})

//A HTTP Szerver indítása a 3000-es porton


