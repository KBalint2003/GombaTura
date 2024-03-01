const  FelhasznaloModell  = require('../models/felhasznalo.model');
const jwt = require("jsonwebtoken");
const bcrypt = require('bcrypt');


function bejelentkezesGETController(req, res) {
    res.status(200).send("Login Page");
}

async function bejelentkezesPOSTController(req, res) {
    let {email, jelszo} = req.body;

    let letezoFelhasznalo;
    let isMatching;
    try{
        letezoFelhasznalo = await FelhasznaloModell.findOne({ where: { email: email } });
        isMatching = await bcrypt.compare(jelszo, letezoFelhasznalo.Jelszo)
    }
    catch(error){
        console.log(error);
        res.status(500).json({
            eror: true,
            status: 500,
            message: "Szerver hiba"
        });
    }

    if (!letezoFelhasznalo || isMatching === false) {
        res.status(400).json({
            error: true,
            status: 400,
            message: "Hibás felhasználónév vagy jelszó!"
        });
    }

//JWT Token létrehozása

    let token;
    try {
        
        token = jwt.sign(
            {
                userId: letezoFelhasznalo.User_id,
                email: letezoFelhasznalo.email
            },
            "titkositokulcs",
            { expiresIn: "1h" }
        );

    } catch (error) {
        console.log(error);
        res.status(500).json({
            error: true,
            status: 500,
            message: "Szerver hiba (jwt)"
        })
    }
    res.status(200).json({
        success: true,
        data: {
            felhasznaloId: letezoFelhasznalo.User_id,
            email: letezoFelhasznalo.email,
            token: token,
        },
    });
    
}


function kijelentkezesDELETEController(req, res) {
    if (!req.isAuthenticated()) {
        req.logout((err) => {
            if (err) {
                console.error(err);
                return next(err);
            }


            console.log(req.body);
            res.status(200)
            res.redirect('/');
        });
    }
    else{
        res.status(401).json({
            error: true,
            code: 401,
            message: "Nincs felhasználó, aki ki tudna jelentkezni!"
        })
    }

}

module.exports = {
    bejelentkezesGETController,bejelentkezesPOSTController, kijelentkezesDELETEController
}