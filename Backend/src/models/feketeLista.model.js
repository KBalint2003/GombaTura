//Package és db importálása
const { DataTypes } = require('sequelize');
const sequelize = require('../adatbazisKapcsolat');

//Model definiálása
const feketeLista = sequelize.define('Feketelista', {
    token: {
        type: DataTypes.STRING(300),
        allowNull: false
    }
},

{
    timestamps: false
});


module.exports = feketeLista;