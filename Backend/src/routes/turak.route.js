const express = require('express');
const AuthMiddleware = require('../middlewares/AuthMiddleware')


const turakController = require('../controllers/turak.controller');
const turakRouter = express.Router();

turakRouter.get("/turak/osszes", turakController.osszesTurakGETController);
turakRouter.get("/turak",AuthMiddleware , turakController.turakGETController);
turakRouter.put("/turak",AuthMiddleware , turakController.turakPUTController);
turakRouter.post("/turak",AuthMiddleware , turakController.turakPOSTController);
turakRouter.delete("/turak",AuthMiddleware , turakController.turakDELETEController);


module.exports = turakRouter