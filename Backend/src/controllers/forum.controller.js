const { v4: uuidv4 } = require('uuid');
const Poszt = require("../models/Poszt.model");
const Felhasznalo = require('../models/felhasznalo.model');
const KommentModel = require('../models/komment.model');

async function posztokGETController(req, res) {
   
    try{
        const posztok = await Poszt.findAll({
            include: [
                {
                    model: Felhasznalo,
                    as: "PosztoloNeve",
                    attributes: ["Felhasznalonev"]
                }
            ],
            group: 'Poszt_id',
            raw: true
        });

        if (!posztok.length) {
            res.status(400).json({
                error: true,
                status: 400,
                message:"Nincsenek posztok"
            })
            return;
        }

        const formazottPosztok = posztok.map(poszt =>({
            Poszt_id: poszt.Poszt_id,
            Cim: poszt.Cim,
            Szoveg: poszt.Szoveg,
            PosztoloNeve: poszt["PosztoloNeve.Felhasznalonev"],

        }));

        res.status(200).json({
            success: true,
            posztok: formazottPosztok
        })
    }
    catch{
        res.status(500).send({
            success: false,
            status: 500,
            message:"Szerver hiba"
          });
    }
}

async function posztKommentekkelGETController(req, res) {
    try{


        const posztId = req.headers.posztid;

        const kommentek = await KommentModel.findAll({
            where: {Poszt: posztId},

            include: [
                {
                    model: Felhasznalo,
                    as: "KommenteloNeve",
                    attributes: ["Felhasznalonev"]
                }
            ],
            raw: true
        })

        const formazottKommentek =kommentek.map(komment =>({
            Komment_id: komment.Komment_id,
            Kommentelo: komment["KommenteloNeve.Felhasznalonev"],
            Komment: komment.Komment,
        }));

        const poszt = await Poszt.findAll({
            include: [
                {
                    model: Felhasznalo,
                    as: "PosztoloNeve",
                    attributes: ["Felhasznalonev"]
                }
            ],
            group: 'Poszt_id',
            raw: true,
            where: {Poszt_id: posztId}
        });

        if (!poszt.length) {
            res.status(400).json({
                error: true,
                status: 400,
                message:"Nincsenek posztok"
            })
            return;
        }

        const formazottPosztok =poszt.map(poszt =>({
            Poszt_id: poszt.Poszt_id,
            Cim: poszt.Cim,
            Szoveg: poszt.Szoveg,
            PosztoloNeve: poszt["PosztoloNeve.Felhasznalonev"],

        }));

        res.status(200).json({
            success: true,
            poszt: formazottPosztok,
            kommentek: formazottKommentek
        })
    }
    catch{
        res.status(500).send({
            success: false,
            status: 500,
            message:"Szerver hiba"
          });
    }
}

async function posztPUTController(req, res) {

    console.log(req.body.Poszt)
    const {Cim, Szoveg} = req.body.ujPoszt
    const Posztolo = req.user.userId

    if (Cim === "" || Cim ===  undefined) {
        res.status(400).json({
            error:true,
            status: 400,
            type: "NincsCim",
            message: "Hiányzó adat: A poszt címe"
        })
        return;
    }

    if (Szoveg === "" || Szoveg ===  undefined) {
        res.status(400).json({
            error:true,
            status: 400,
            type: "NincsSzoveg",
            message: "Hiányzó adat: A poszt tartalma"
        })
        return;
    }

    poszt = await Poszt.build({
        Poszt_id: uuidv4(),
        Posztolo: Posztolo,
        Cim: Cim,
        Szoveg: Szoveg
    })

    await poszt.save();
    res.status(201).json({
        success: true,
        message: "A poszt sikeresen létre lett hozva!",
    });

}

function posztPATCHController(req, res) {
    const posztId = req.headers.posztId;

    Poszt.update(req.body.poszt, { where: { posztId }, individualHooks: true })
    .then((rowsAffected) => {
      //Nem található poszt ilyen id-val
      if (Object.entries(rowsAffected[1]).length === 0) {
        res.status(404).send({
          success: false,
          status: 404,
          message: `Poszt ${posztId} id-val nem található. A poszt frissítése sikertelen.`,
        });

        return;
      }

      //if rowsAffected[0] === 1 Van változás
      if (rowsAffected[0] === 1) {
        res.status(200).send({
          success: true,
          status: 200,
          message: `Poszt frissítve.`,

        });
      } else {
        // if rowsAffected[0] !== 1 Nincs változás az elküldött adatok és a túrának a letárolt adatai között.
        res.status(200).send({
          success: false,
          status: 200,
          message: `Nincs változás az elküldött adatok és a posztnak a letárolt adatai között.`,
        });
      }
    })
    .catch((error) => {
        console.log(error);
      res.status(500).send({
        success: false,
        status: 500,
        message:"Szerver hiba"
      });
    });
};

async function posztDELETEController(params) {
    try {
        
     
    const posztId = req.headers.posztId;

    if (posztId === undefined) {
        res.status(400).json({
            error: true,
            status: 400,
            message: "Hiányzó adat!"
        })
        return;
    }
    const vanEPoszt = await Poszt.findAll({
        where: {
            Poszt_id: posztId
        }
    })

    if (!vanEPoszt.length) {
        res.status(404).json({
            error: true,
            status: 404,
            message: "Nem található poszt ilyen azonosítóval!"
        })
        return;
    }

    await Poszt.destroy({
        where: {
            Poszt_id: posztId
        }
    })
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

async function kommentPUTController(req, res) {
try {

    const Kommentelo = req.user.userId;
    const Poszt = req.body.Poszt;
    const {Komment} = req.body.ujKomment;

    if (Komment === "") {
        res.status(400).json({
            error:true,
            status: 400,
            type: "NincsKomment",
            message: "Hiányzó adat: A Komment tartalma"
        })
        return;
    }
    
    komment = await KommentModel.build({
        Komment_id: uuidv4(),
        Kommentelo: Kommentelo,
        Komment: Komment,
        Poszt: Poszt
    })

    await komment.save();
    res.status(201).json({
        success: true,
        message: "A komment sikeresen létre lett hozva!",
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

function kommentPATCHController(req, res) {
    const kommentId = req.headers.kommentId;

    KommentModel.update(req.body.poszt, { where: { posztId }, individualHooks: true })
    .then((rowsAffected) => {
      //Nem található poszt ilyen id-val
      if (Object.entries(rowsAffected[1]).length === 0) {
        res.status(404).send({
          success: false,
          status: 404,
          message: `Komment ${posztId} id-val nem található. A Komment frissítése sikertelen.`,
        });

        return;
      }

      //if rowsAffected[0] === 1 Van változás
      if (rowsAffected[0] === 1) {
        res.status(200).send({
          success: true,
          status: 200,
          message: `Poszt frissítve.`,

        });
      } else {
        // if rowsAffected[0] !== 1 Nincs változás az elküldött adatok és a túrának a letárolt adatai között.
        res.status(200).send({
          success: false,
          status: 200,
          message: `Nincs változás az elküldött adatok és a posztnak a letárolt adatai között.`,
        });
      }
    })
    .catch((error) => {
        console.log(error);
      res.status(500).send({
        success: false,
        status: 500,
        message:"Szerver hiba"
      });
    });
};

async function kommentDELETEController(params) {
    try {
        
     
    const kommentId = req.headers.kommentId;

    if (kommentId === undefined) {
        res.status(400).json({
            error: true,
            status: 400,
            message: "Hiányzó adat!"
        })
        return;
    }
    const vanEKomment = await Poszt.findAll({
        where: {
            Komment_id: kommentId
        }
    })

    if (!vanEKomment.length) {
        res.status(404).json({
            error: true,
            status: 404,
            message: "Nem található komment ilyen azonosítóval!"
        })
        return;
    }

    await KommentModel.destroy({
        where: {
            Komment_id: kommentId
        }
    })
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

module.exports = {posztokGETController,posztKommentekkelGETController, posztPUTController,posztPATCHController, posztDELETEController,kommentPUTController, kommentPATCHController, kommentDELETEController}