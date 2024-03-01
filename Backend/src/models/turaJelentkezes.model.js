const {DataTypes}=require("sequelize");

const sequelize=require("../adatbazisKapcsolat");

const TuraraJelentkezes=sequelize.define("TuraraJelentkezesTabla",{
},

    {
        tableName:"TuraraJelentkezesTabla",
        timestamps: false,
    });
TuraraJelentkezes.removeAttribute('id');


module.exports=TuraraJelentkezes;  