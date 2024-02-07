const { Sequelize,DataTypes } = require("sequelize");
const sequelize = require("../adatbazisKapcsolat");


const Felhasznalo = sequelize.define('belepes', {
    
    User_id: {
        type: DataTypes.STRING(50),
        allowNull: false,
        primaryKey: true
    },
    
    Felhasznalonev: {
        type: DataTypes.STRING,
        allowNull: false,
    },

    Jelszo: {
        type: DataTypes.STRING(50),
        allowNull: false,

    },

    Email: {
        type: DataTypes.STRING,
       allowNull: false,
    },




});

module.exports = Felhasznalo;

