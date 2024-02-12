const express = require('express');

const regisztracioController = require("../controllers/regisztracio.controller");

const regisztracioRouter = express.Router();

regisztracioRouter.get("/regisztracio", regisztracioController.regisztracioGETController);

regisztracioRouter.put("/regisztracio", regisztracioController.regisztracioPUTController);


module.exports = regisztracioRouter;