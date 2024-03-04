const Turak = require('../models/turak.model');
const TuraraJelentkezes = require('../models/turaJelentkezes.model')
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

async function turakPOSTController(req, res) {
  
    try {

        var felhasznaloId = req.user.userId;
        var turaId = req.body.Tura_id;

        try {
            osszekapcsolas = await TuraraJelentkezes.build({
                Tura_id: turaId,
                User_id: felhasznaloId
            })
        
            await osszekapcsolas.save();
        res.status(200).json({osszekapcsolas});
        
        }
         
        catch (error) {
            console.log(error);
            res.status(500).json({
                error: true,
                status:500,
                message: "Szerver hiba a jelentkezés elmentése közben!"
            })
        }
    } 
    catch (error) {
        console.log(error);
        res.status(400).json({
            error: true,
            status: 400,
            message: "Nem jöttek meg a szükséges adatok a jelentkezéshez!"
        })
    }
   

}

async function turakPUTController(req, res) {
        
        var { Indulas_ido, Indulas_hely, Varhato_erkezesi_ido, Erkezesi_hely, Utvonal_nehezsege, Szervezo_elerhetosege, Tura_dija, Leiras } = req.body;

       /* var letrehozoId = req.user.userId;
        var Letrehozo = req.user.felhasznalonev;
        var elerhetosegAlapertelmezett = req.user.email;
*/

var Letrehozo = req.user.felhasznalonev;

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

}

function turakPATCHController(req, res) {
    
}

function turakDELETEController(req, res) {

        
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
            console.log("Nincs ilyen azonosítójú Túra");
            res.status(404).json({
                error: true,
                status: 404,
                message: "Nincs ilyen aonoítójú Túra!"
            })
        })

    }




module.exports = {
    turakGETController, turakPOSTController ,turakPUTController, turakDELETEController
}