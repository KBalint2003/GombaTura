//Express és az AuthMiddleware importálása
const express = require('express');
const AuthMiddleware = require('../middlewares/AuthMiddleware')

//A controller és a Router importálása, inicializálása
const profilController = require('../controllers/profil.controller');
const profilRouter = express.Router();

//Route-ok létrehozása, a route elérési útja és a megfelelő controller közé az AuthMiddleware elhelyezése
profilRouter.get("/profil",AuthMiddleware, profilController.felhasznaloGETController);
profilRouter.patch("/profil",AuthMiddleware, profilController.felhasznaloPATCHController);
profilRouter.delete("/profil",AuthMiddleware, profilController.felhasznaloDELETEController);

module.exports = profilRouter;