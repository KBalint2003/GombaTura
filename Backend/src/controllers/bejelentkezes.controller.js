const passport = require("passport")

function bejelentkezesGETController(req, res) {
      res.send("Működik")
}

function bejelentkezesPOSTController(req, res, next) {
    
    passport.authenticate('local', (err, felhasznalo, info) => {
        if (err) {
          console.error(err)
          return res.status(500).json({ message: 'Szerver hiba 1' });
        }
        if (!felhasznalo) {
          return res.status(401).json({ message: 'Érvénytelen felhasználónév vagy jelszó.' });
        }
        req.logIn(felhasznalo, (err) => {
          if (err) {
            console.error(err)
            return res.status(500).json({ message: "Sezrver hiba 2"});
          }
          return res.json({ message: 'Sikeres bejelentkezés', felhasznalo: felhasznalo });
        });
      })(req, res, next);
    };


    function kijelentkezesDELETEController(req, res) {
      req.logOut((err) => {
        if (err) {
          console.error(err);
          return res.status(500).json({ message: 'Szerver hiba' });
        }
    
        console.log("Sikeres kijelentkezés!");
        res.redirect('/login');
      });
    }

module.exports = {
  bejelentkezesGETController,bejelentkezesPOSTController, kijelentkezesDELETEController
}