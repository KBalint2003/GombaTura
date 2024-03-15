const jwt = require('jsonwebtoken')
const feketeLista = require('../models/feketeLista.model');

const tokenErvenyesites =async (req, res, next) => {
    var token = req.headers.authorization;

    if (!token) {
      res.status(401).json({
        error: true,
        status: 401,
        message: "Hozzáférés megtagadva: bejelentkezés szükséges!"
      });
      return;
    };
      
    token = token.split(' ')[1]
    const listaEleme = await feketeLista.findOne({ where: { token: token } } )

    if (listaEleme) {
      res.status(401).json({
        error: true,
        code: 401,
        message: "Hozzáférés megtagadva: Ez a token már blacklisten van!"
      });
      return;
    }

      try {
        const decodedToken = jwt.verify(token, 'titkositokulcs');
        req.user = decodedToken;
        if (decodedToken) {
            next();
        }
      } catch (error) {
        console.log(error);
        res.status(401).json({
            error: true,
            status: 401,
            message: "nem megfelelő token"
        });
        return;
      }
    };


module.exports = tokenErvenyesites;