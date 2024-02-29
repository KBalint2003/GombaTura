const express = require('express');

const sequelize = require('./adatbazisKapcsolat')
const FelhasznaloModel = require('./models/felhasznalo.model')
const TuraModel = require('./models/turak.model')

const regisztracioRouter = require("./routes/regisztracio.route");
const bejelentkezesRouter = require("./routes/bejelentkezes.route");
const fooldalRouter = require('./routes/fooldal.routes');
const turakRouter = require('./routes/turak.route')
//Az express Szerver konfigurálása
const app = express();
const cors = require('cors');

const passport = require('passport');
const session = require('express-session');
const setupPassport = require('./passport-config');

app.use(session({
  secret: "secret",
  resave: "false",// Ha true lenne, minden kérésnél új sessiont csinálna, akkor is, ha ugyanaz a felhasználó
  saveUninitialized: true,
}))

app.use(express.json());
app.use(cors({ origin: 'http://localhost:4200', credentials: true }));

setupPassport(passport)
app.use(passport.initialize());
app.use(passport.session());
const PORT = 3000;


app.use("/", fooldalRouter);
app.use("/",regisztracioRouter);
app.use("/",bejelentkezesRouter);
app.use("/", turakRouter)
//kapcsolat function, segítségével csatlakoztatni tudjuk az adatbázist a backend szerverrel, a backend csak akkor indul el, ha a bach-db közötti kapcsolat sikeres.

sequelize.authenticate().then(() => {
  console.log('Sikeres kapcsolat az adatbázissal!');

  sequelize.modelManager.addModel(FelhasznaloModel);
  //sequelize.modelManager.addModel(TuraraJelentkezesModel);
  sequelize.modelManager.addModel(TuraModel);


  sequelize.sync({}).then(() =>{
    app.listen(PORT, () => {
      console.log(`A szerver elindult és elérhető a http://localhost:${PORT} URL-en!`)
    })
  })
}).catch((error) => {
  console.log("Az adatbázissszerverrel való kapcsolat sikertelen")
  console.log(error);})

//A HTTP Szerver indítása a 3000-es porton


