const Gombak = require("../models/gomba.model")

async function osszesGombaGETController(req, res) {
    
    try {

        const gombak = await Gombak.findAll();

        res.status(200).json({
            success: true,
            status: 200,
            gombak: gombak
        })

    } catch (error) {
        console.log(error);
        res.status(500).json({
            error: true,
            status: 500,
            message: "Szerver hiba"
        })
    }

    
}

module.exports = { osszesGombaGETController }