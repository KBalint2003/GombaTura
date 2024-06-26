const  FelhasznaloModell  = require('../models/felhasznalo.model');
const jwt = require("jsonwebtoken");
const bcrypt = require('bcrypt');
const feketeLista = require('../models/feketeLista.model');

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
            type: "Szerver1",
            message: "Szerver hiba"
        });
        return;
    }

    if (!letezoFelhasznalo || isMatching === false) {
        res.status(400).json({
            error: true,
            status: 400,
            type: "Hibasadatok",
            message: "Hibás felhasználónév vagy jelszó!"
        });
        return;
    }

//JWT Token létrehozása

    let token;
    try {
        token = jwt.sign(
            {
                userId: letezoFelhasznalo.User_id,
                email: letezoFelhasznalo.Email,
                felhasznalonev: letezoFelhasznalo.Felhasznalonev
            },
            "titkositokulcs",
            { expiresIn: "1h" }
        );

    } catch (error) {
        console.log(error);
        res.status(500).json({
            error: true,
            status: 500,
            type: "Szerver2",
            message: "Szerver hiba (jwt)"
        })
        return;
    }
    res.status(200).json({
        success: true,
        message: "Sikeres bejelentkezés!",
        data: {
            token: token,
        },
    });
    
}

async function kijelentkezesPOSTController(req, res) {



    const token =  req.headers.authorization.split(' ')[1];



        try  {
            kijelentkezettToken = await feketeLista.build({
                token: token
            })

            await kijelentkezettToken.save();

            res.status(200).json({
                success: true,
                message: "Sikeres kijelentkezés!",
            })
        }

        catch (error) {
            console.log(error)
            res.status(500).json({
                error: true,
                status: 500,
                message: "Szerver hiba"
            })
        }
}


module.exports = {
    bejelentkezesPOSTController, kijelentkezesPOSTController
}