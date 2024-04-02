//Express importálása
const express = require('express');

//A controller és a Router importálása, inicializálása
const gombaController = require('../controllers/gomba.controller');
const gombaRouter = express.Router();

//Route-ok létrehozása
gombaRouter.get("/enciklopedia", gombaController.osszesGombaGETController);

module.exports = gombaRouter;