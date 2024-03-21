const Felhasznalo = require("../models/felhasznalo.model");

async function felhasznaloGETController(req, res) {
  
    try{
    const userId = req.user.userId;

    const felhasznalo = await Felhasznalo.findByPk(userId);

    if (felhasznalo.Szuletesi_ido === null) {
      res.status(200).json({
        user: {
            Szuletesi_ido: felhasznalo.Szuletesi_ido,
            Telefonszam: felhasznalo.Telefon_szam
        }
    })
    }

    else{
      const formazottSzulIdo = new Date(felhasznalo.Szuletesi_ido).toLocaleString();
      res.status(200).json({
          user: {
              Szuletesi_ido: formazottSzulIdo,
              Telefonszam: felhasznalo.Telefon_szam
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
    
    const userId = req.user.userId;
    
    Turak.update(req.body, { where: { userId }, individualHooks: true })
    .then((rowsAffected) => {
      //Nem található felhasználó ilyen id-val
      if (Object.entries(rowsAffected[1]).length === 0) {
        res.status(404).send({
          success: false,
          status: 404,
          message: `Felhasználó ${userId} id-val nem található. Felhasználó frissítése sikertelen.`,
        });

        return;
      }

      //if rowsAffected[0] === 1 Van változás
      if (rowsAffected[0] === 1) {
        res.status(200).send({
          success: true,
          status: 200,
          message: `Felhasználó adatai frissítve.`,
          id: userId,
          payload: req.body,
        });
      } else {
        // if rowsAffected[0] !== 1 Nincs változás az elküldött adatok és a túrának a letárolt adatai között.
        res.status(200).send({
          success: false,
          status: 200, //Not Modified
          message: `Nincs változás az elküldött adatok és a Felhasználó letárolt adatai között.`,
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