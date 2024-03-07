const { DataTypes } = require('sequelize');
const sequelize = require('../adatbazisKapcsolat');

const lejaratiIdoTipus = new DataTypes.DATE({
    timeZone: 'Europe/Budapest'
  });

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