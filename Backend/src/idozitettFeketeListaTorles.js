//Package-k importálása
const cron = require('node-cron');
const feketeLista = require('./models/feketeLista.model');
const jwt = require('jsonwebtoken');

//node-cron beállítása. Óránként ellenőrzi a feketelistát
var idozitettFLTorles= cron.schedule('0 * * * *', async() => {
    try {
        
        const osszesFeketeListasToken = await feketeLista.findAll();

        if (!osszesFeketeListasToken) {
            return;
        }

        //minden egyes letárolt token ellenőrzése. Ha a lejárati ideje kisebb, mint a jelenlegi dátum, vagyis a token lejárt így pedig használhatatlan, törli a táblából. 
        for(egyDbListasToken of osszesFeketeListasToken) {

            const token = egyDbListasToken.token;

            try {
                
                const decodedToken = jwt.decode(token)

                if(decodedToken.exp *1000 < Date.now()) {
                   await egyDbListasToken.destroy();

                   console.log("Lejárt JWT törölve a Feketelistából!");
                }
            } 
            catch (error) {
                console.log(error);
                console.log("Hiba a token dekódolásakor!");
            }

        }

    }
     catch (error) {
        console.log(error);
        console.log("Hiba történt a token törlése közben!");
    }

    console.log("Időzített törlés a backlistből beállítva!");
},
{
    scheduled: true,
    timezone: "Europe/Budapest"
}
);

module.exports = { idozitettFLTorles };



