const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('gombaproba','root','',{
    host: 'localhost',
    dialect: 'mariadb',
    define: {
        freezeTableName: true,
    }
})

module.exports = sequelize;
