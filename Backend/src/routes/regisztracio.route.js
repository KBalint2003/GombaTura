//Express importálása
const express = require('express');

//A controller és a Router importálása, inicializálása
const regisztracioController = require("../controllers/regisztracio.controller");
const regisztracioRouter = express.Router();

//Route-ok létrehozása
regisztracioRouter.put("/regisztracio", regisztracioController.regisztracioPUTController);

module.exports = regisztracioRouter;