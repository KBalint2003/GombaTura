const express = require('express');

const jwt = require("jsonwebtoken");
const sequelize = require('./adatbazisKapcsolat')
const FelhasznaloModel = require('./models/felhasznalo.model')
const TuraModel = require('./models/turak.model')
const TuraraJelentkezes = require('./models/turaJelentkezes.model');



TuraModel.belongsToMany(FelhasznaloModel, { through: TuraraJelentkezes, foreignKey: 'Tura_id'});
FelhasznaloModel.belongsToMany(TuraModel, { through: TuraraJelentkezes, foreignKey: 'User_id' });

const regisztracioRouter = require("./routes/regisztracio.route");
const bejelentkezesRouter = require("./routes/bejelentkezes.route");
const fooldalRouter = require('./routes/fooldal.routes');
const turakRouter = require('./routes/turak.route')
//Az express Szerver konfigurálása
const app = express();
const cors = require('cors');

//const passport = require('passport');
//const setupPassport = require('./passport-config');

app.use(express.json());
app.use(cors({ origin: 'http://localhost:4200', credentials: true }));
//setupPassport(passport)
//app.use(passport.initialize());
//app.use(passport.session());
const PORT = 3000;


app.use("/", fooldalRouter);
app.use("/",regisztracioRouter);
app.use("/",bejelentkezesRouter);
app.use("/", turakRouter)
//kapcsolat function, segítségével csatlakoztatni tudjuk az adatbázist a backend szerverrel, a backend csak akkor indul el, ha a bach-db közötti kapcsolat sikeres.

sequelize.authenticate().then(() => {
  console.log('Sikeres kapcsolat az adatbázissal!');

  sequelize.modelManager.addModel(FelhasznaloModel);
  sequelize.modelManager.addModel(TuraModel);
  sequelize.modelManager.addModel(TuraraJelentkezes);


  sequelize.sync({}).then(() =>{
    app.listen(PORT, () => {
      console.log(`A szerver elindult és elérhető a http://localhost:${PORT} URL-en!`)
    })
  })
}).catch((error) => {
  console.log("Az adatbázissszerverrel való kapcsolat sikertelen")
  console.log(error);})

//A HTTP Szerver indítása a 3000-es porton


//USER1: 
    //"email":"gombamester2@test.com",
    //"jelszo":"tesztJelszo2024",
    //"User_id": "2855a7f0-7939-44f9-b3c7-5569aa45fe89",


//USER1: 
    //"email":"gombamester1@test.com",
    //"jelszo":"tesztJelszo2",
    //"User_id": "2836a19f-b056-410a-8069-ce1a7cf98b5f",