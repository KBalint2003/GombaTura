//sequelize importálása
const { Sequelize } = require('sequelize');

//Kapcsolat definiálása a sequelize-nak
const sequelize = new Sequelize('mushroomtour','root','',{
    host: 'localhost',
    dialect: 'mariadb',
    define: {
        freezeTableName: true,
    },
    dialectOptions: {
        useUTC: false
    },
    timezone: "+01:00",
    typeCast: true
})

module.exports = sequelize;