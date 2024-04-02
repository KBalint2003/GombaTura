//Package-ek importálása
const express = require('express');

const cors = require('cors');
const { idozitettFLTorles } = require('./idozitettFeketeListaTorles')

//Adatbázis kapcsolat importálása
const sequelize = require('./adatbazisKapcsolat')

//Modellek importálása
const FelhasznaloModel = require('./models/felhasznalo.model');
const TuraModel = require('./models/turak.model');
const TuraraJelentkezes = require('./models/turaJelentkezes.model');
const feketeLista = require('./models/feketeLista.model');
const GombakModel = require('./models/gomba.model');
const PosztModel = require('./models/Poszt.model');
const KommentModel = require('./models/komment.model');

//Táblák közötti kapcsolatok

FelhasznaloModel.hasMany(PosztModel, {foreignKey: "Posztolo",as: "PosztLetrehozasok"})
PosztModel.belongsTo(FelhasznaloModel, {foreignKey:"Posztolo", as: "PosztoloNeve"})

PosztModel.hasMany(KommentModel, {foreignKey: "Poszt"});
KommentModel.belongsTo(PosztModel, {foreignKey:"Poszt", as: "EredetiPoszt"})

FelhasznaloModel.hasMany(KommentModel, {foreignKey: "Kommentelo",as: "KommentLetrehozasok"})
KommentModel.belongsTo(FelhasznaloModel, {foreignKey:"Kommentelo", as: "KommenteloNeve"})

FelhasznaloModel.hasMany(TuraModel, { foreignKey: 'Letrehozo', as: 'TuraLetrehozasok'});
TuraModel.belongsTo(FelhasznaloModel, { foreignKey: 'Letrehozo', as: 'LetrehozoNeve'});
 
TuraModel.belongsToMany(FelhasznaloModel, { through: TuraraJelentkezes, as: 'JelentkezoId'});
FelhasznaloModel.belongsToMany(TuraModel, { through: TuraraJelentkezes, as: 'JelentkezettTuraId'});

//route-ok importálása
const regisztracioRouter = require("./routes/regisztracio.route");
const bejelentkezesRouter = require("./routes/bejelentkezes.route");
const fooldalRouter = require('./routes/fooldal.routes');
const turakRouter = require('./routes/turak.route');
const profilRouter = require('./routes/profil.route');
const gombaRouter = require('./routes/gomba.route');
const forumRouter = require('./routes/forum.route');

//Az express Szerver konfigurálása
const app = express();
app.use(express.json());

app.use(cors({ origin: 'http://localhost:4200', credentials: true }));
const PORT = 3000;

//route-ok definiálása
app.use("/", fooldalRouter);
app.use("/",regisztracioRouter);
app.use("/",bejelentkezesRouter);
app.use("/", turakRouter);
app.use("/", profilRouter);
app.use("/", gombaRouter);
app.use("/", forumRouter);

//Szerver indítása és az adatbázissal való kapcsolatfelvétel. Ha sikertelen a kapcsolat létrehozása az adatbázissal, a szerver nem indul el. Ha sikeres a kapcsolat, az időzített Feketelista törlés is elindul.
sequelize.authenticate().then(() => {
  console.log('Sikeres kapcsolat az adatbázissal!');

  sequelize.modelManager.addModel(FelhasznaloModel);
  sequelize.modelManager.addModel(TuraModel);
  sequelize.modelManager.addModel(TuraraJelentkezes);
  sequelize.modelManager.addModel(feketeLista);
  sequelize.modelManager.addModel(GombakModel);
  sequelize.modelManager.addModel(PosztModel);
  sequelize.modelManager.addModel(KommentModel);

  sequelize.sync({}).then(() =>{
    app.listen(PORT, () => {
      console.log(`A szerver elindult és elérhető a http://localhost:${PORT} URL-en!`)

      idozitettFLTorles.start()
    });
  })
}).catch((error) => {
  console.log("Az adatbázissszerverrel való kapcsolat sikertelen")
  console.log(error);})