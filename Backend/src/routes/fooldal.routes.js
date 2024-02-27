const express = require('express');
const fooldalController = require('../controllers/fooldal.contoller')

const fooldalRouter = express.Router();

fooldalRouter.get("/", fooldalController.fooldalGETController);


module.exports = fooldalRouter;