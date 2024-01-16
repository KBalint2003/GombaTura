const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('user-login','root','',{
    host: 'localhost',
    dialect: 'mysql'
})

module.exports = sequelize;
