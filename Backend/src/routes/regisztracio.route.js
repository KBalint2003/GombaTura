const express = require('express');

const regisztracioController = require("../controllers/regisztracio.controller");

const regisztracioRouter = express.Router();

regisztracioRouter.get("/regisztracio", regisztracioController.regisztracioGETController);

regisztracioRouter.post("/regisztracio", regisztracioController.regisztracioPOSTController);


module.exports = regisztracioRouter;