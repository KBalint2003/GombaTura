const express = require('express');
const gombaController = require('../controllers/gomba.controller');
const gombaRouter = express.Router();

gombaRouter.get("/enciklopedia", gombaController.osszesGombaGETController);

module.exports = gombaRouter;