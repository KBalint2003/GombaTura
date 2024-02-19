const felhasznaloModell = require('../models/felhasznalo.model') //

const validate = require('validate.js');
const { v4: uuidv4 } = require('uuid');
const megkotesek = require('../megkotesek')
const bcrypt = require('bcrypt');

function regisztracioGETController(req, res){
    res.send("Működik")
}

async function jelszoHash(jelszo){
    const hashedJelszo = await bcrypt.hash(jelszo, 10);
    return hashedJelszo;
}

async function regisztracioPUTController (req, res){

    const { felhasznalonev, email, jelszo, szuletesiIdo, telefonSzam } = req.body;

    //Felhasználónév lekezelése

    if (felhasznalonev === undefined) {
        res.status(400).json({
            code:400,
            message:"Nem lett megadva felhasználónév!"
        })
        return;
    }

    else{
        let msg = validate.single(felhasznalonev, megkotesek.felhasznalonev);

        if (msg) {
            res.status(400).json({
                code: 400,
                type: "Felhasználónév",
                message: msg
            })
            return;
        }
    }

    const letezikEFelhasznalonev = await felhasznaloModell.findOne({ where: { Felhasznalonev: felhasznalonev } });
    if (letezikEFelhasznalonev !== null) {
        res.status(400).json({
            code:400,
            message:"Már létezik felhasználó ilyen felhasználónévvel!"
        })
        return;
    }

    //Email lekezelése

    if (email === undefined) {
        res.status(400).json({
            code:400,
            message:"Nem lett megadva email cím!"
        })
        return;
    }

    else{
        let msg = validate.single(email, megkotesek.email);

        if (msg) {
            res.status(400).json({
                code: 400,
                type: "Email",
                message: msg
            })
            return;
        }
    }

    //jelszó lekezelése

    if (jelszo === undefined) {
        res.status(400).json({
            code:400,
            message:"Nem lett megadva jelszó!"
        })
        return;
    }

    else{
        let msg = validate.single(jelszo, megkotesek.jelszo);

        if (msg) {
            res.status(400).json({
                code: 400,
                type: "jelszó",
                message: msg
            })
            return;
        }
    }

    const letezikEEmail = await felhasznaloModell.findOne({ where: { Email: email } });
    if (letezikEEmail !== null) {
        res.status(400).json({
            code:400,
            message:"Már létezik felhasználó ilyen email címmel!"
        })
        return;
    }

    felhasznalo = await felhasznaloModell.build({
        User_id: uuidv4(),
        Felhasznalonev: felhasznalonev,
        Email: email,
        Jelszo: await jelszoHash(jelszo),
        Szuletesi_ido: szuletesiIdo,
        Telefon_szam: telefonSzam
    })




    await felhasznalo.save();


    res.status(200).json({felhasznalo});

};





module.exports= {
    regisztracioGETController, regisztracioPUTController
}