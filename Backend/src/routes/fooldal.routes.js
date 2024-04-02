//Express importálása
const express = require('express');

//A controller és a Router importálása, inicializálása
const fooldalController = require('../controllers/fooldal.contoller');
const fooldalRouter = express.Router();

//Route-ok létrehozása
fooldalRouter.get("/", fooldalController.fooldalGETController);


module.exports = fooldalRouter;