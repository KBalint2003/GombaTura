//Express és az AuthMiddleware importálása
const express = require('express');
const AuthMiddleware = require('../middlewares/AuthMiddleware')

//A controller és a Router importálása, inicializálása
const bejelentkezesController = require('../controllers/bejelentkezes.controller')
const bejelentkezesRouter = express.Router();

//Route-ok létrehozása, ahol szükséges, a route elérési útja és a megfelelő controller közé az AuthMiddleware elhelyezése
bejelentkezesRouter.post("/login", bejelentkezesController.bejelentkezesPOSTController)
bejelentkezesRouter.post("/logout",AuthMiddleware, bejelentkezesController.kijelentkezesPOSTController)

module.exports = bejelentkezesRouter;