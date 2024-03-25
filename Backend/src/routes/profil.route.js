const express = require('express');
const AuthMiddleware = require('../middlewares/AuthMiddleware')

const profilController = require('../controllers/profil.controller');
const profilRouter = express.Router();

profilRouter.get("/profil",AuthMiddleware, profilController.felhasznaloGETController);
profilRouter.patch("/profil",AuthMiddleware, profilController.felhasznaloPATCHController);
profilRouter.delete("/profil",AuthMiddleware, profilController.felhasznaloDELETEController);

module.exports = profilRouter;