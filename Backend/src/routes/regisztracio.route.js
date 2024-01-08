const express = require('express');

const regisztracioController = require("../controllers/regisztracio.controller");
// const { async } = require('validate.js');

const regisztracioRouter = express.Router();

regisztracioRouter.get("/regisztracio", regisztracioController.regisztracioGETController);

regisztracioRouter.post("/regisztracio", regisztracioController.regisztracioPOSTController);


module.exports = regisztracioRouter;