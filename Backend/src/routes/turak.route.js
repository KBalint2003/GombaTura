const express = require('express');
const AuthMiddleware = require('../middlewares/AuthMiddleware')


const turakController = require('../controllers/turak.controller');
const turakRouter = express.Router();

turakRouter.get("/turak", turakController.turakGETController);
turakRouter.put("/turak",AuthMiddleware , turakController.turakPUTController)

module.exports = turakRouter