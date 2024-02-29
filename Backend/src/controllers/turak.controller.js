const Turak = require('../models/turak.model');
const passport = require("passport");
const { v4: uuidv4 } = require('uuid');

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

function turakPUTController(req, res) {
    if (req.isAuthenticated()) {
        
        const { letrehozo, Indulas_ido, Indulas_hely, Varhato_erkezesi_ido, Erkezesi_hely, Utvonal_nehezsege } = req.body;

        if (condition) {
            
        }

    }
}

function termekPATCHController(req, res) {
    
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
    turakGETController
}