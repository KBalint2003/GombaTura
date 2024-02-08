const {Sequelize, DataTypes}=require("sequelize");
const Felhasznalo = require('./felhasznalo.model')


const sequelize=require("../adatbazisKapcsolat");

const TuraraJelentkezes=sequelize.define("TuraraJelentkezesTabla",{
    
},

{
    tableName:"TuraraJelentkezesTabla",
    timestamps: false,
});
TuraraJelentkezes.removeAttribute('id');

TuraraJelentkezes.belongsTo(Felhasznalo, {
    foreignKey: "Felhasznalo_id",
    targetKey: "User_id",
});


module.exports=TuraraJelentkezes;  