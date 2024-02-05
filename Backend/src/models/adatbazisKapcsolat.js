const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('zemplen_eheto_gombai','root','',{
    host: 'localhost',
    dialect: 'mariadb'
})

module.exports = sequelize;
