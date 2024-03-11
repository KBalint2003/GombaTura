const Turak = require('../models/turak.model');
const TuraraJelentkezes = require('../models/turaJelentkezes.model')
const passport = require("passport");
const { v4: uuidv4 } = require('uuid');
const jwt = require('jsonwebtoken');
const Felhasznalo = require('../models/felhasznalo.model');
const { Op } = require('sequelize');


async function turakGETController(req, res) {

    try {
        const id = req.user.userId;

        const turak = await Turak.findAll({
            where: {Letrehozo:id},
            raw: true,
            attributes: {
                exclude: ["createdAt", "updatedAt"],
            },
        })
    
        if (!turak.length) {
            res.status(400).json({
                message: "Nincs még létrehozott túrád!"
            })
            return;
        }
    
        const formazottTurak = turak.map(tura => ({
            ...tura,
            Indulas_ido: new Date(tura.Indulas_ido).toLocaleString(),
            Erkezesi_ido: new Date(tura.Varhato_erkezesi_ido).toLocaleString(),
        }));

        res.status(200).json({
            turak: formazottTurak
        });
    }
     catch (error) {
        console.log(error);
        res.status(500).json({
            error: true,
            status: 500,
            message: "Szerver hiba"
        })
    }


}

async function osszesTurakGETController(req, res) {
    try {
        const turak = await Turak.findAll({
            where: {
                Indulas_ido: {
                    [Op.ne]: new Date().toLocaleDateString(),
                }
            },
            include: [{
                model: Felhasznalo,
                attributes: ["Felhasznalonev"],
                as: "LetrehozoNeve",
            }],
            attributes: {
                exclude: ["Letrehozo", "createdAt", "updatedAt"],
            },
            raw: true,

        });

        console.log(turak)

        if (!turak.length) {
            res.status(400).json({
                status: 400,
                message: "Nincs túra, amire jelentkezni lehetne"
            });
            return;
        }

        // Manuális dátumformázás
        const formazottTurak = turak.map(tura => ({
            ...tura,
            Indulas_ido: new Date(tura.Indulas_ido).toLocaleString(),
            Erkezesi_ido: new Date(tura.Varhato_erkezesi_ido).toLocaleString(),
        }));

        res.status(200).json({
            turak: formazottTurak
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({
            error: true,
            status: 500,
            message: "Szerver hiba"
        });
    }
}

async function turakPOSTController(req, res) {
  
    try {

        const felhasznaloId = req.user.userId;
        const turaId = req.body.Tura_id;

        if (felhasznaloId === undefined || turaId === undefined) {
            res.status(400).json({
                error:true,
                status: 400,
                message: "Nem érkeztek meg a szükséges adatok a jelentkezéshez!"
            })
            return;
        }

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

async function turakPUTController(req, res) {

    try {
        var { Tura_neve, Indulas_ido, Indulas_hely, Erkezesi_ido, Erkezesi_hely, Utvonal_nehezsege, Szervezo_elerhetosege, Tura_dija, Leiras } = req.body.ujTura;

        console.log(Tura_neve)

        var Letrehozo = req.user.userId;
    
        if (Tura_neve === undefined) {
            res.status(400).json({
                error:true,
                status: 400,
                message: "Hiányzó adat: Túra neve"
            })
            return;
        }
    
        if (Indulas_ido === undefined) {
            res.status(400).json({
                error:true,
                status: 400,
                message: "Hiányzó adat: Indulás ideje"
            })
            return;
        }
    
        if (Indulas_hely === undefined) {
            res.status(400).json({
                error:true,
                status: 400,
                message: "Hiányzó adat: Indulás helye"
            })
            return;
        }
    
        if (Erkezesi_ido === undefined) {
            res.status(400).json({
                error:true,
                status: 400,
                message: "Hiányzó adat: Várható érkezési idő"
            })
            return;
        }
    
        if (Erkezesi_hely === undefined) {
            res.status(400).json({
                error:true,
                status: 400,
                message: "Hiányzó adat: érkezés helye"
            })
            return;
        }
    
        if (Utvonal_nehezsege === undefined) {
            res.status(400).json({
                error:true,
                status: 400,
                message: "Hiányzó adat: útvonal nehézsége"
            })
            return;
        }
    
        if (Szervezo_elerhetosege === undefined) {
            Szervezo_elerhetosege = req.user.email;
        }
        else{
            Szervezo_elerhetosege= req.body.ujTura.Szervezo_elerhetosege;
        }
    
    
        tura = await Turak.build({
            Tura_id: uuidv4(),
            Letrehozo: Letrehozo,
            Tura_neve: Tura_neve,
            Indulas_ido: Indulas_ido,
            Indulas_hely: Indulas_hely,
            Varhato_erkezesi_ido: Erkezesi_ido,
            Erkezesi_hely: Erkezesi_hely,
            Utvonal_nehezsege: Utvonal_nehezsege,
            Szervezo_elerhetosege: Szervezo_elerhetosege,
            Tura_dija: Tura_dija,
            Leiras: Leiras
        })
    
        await tura.save();
        res.status(201).json({
            message: "A túra sikeresen létre lett hozva!"
        });
    
    }   
    catch (error) {
        console.log(error);
        res.status(500).json({
            error: true,
            status: 500,
            message: "Szerver hiba"
        })
    }
}

function turakPATCHController(req, res) {
    
    var { Tura_neve, Indulas_ido, Indulas_hely, Varhato_erkezesi_ido, Erkezesi_hely, Utvonal_nehezsege, Szervezo_elerhetosege, Tura_dija, Elmarad_a_tura, Leiras } = req.body;

    const turaId = req.body.Tura_id

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
    osszesTurakGETController ,turakGETController, turakPOSTController ,turakPUTController, turakDELETEController
}
