const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');

const  FelhasznaloModell  = require('./models/felhasznalo.model');

function setupPassport(passport) {
  passport.use(new LocalStrategy(
      {
        usernameField: 'email',
        passwordField: 'jelszo'
      },
      async (email, password, done) => {
        try {

          const felhasznalo = await FelhasznaloModell.findOne({ where: { Email: email } });

          const isMatching = await bcrypt.compare(password, felhasznalo.Jelszo)

          if (!felhasznalo || isMatching === false) {
            return done(null, false, { message: 'Érvénytelen email cím vagy jelszó.' });
          }


          return done(null, felhasznalo);

        } catch (error) {
          return done(error);
        }
      }
  ));

  passport.serializeUser((felhasznalo, done) => {
    done(null, felhasznalo);
  });

  passport.deserializeUser((felhasznalo, done) => {
    done (null, felhasznalo )
  })

  checkAuthenticated = (req, res, next) => {
    if (req.isAuthenticated()) { return next() }
    res.redirect("/")
  }

}



//module.exports = setupPassport;

