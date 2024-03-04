const express = require('express');
const bejelentkezesController = require('../controllers/bejelentkezes.controller')

const bejelentkezesRouter = express.Router();

bejelentkezesRouter.get("/login", bejelentkezesController.bejelentkezesGETController)
bejelentkezesRouter.post("/login", bejelentkezesController.bejelentkezesPOSTController)
bejelentkezesRouter.post("/logout", bejelentkezesController.kijelentkezesPOSTController)
module.exports = bejelentkezesRouter;