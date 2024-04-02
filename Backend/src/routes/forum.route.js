//Express és az AuthMiddleware importálása
const express = require('express');
const AuthMiddleware = require('../middlewares/AuthMiddleware');

const forumController = require('../controllers/forum.controller');
const forumRouter = express.Router();

forumRouter.get("/forum/osszes", forumController.posztokGETController);
forumRouter.get("/forum", forumController.posztKommentekkelGETController);
forumRouter.put("/forum", AuthMiddleware, forumController.posztPUTController);
forumRouter.patch("/forum", AuthMiddleware, forumController.posztPATCHController);
forumRouter.delete("/forum", AuthMiddleware, forumController.posztDELETEController);
forumRouter.put("/forum/komment", AuthMiddleware, forumController.kommentPUTController)
module.exports = forumRouter;
