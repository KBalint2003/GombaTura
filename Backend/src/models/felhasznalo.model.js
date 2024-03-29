const { DataTypes } = require('sequelize');
const sequelize = require("../adatbazisKapcsolat");
const Felhasznalo = sequelize.define('Felhasznalok', {

    User_id: {
        type:DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },

    Felhasznalonev: {
        type: DataTypes.STRING,
        allowNull: false,
    },

    Jelszo: {
        type: DataTypes.STRING(60),
        allowNull: false,

    },

    Email: {
        type: DataTypes.STRING,
        allowNull: false,
    },

    Szuletesi_ido: {
        type: DataTypes.DATEONLY,
        allowNull: true
    },

    Telefon_szam: {
        type: DataTypes.STRING(12),
        allowNull: true,
        defaultValue: ""
    },

    FelhasznaloProfilKep: {
        type: DataTypes.STRING(50),
        allowNull: true
    }


},
{
    tableName:"Felhasznalok"

});


module.exports = Felhasznalo;

