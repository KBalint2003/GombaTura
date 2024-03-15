const cron = require('node-cron');
const feketeLista = require('./models/feketeLista.model');
const jwt = require('jsonwebtoken');

var idozitettFLTorles= cron.schedule('0 * * * *', async() => {
    try {
        
        const osszesFeketeListasToken = await feketeLista.findAll();

        if (!osszesFeketeListasToken) {
            return;
        }

        for(egyDbListasToken of osszesFeketeListasToken) {

            const token = egyDbListasToken.token;

            try {
                
                const decodedToken = jwt.verify(token, 'titkositokulcs')

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



