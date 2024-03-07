const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('gombaproba','root','',{
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
