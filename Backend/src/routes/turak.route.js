const express = require('express');
const AuthMiddleware = require('../middlewares/AuthMiddleware')


const turakController = require('../controllers/turak.controller');
const turakRouter = express.Router();

turakRouter.get("/turak/osszes", turakController.osszesTurakGETController);
turakRouter.get("/turak/jelentkezett",AuthMiddleware, turakController.turakJelentkezettGETController);
turakRouter.get("/turak",AuthMiddleware , turakController.turakGETController);
turakRouter.put("/turak",AuthMiddleware , turakController.turakPUTController);
turakRouter.post("/turak",AuthMiddleware , turakController.turakPOSTController);
turakRouter.patch("/turak", AuthMiddleware, turakController.turakPATCHController);
turakRouter.delete("/turak", AuthMiddleware, turakController.jelentkezesDELETEController);


module.exports = turakRouter