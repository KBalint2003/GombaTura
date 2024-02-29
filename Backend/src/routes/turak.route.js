const express = require('express');

const turakController = require('../controllers/turak.controller');
const turakRouter = express.Router();

turakRouter.get("/turak", turakController.turakGETController)

module.exports = turakRouter