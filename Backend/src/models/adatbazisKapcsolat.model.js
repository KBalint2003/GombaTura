const { Sequelize } = require('sequelize');
const { async } = require('validate.js');

const sequelize = new Sequelize('user-login','root','',{
    host: 'localhost',
    dialect: 'mysql'
})

async function kapcsolat() {
    try {
        await sequelize.authenticate();
        console.log('Sikeres kapcsolat az adatbázissal');
      } catch (error) {
        console.error('Nem sikerült csatlakozni az adatbázishoz.', error);
      }
}

module.exports = {sequelize, kapcsolat};
