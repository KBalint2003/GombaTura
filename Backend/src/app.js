const express = require('express');
const jwt = require("jsonwebtoken");
const sequelize = require('./adatbazisKapcsolat')
const FelhasznaloModel = require('./models/felhasznalo.model');
const TuraModel = require('./models/turak.model');
const TuraraJelentkezes = require('./models/turaJelentkezes.model');
const { idozitettFLTorles } = require('./idozitettFeketeListaTorles')
const {Sequelize, DataTypes}=require("sequelize");

FelhasznaloModel.hasMany(TuraModel, {
  foreignKey: 'Letrehozo',
  as: 'TuraLetrehozasok'
});
TuraModel.belongsTo(FelhasznaloModel, {
  foreignKey: 'Letrehozo',
  as: 'LetrehozoNeve'
});

TuraModel.belongsToMany(FelhasznaloModel, { through: TuraraJelentkezes, as: 'JelentkezoId'});
FelhasznaloModel.belongsToMany(TuraModel, { through: TuraraJelentkezes, as: 'JelentkezettTuraId'});

const regisztracioRouter = require("./routes/regisztracio.route");
const bejelentkezesRouter = require("./routes/bejelentkezes.route");
const fooldalRouter = require('./routes/fooldal.routes');
const turakRouter = require('./routes/turak.route');
const profilRouter = require('./routes/profil.route');
//Az express Szerver konfigurálása
const app = express();
const cors = require('cors');
const tokenErvenyesites = require('./middlewares/AuthMiddleware');
const feketeLista = require('./models/feketeLista.model');

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
app.use("/", turakRouter);
app.use("/", profilRouter)



//kapcsolat function, segítségével csatlakoztatni tudjuk az adatbázist a backend szerverrel, a backend csak akkor indul el, ha a bach-db közötti kapcsolat sikeres.

sequelize.authenticate().then(() => {
  console.log('Sikeres kapcsolat az adatbázissal!');

  sequelize.modelManager.addModel(FelhasznaloModel);
  sequelize.modelManager.addModel(TuraModel);
  sequelize.modelManager.addModel(TuraraJelentkezes);
  sequelize.modelManager.addModel(feketeLista)

  sequelize.sync({}).then(() =>{
    app.listen(PORT, () => {
      console.log(`A szerver elindult és elérhető a http://localhost:${PORT} URL-en!`)

      idozitettFLTorles.start()
    });
  })
}).catch((error) => {
  console.log("Az adatbázissszerverrel való kapcsolat sikertelen")
  console.log(error);})