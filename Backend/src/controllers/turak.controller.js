//package és model importok

const Turak = require('../models/turak.model');
const TuraraJelentkezesTabla = require('../models/turaJelentkezes.model');
const { v4: uuidv4 } = require('uuid');
const jwt = require('jsonwebtoken');
const Felhasznalo = require('../models/felhasznalo.model');
const { Sequelize, Op } = require('sequelize');

//Az Összes túrának a lekérdezése
async function osszesTurakGETController(req, res) {
    try {

        var bejelentkezettUserToken = req.headers.authorization; 

        if (!bejelentkezettUserToken) { //Bejelentkezés ellenőrzése 
        

        const turak = await Turak.findAll({
            attributes: {
                include: [[Sequelize.fn("COUNT", Sequelize.col("JelentkezoId.User_id")), "Jelentkezok"]],//jelentkezők megszámlálása
            },
            include: [
                {
                    model: Felhasznalo,
                    as: "JelentkezoId",
                    attributes: []
                },
                {
                    model: Felhasznalo,
                    attributes: ["Felhasznalonev"],
                    as: "LetrehozoNeve",
                },
            ],

            //Azokat kéri le, ahol a dátum nem kisebb, mint az aktuális, és nem fog elmaradni a túra
            where: {
                Indulas_ido: {
                    [Op.ne]: new Date().toLocaleDateString(),
                },
                Elmarad_a_tura: false
            },
            group: ['Tura_id'],
            raw: true,
        });

        if (!turak.length) {
            res.status(400).json({
                status: 400,
                message: "Nincs túra, amire jelentkezni lehetne"
            });
            return;
        }

        // Manuális dátumformázás és csak a szükséges mezők hozzáadása
        const formazottTurak = turak.map(tura => ({
            Tura_id: tura.Tura_id,
            Tura_neve: tura.Tura_neve,
            Indulas_ido: new Date(tura.Indulas_ido).toLocaleString(),
            Indulas_hely: tura.Indulas_hely,
            Erkezesi_ido: new Date(tura.Varhato_erkezesi_ido).toLocaleString(),
            Erkezesi_hely: tura.Erkezesi_hely,
            Utvonal_nehezsege: tura.Utvonal_nehezsege,
            Szervezo_elerhetosege: tura.Szervezo_elerhetosege,
            Tura_dija: tura.Tura_dija,
            Elmarad_a_tura: tura.Elmarad_a_tura,
            Leiras: tura.Leiras,
            Jelentkezok: tura.Jelentkezok,
            Felhasznalonev: tura["LetrehozoNeve.Felhasznalonev"],
        }));

        res.status(200).json({
            success: true,
            turak: formazottTurak,
        });
    }

    else{

        bejelentkezettUserToken=bejelentkezettUserToken.split(' ')[1]
        const decodedToken = jwt.verify(bejelentkezettUserToken, 'titkositokulcs');
        req.user = decodedToken;

        const bejelentkezettUserId = req.user.userId

        try{
            const jelentkezettTuraId = await TuraraJelentkezesTabla.findAll({
                attributes: ['TurakTuraId'],
                where: { FelhasznalokUserId: bejelentkezettUserId } 
            });

            var jelentkezettTuraIdTomb = jelentkezettTuraId.map(jelentkezes => jelentkezes.TurakTuraId);

        console.log(jelentkezettTuraIdTomb);
    }
    catch(error){
        console.log(error);
    }
        const turak = await Turak.findAll({
            
            attributes: {
                include: [[Sequelize.fn("COUNT", Sequelize.col("JelentkezoId.User_id")), "Jelentkezok"]],
            },
            include: [
                {
                    model: Felhasznalo,
                    as: "JelentkezoId",
                    attributes: []
                },
                {
                    model: Felhasznalo,
                    attributes: ["Felhasznalonev"],
                    as: "LetrehozoNeve",
                },
            ],
            where: {
                Indulas_ido: {
                    [Op.ne]: new Date().toLocaleDateString(),
                },
                Elmarad_a_tura: false
            },
            group: ['Tura_id'],
            raw: true,
        });

        if (!turak.length) {
            res.status(400).json({
                status: 400,
                message: "Nincs túra, amire jelentkezni lehetne"
            });
            return;
        }

        // Manuális dátumformázás és csak a szükséges mezők hozzáadása
        const formazottTurak = turak.map(tura => ({
            Tura_id: tura.Tura_id,
            Tura_neve: tura.Tura_neve,
            Indulas_ido: new Date(tura.Indulas_ido).toLocaleString(),
            Indulas_hely: tura.Indulas_hely,
            Erkezesi_ido: new Date(tura.Varhato_erkezesi_ido).toLocaleString(),
            Erkezesi_hely: tura.Erkezesi_hely,
            Utvonal_nehezsege: tura.Utvonal_nehezsege,
            Szervezo_elerhetosege: tura.Szervezo_elerhetosege,
            Tura_dija: tura.Tura_dija,
            Elmarad_a_tura: tura.Elmarad_a_tura,
            Leiras: tura.Leiras,
            Jelentkezok: tura.Jelentkezok,
            Felhasznalonev: tura["LetrehozoNeve.Felhasznalonev"],
        }));

        if (jelentkezettTuraIdTomb[0] === undefined) {
            res.status(200).json({
                success: true,
                turak: formazottTurak,
            });
            return;
        }

        else{
        res.status(200).json({
            success: true,
            turak: formazottTurak,
            jelentkezettTurakId: jelentkezettTuraIdTomb
        });
    }
    }

} catch (error) {
        console.log(error);
        res.status(500).json({
            error: true,
            status: 500,
            message: "Szerver hiba"
        });
    }
}

async function turakGETController(req, res) {

    try {
        const id = req.user.userId;

        const turak = await Turak.findAll({

            where: {
                Letrehozo:  id ,
                Indulas_ido: {
                    [Op.ne]: new Date().toLocaleDateString(),
                }
            },

            attributes: {
                include: [[Sequelize.fn("COUNT", Sequelize.col("JelentkezoId.User_id")), "Jelentkezok"]],
            },
            include: [
                {
                    model: Felhasznalo,
                    as: "JelentkezoId",
                    attributes: []
                },
                {
                    model: Felhasznalo,
                    attributes: ["Felhasznalonev"],
                    as: "LetrehozoNeve",
                },
            ],
           
            group: ['Tura_id'],
            raw: true,
        });

        if (!turak.length) {
            res.status(400).json({
                status: 400,
                message: "Ön még nem hozott létre túrát!"
            });
            return;
        }

        // Manuális dátumformázás és csak a szükséges mezők hozzáadása
        const formazottTurak = turak.map(tura => ({
            Tura_id: tura.Tura_id,
            Tura_neve: tura.Tura_neve,
            Indulas_ido: new Date(tura.Indulas_ido).toLocaleString(),
            Indulas_hely: tura.Indulas_hely,
            Erkezesi_ido: new Date(tura.Varhato_erkezesi_ido).toLocaleString(),
            Erkezesi_hely: tura.Erkezesi_hely,
            Utvonal_nehezsege: tura.Utvonal_nehezsege,
            Szervezo_elerhetosege: tura.Szervezo_elerhetosege,
            Tura_dija: tura.Tura_dija,
            Elmarad_a_tura: tura.Elmarad_a_tura,
            Leiras: tura.Leiras,
            Jelentkezok: tura.Jelentkezok,
            Felhasznalonev: tura["LetrehozoNeve.Felhasznalonev"],
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

async function turakJelentkezettGETController(req, res) {
     
    try {
        const id = req.user.userId;

        const turak = await Turak.findAll({
              
            where: {
                Indulas_ido: {
                    [Op.ne]: new Date().toLocaleDateString(),
                }
            },

            attributes: {
                include: [[Sequelize.fn("COUNT", Sequelize.col("JelentkezoId.User_id")), "Jelentkezok"]],
            },
            include: [
                {
                    model: Felhasznalo,
                    as: "JelentkezoId",
                    attributes: [],
                    where: { "User_id": id }
                },
                {
                    model: Felhasznalo,
                    attributes: ["Felhasznalonev"],
                    as: "LetrehozoNeve",
                },
            ],
           
            group: ['Tura_id'],
            raw: true,
        });

        if (!turak.length) {
            res.status(400).json({
                status: 400,
                message: "Ön még nem jelentkezett egy túrára sem!"
            });
            return;
        }

        // Manuális dátumformázás és csak a szükséges mezők hozzáadása
        const formazottTurak = turak.map(tura => ({
            Tura_id: tura.Tura_id,
            Tura_neve: tura.Tura_neve,
            Indulas_ido: new Date(tura.Indulas_ido).toLocaleString(),
            Indulas_hely: tura.Indulas_hely,
            Erkezesi_ido: new Date(tura.Varhato_erkezesi_ido).toLocaleString(),
            Erkezesi_hely: tura.Erkezesi_hely,
            Utvonal_nehezsege: tura.Utvonal_nehezsege,
            Szervezo_elerhetosege: tura.Szervezo_elerhetosege,
            Tura_dija: tura.Tura_dija,
            Elmarad_a_tura: tura.Elmarad_a_tura,
            Leiras: tura.Leiras,
            Jelentkezok: tura.Jelentkezok,
            Felhasznalonev: tura["LetrehozoNeve.Felhasznalonev"],
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
        const felhasznalo = await Felhasznalo.findByPk(Letrehozo);

        if (felhasznalo.Szuletesi_ido === null) {
            res.status(400).json({
                error: true,
                type: "nincsSzulEv",
                status: 400,
                message: "Nem lett életkor megadva! Túrára csak olyan jelentkezhet, aki betöltötte a 18. életévét!"
            });
            return;
        }

        const tizennyolcE = ((new Date())-(new Date(felhasznalo.Szuletesi_ido)))/1000/60/60/24/365.25

        if (tizennyolcE < 18) {
            res.status(403).json({
                error: true,
                status: 403,
                message: "Legalább 18 évesnek kell lenni, hogy túrára tudjon jelentkezni!"
            })
            return;
        }
            osszekapcsolas = await TuraraJelentkezesTabla.build({
                TurakTuraId: turaId,
                FelhasznalokUserId: felhasznaloId
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

        var Letrehozo = req.user.userId;
    
        const felhasznalo = await Felhasznalo.findByPk(Letrehozo);

        if (felhasznalo.Szuletesi_ido === null) {
            res.status(400).json({
                error: true,
                type: "nincsSzulEv",
                status: 400,
                message: "Nem lett életkor megadva! Túrát csak olyan hozhat létre, aki betöltötte a 18. életévét!"
            });
            return;
        }

        const tizennyolcE = ((new Date())-(new Date(felhasznalo.Szuletesi_ido)))/1000/60/60/24/365.25

        if (tizennyolcE < 18) {
            res.status(403).json({
                error: true,
                status: 403,
                message: "Legalább 18 évesnek kell lenni, hogy túrát hozhass létre!"
            })
            return;
        }

        if (Tura_neve === "") {
            res.status(400).json({
                error:true,
                status: 400,
                type: "Nincsnev",
                message: "Hiányzó adat: Túra neve"
            })
            return;
        }
    
        if (Indulas_ido === "") {
            res.status(400).json({
                error:true,
                status: 400,
                type: "NincsIndIdo",
                message: "Hiányzó adat: Indulás ideje"
            })
            return;
        }
    
        if (new Date(Indulas_ido) <= Date.now()) {
            res.status(400).json({
                error: true,
                status: 400,
                type: "RosszIndIdo",
                message: "Az indulási idő nem lehet kisebb vagy egyenlő a jelenlegi idővel!"
            })
            return;
        }

        if (Indulas_hely === "") {
            res.status(400).json({
                error:true,
                status: 400,
                type: "NincsIndHely",
                message: "Hiányzó adat: Indulás helye"
            })
            return;
        }
    
        if (Erkezesi_ido === "") {
            res.status(400).json({
                error:true,
                status: 400,
                type: "NincsErkIdo",
                message: "Hiányzó adat: Várható érkezési idő"
            })
            return;
        }

        if (Erkezesi_ido <= Indulas_ido) {
            res.status(400).json({
                error: true,
                status: 400,
                type: "RosszErkIdo",
                message: "Az érkezési idő nem lehet kisebb vagy egyenlő az indulási idővel!"
            })
            return;
        }
    
        if (Erkezesi_hely === "") {
            res.status(400).json({
                error:true,
                status: 400,
                type: "NincsErkHely",
                message: "Hiányzó adat: érkezés helye"
            })
            return;
        }
    
        if (Utvonal_nehezsege === "") {
            res.status(400).json({
                error:true,
                status: 400,
                type: "NincsNehezseg",
                message: "Hiányzó adat: útvonal nehézsége"
            })
            return;
        }
    
        if (Leiras === "") {
            res.status(400).json({
                error:true,
                status: 400,
                type: "Nincsleiras",
                message: "Hiányzó adat: leírás"
            })
            return;
        }

        if (Szervezo_elerhetosege === "" ||Szervezo_elerhetosege ===  undefined) {
            Szervezo_elerhetosege = req.user.email;
        }
        else{
            Szervezo_elerhetosege = req.body.ujTura.Szervezo_elerhetosege;
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
            success: true,
            message: "A túra sikeresen létre lett hozva!",
        });
    
    }   
    catch (error) {
        console.log(error);
        res.status(500).json({
            error: true,
            status: 500,
            type: 'Szerver',
            message: "Szerver hiba"
        })
    }
}

async function turakPATCHController(req, res) {
    
    var Tura_id = req.headers.turaid;

    const letaroltTura = await Turak.findByPk(Tura_id);

    if (req.body.ujTura.Tura_neve === "") {
        req.body.ujTura.Tura_neve = letaroltTura.Tura_neve;
    }

    if (req.body.ujTura.Indulas_ido === "") {
        req.body.ujTura.Indulas_ido = letaroltTura.Indulas_ido;
    }

    if (req.body.ujTura.Indulas_hely === "") {
        req.body.ujTura.Indulas_hely = letaroltTura.Indulas_hely;
    }

    if (req.body.ujTura.Tura_neve === "") {
        req.body.ujTura.Tura_neve = letaroltTura.Tura_neve;
    }

    if (req.body.ujTura.Tura_neve === "") {
        req.body.ujTura.Tura_neve = letaroltTura.Tura_neve;
    }

    if (req.body.ujTura.Erkezesi_ido === "") {
        req.body.ujTura.Erkezesi_ido = letaroltTura.Varhato_erkezesi_ido;
    }

    if (req.body.ujTura.Erkezesi_hely === "") {
        req.body.ujTura.Erkezesi_hely = letaroltTura.Erkezesi_hely;
    }

    if (req.body.ujTura.Utvonal_nehezsege === "") {
        req.body.ujTura.Utvonal_nehezsege = letaroltTura.Utvonal_nehezsege;
    }

    if (req.body.ujTura.Szervezo_elerhetosege === "") {
        req.body.ujTura.Szervezo_elerhetosege = letaroltTura.Szervezo_elerhetosege;
    }

    if (req.body.ujTura.Tura_dija === "") {
        req.body.ujTura.Tura_dija = letaroltTura.Tura_dija;
    }

    if (req.body.ujTura.Elmarad_a_tura === "") {
        req.body.ujTura.Elmarad_a_tura = letaroltTura.Elmarad_a_tura;
    }

    if (req.body.ujTura.Leiras === "") {
        req.body.ujTura.Leiras = letaroltTura.Leiras;
    }

    if (new Date(req.body.ujTura.Indulas_ido) <= Date.now()) {
        res.status(400).json({
            error: true,
            status: 400,
            type: "RosszIndIdo",
            message: "Az indulási idő nem lehet kisebb vagy egyenlő a jelenlegi idővel!"
        })
        return;
    }

    if (req.body.ujTura.Erkezesi_ido <= req.body.ujTura.Indulas_ido) {
        res.status(400).json({
            error: true,
            status: 400,
            type: "RosszErkIdo",
            message: "Az érkezési idő nem lehet kisebb vagy egyenlő az indulási idővel!"
        })
        return;
    }

    Turak.update(req.body.ujTura, { where: { Tura_id }, individualHooks: true })
    .then((rowsAffected) => {
      //Nem található túra ilyen id-val
      if (Object.entries(rowsAffected[1]).length === 0) {
        res.status(404).send({
          success: false,
          status: 404,
          message: `Túra ${Tura_id} id-val nem található. Túra frissítése sikertelen.`,
        });

        return;
      }

      //if rowsAffected[0] === 1 Van változás
      if (rowsAffected[0] === 1) {
        res.status(200).send({
          success: true,
          status: 200,
          message: `Túra frissítve.`,
          id: Tura_id,
          payload: req.body,
        });
      } else {
        // if rowsAffected[0] !== 1 Nincs változás az elküldött adatok és a túrának a letárolt adatai között.
        res.status(200).send({
          success: false,
          status: 200, //Not Modified
          message: `Nincs változás az elküldött adatok és a túrának a letárolt adatai között.`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        success: false,
        status: 500,
        message:"Szerver hiba"
      });
    });
}

async function jelentkezesDELETEController(req, res) {
    try{
        const userId = req.user.userId;

        const turaId = req.body.Tura_id;
        
        if (userId === undefined || turaId === undefined) {
            res.status(400).json({
                error: true,
                status:400,
            message: "Hiányzik valamelyik adat!"
        })
        return;
        }

        const vanEJelentkezes = await TuraraJelentkezesTabla.findAll({
            where: {
                TurakTuraId: turaId,
                FelhasznalokUserId: userId
            }
        })

        if (!vanEJelentkezes[0]) {
            res.status(404).json({
                error: true,
                status: 404,
                message: "Ilyen felhasználóiazonosítóval nincs jelentkezés erre a túrára!"
            })
            return;
        }
        await TuraraJelentkezesTabla.destroy({
            where: {
                TurakTuraId: turaId,
                FelhasznalokUserId: userId
            }
        })

        res.status(200).json({
            success: true,
            message: "A jelentkezés visszavonása sikeres!"
        })
}
catch(error){
    console.log(error);
    res.status(500).json({
        error: true,
        status: 500,
        message: "Szerver hiba"
    })
}
}


module.exports = {
    osszesTurakGETController ,turakGETController, turakPOSTController ,turakPUTController, turakPATCHController, jelentkezesDELETEController, turakJelentkezettGETController
}