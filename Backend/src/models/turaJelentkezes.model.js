const {DataTypes}=require("sequelize");

const sequelize=require("../adatbazisKapcsolat");
const Tura = require("./turak.model");
const Felhasznalo = require("./felhasznalo.model");

const TuraraJelentkezes=sequelize.define("TuraraJelentkezesTabla",
{
    
},

    {
        timestamps: false,
    });

    TuraraJelentkezes.removeAttribute('id');

 
;  module.exports=TuraraJelentkezes