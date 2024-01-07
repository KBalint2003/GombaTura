const Felhasznalo = require('../models/felhasznalo.model')


function regisztracioGETController(req, res){
    res.send("Működik")
}

async function regisztracioPOSTController (req, res){

    try{

        const { felhasznalonev, email, jelszo } = req.body;

        let felhasznalo = new Felhasznalo();

        let msg = false;

        msg = felhasznalo.setFelhasznalonev(felhasznalonev);
        if (msg) return res.status(400).json({
            error: {
                code:400,
                type: "Felhasználónév",
                message: msg
            }
        });

        msg = felhasznalo.setEmail(email);
        if (msg) return res.status(400).json({
            error: {
                code:400,
                type: "Email",
                message: msg
            }
        });

        msg = await felhasznalo.setJelszo(jelszo);
        if (msg) return res.status(400).json({
            error: {
                code:400,
                type: "Jelszó",
                message: msg
            }
        });

        console.log(felhasznalo);

        felhasznalo.mentes();

        res.status(200).json(felhasznalo);
    }

    catch(e){
        throw new Error(e);
    }
    

};

module.exports= {
    regisztracioGETController, regisztracioPOSTController
}