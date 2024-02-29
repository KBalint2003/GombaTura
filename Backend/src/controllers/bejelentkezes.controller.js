const passport = require("passport");

function bejelentkezesGETController(req, res) {
    res.status(200).send("Login Page");
}

function bejelentkezesPOSTController(req, res, next) {
    // Ellenőrizze, hogy a felhasználó be van-e jelentkezve
    if (req.isAuthenticated()) {
        return res.redirect('/'); // Átirányítás, ha már be van jelentkezve
    }

    passport.authenticate('local', (err, felhasznalo, info) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Szerver hiba 1' });
        }
        if (!felhasznalo) {
            return res.status(401).json({ message: 'Érvénytelen felhasználónév vagy jelszó.' });
        }

        req.logIn(felhasznalo, (err) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: "Szerver hiba 2" });
            }

            req.session.user = felhasznalo;

            // Válasz JSON küldése
            return res.json({ message: 'Sikeres bejelentkezés ', felhasznalo: felhasznalo.User_id, success:true });
        });
    })(req, res, (err) => {
        // Passport által kezelt hibakezelés
        if (err) {
            return next(err);
        }

        // Átirányítás csak sikeres bejelentkezés esetén
        res.redirect('/');
    });
}


function kijelentkezesDELETEController(req, res) {
    if (!req.isAuthenticated()) {
        req.logout((err) => {
            if (err) {
                console.error(err);
                return next(err);
            }


            console.log(req.body);
            res.status(200)
            res.redirect('/');
        });
    }
    else{
        res.status(401).json({
            error: true,
            code: 401,
            message: "Nincs felhasználó, aki ki tudna jelentkezni!"
        })
    }

}

module.exports = {
    bejelentkezesGETController,bejelentkezesPOSTController, kijelentkezesDELETEController
}