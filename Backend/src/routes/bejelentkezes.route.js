const express = require('express');
const bejelentkezesController = require('../controllers/bejelentkezes.controller')
const AuthMiddleware = require('../middlewares/AuthMiddleware')
const bejelentkezesRouter = express.Router();

bejelentkezesRouter.get("/login", bejelentkezesController.bejelentkezesGETController)
bejelentkezesRouter.post("/login", bejelentkezesController.bejelentkezesPOSTController)
bejelentkezesRouter.post("/logout",AuthMiddleware, bejelentkezesController.kijelentkezesPOSTController)
module.exports = bejelentkezesRouter;