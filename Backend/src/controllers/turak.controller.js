const Turak = require('../models/turak.model');
const passport = require("passport");
const { v4: uuidv4 } = require('uuid');
const jwt = require('jsonwebtoken')

function turakGETController (req, res){

    Turak.findAll()
    .then((turak)=>{
        console.log("A túrák lekérdezése sikeres!");
        res.status(200).json({turak})
    })
    .catch((err)=>{
        console.log("A túrák lekérdezése sikertelen!");
        console.log(err);
        res.status(500).json({
            error: true,
            code: 500,
            message: "A túrák lekérdezése sikertelen!"
        })
    })
}

function turakPOSTController(req, res) {
    
}

async function turakPUTController(req, res) {
        
        const { Indulas_ido, Indulas_hely, Varhato_erkezesi_ido, Erkezesi_hely, Utvonal_nehezsege, Szervezo_elerhetosege, Tura_dija, Leiras } = req.body;

       /* var letrehozoId = req.user.userId;
        var Letrehozo = req.user.felhasznalonev;
        var elerhetosegAlapertelmezett = req.user.email;
*/

const Letrehozo = req.user.felhasznalonev;

if (Indulas_ido === undefined) {
    res.status(400).json({
        error:true,
        status: 400,
        message: "Hiányzó adat: Indulás ideje"
    })
}

if (Indulas_hely === undefined) {
    res.status(400).json({
        error:true,
        status: 400,
        message: "Hiányzó adat: Indulás helye"
    })
}

if (Varhato_erkezesi_ido === undefined) {
    res.status(400).json({
        error:true,
        status: 400,
        message: "Hiányzó adat: Várható érkezési idő"
    })
}

if (Erkezesi_hely === undefined) {
    res.status(400).json({
        error:true,
        status: 400,
        message: "Hiányzó adat: érkezés helye"
    })
}

if (Utvonal_nehezsege === undefined) {
    res.status(400).json({
        error:true,
        status: 400,
        message: "Hiányzó adat: útvonal nehézsége"
    })
}

if (Szervezo_elerhetosege === undefined) {
    Szervezo_elerhetosege = req.user.email;
}
else{
    Szervezo_elerhetosege = req.body.Szervezo_elerhetosege;
}


tura = await Turak.build({
    Tura_id: uuidv4(),
    Letrehozo: Letrehozo,
    Indulas_ido: Indulas_ido,
    Indulas_hely: Indulas_hely,
    Varhato_erkezesi_ido: Varhato_erkezesi_ido,
    Erkezesi_hely: Erkezesi_hely,
    Utvonal_nehezsege: Utvonal_nehezsege,
    Szervezo_elerhetosege: Szervezo_elerhetosege,
    Tura_dija: Tura_dija,
    Leiras: Leiras
})

await tura.save();
res.status(200).json({tura});

        res.status(200).json({
            id: letrehozoId,
            felhasznalonev: Letrehozo,
            email: elerhetosegAlapertelmezett
        })

}

function turakPATCHController(req, res) {
    
}

function turakDELETEController(req, res) {
    
    if (req.isAuthenticated()) {
        
        const turaId = req.body.Tura_id;

        Turak.findByPk(turaId)
        .then((tura) => {
            tura.destroy()
            .then(() => {
                console.log("Túra törlése sikeres!");
                res.status(200).json({
                    message: "Termék törlése sikeres!"
                });
            })
            .catch(() => {
                console.log("Túra törlése sikertelen!");
                res.status(500).json({
                    error: true,
                    status: 500,
                    message: "Termék törlése sikertelen!"
                });
            })
        })
        .catch((error) => {
            console.log(error);
            console.log("Nincs ilyen azonosítójú termék");
            res.status(404).json({
                error: true,
                status: 404,
                message: "Nincs ilyen aonoítójú termék!"
            })
        })

    }
    else{
        res.status
    }
}



module.exports = {
    turakGETController, turakPUTController
}