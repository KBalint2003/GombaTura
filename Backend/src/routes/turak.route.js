//Express és az AuthMiddleware importálása
const express = require('express');
const AuthMiddleware = require('../middlewares/AuthMiddleware');

//A controller és a Router importálása, inicializálása
const turakController = require('../controllers/turak.controller');
const turakRouter = express.Router();

//Route-ok létrehozása, ahol szükséges, a route elérési útja és a megfelelő controller közé az AuthMiddleware elhelyezése
turakRouter.get("/turak/osszes", turakController.osszesTurakGETController);
turakRouter.get("/turak/jelentkezett",AuthMiddleware, turakController.turakJelentkezettGETController);
turakRouter.delete("/turak/jelentkezett",AuthMiddleware, turakController.jelentkezesDELETEController);
turakRouter.get("/turak",AuthMiddleware , turakController.turakGETController);
turakRouter.put("/turak",AuthMiddleware , turakController.turakPUTController);
turakRouter.post("/turak",AuthMiddleware , turakController.turakPOSTController);
turakRouter.patch("/turak", AuthMiddleware, turakController.turakPATCHController);
turakRouter.delete("/turak", AuthMiddleware, turakController.jelentkezesDELETEController);


module.exports = turakRouter