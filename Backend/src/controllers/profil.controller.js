const Felhasznalo = require("../models/felhasznalo.model");
const TuraraJelentkezes = require("../models/turaJelentkezes.model");
const Tura = require("../models/turak.model");

async function felhasznaloGETController(req, res) {
  
    try{
    const userId = req.user.userId;
    const felhasznalo = await Felhasznalo.findByPk(userId);

        if (felhasznalo.Szuletesi_ido === null) {
          res.status(200).json({
            user: {
                Szuletesi_ido: felhasznalo.Szuletesi_ido,
                Telefon_szam: felhasznalo.Telefon_szam
            }
        })

        }
        else{
          const formazottSzulIdo = new Date(felhasznalo.Szuletesi_ido).toLocaleDateString();
          res.status(200).json({
              user: {
                  Szuletesi_ido: formazottSzulIdo,
                  Telefon_szam: felhasznalo.Telefon_szam
              }
          })

        }
        }
    catch(error){
        console.log(error);
        res.status(500).json({
            error: true,
            status: 500,
            message: "Szerver hiba"
        })
    }
};

async function felhasznaloPATCHController(req, res) {

    const User_id = req.user.userId;

    const felhasznalo = await Felhasznalo.findByPk(User_id);

    if (req.body.felhasznaloadatok.Szuletesi_ido === "") {
        req.body.felhasznaloadatok.Szuletesi_ido = felhasznalo.Szuletesi_ido
    }

    Felhasznalo.update(req.body.felhasznaloadatok, { where: { User_id }, individualHooks: true })
    .then((rowsAffected) => {
      //Nem található felhasználó ilyen id-val
      if (Object.entries(rowsAffected[1]).length === 0) {
          console.log(rowsAffected[0])
        res.status(404).send({
          success: false,
          status: 404,
          message: `Felhasználó ${User_id} id-val nem található. Felhasználó frissítése sikertelen.`,
        });

        return;
      }

      //if rowsAffected[0] === 1 Van változás
      if (rowsAffected[0] === 1) {

          res.status(200).json({
          success: true,
          status: 200,
          message: `Felhasználó adatai frissítve.`,
        });
      } else {
          // if rowsAffected[0] !== 1 Nincs változás az elküldött adatok és a túrának a letárolt adatai között.

        res.status(200).json({
          success: false,
          status: 200,
          message: `Nincs változás az elküldött adatok és a Felhasználó letárolt adatai között.`,
        });
      }
    })
    .catch((err) => {
        console.log(err);
        
        res.status(500).json({
        success: false,
        status: 500,
        message:"Szerver hiba"
      });
    });

};

async function felhasznaloDELETEController(req, res) {

    try{
        const userId = req.user.userId;
    
        if (userId === undefined) {
            res.status(400).json({
                error: true,
                status:400,
            message: "Hiányzik a felhasználó id-ja!"
        })
        return;
        }

        await Tura.update({Elmarad_a_tura: true}, {where: {Letrehozo: userId}});

        await TuraraJelentkezes.destroy({where: {FelhasznalokUserId: userId}})

        await Felhasznalo.destroy({
            where: {
                User_id: userId
            }
        })

        res.status(200).json({
            success: true,
            message: "Sikeres profil törlés"
        })
        
    }
    catch(error){
        console.log(error);
        res.status(500).json({
            error: true,
            status: (500),
            message: "Szerver hiba"
        })
    }
};

module.exports = {felhasznaloGETController, felhasznaloPATCHController, felhasznaloDELETEController}