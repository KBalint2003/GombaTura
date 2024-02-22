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
        console.log(password, felhasznalo.Jelszo)
        
        const isMatching = await bcrypt.compare(password, felhasznalo.Jelszo)

        console.log(isMatching);

        if (!felhasznalo || isMatching === false) {
          return done(null, false, { message: 'Érvénytelen felhasználónév vagy jelszó.' });
        }


        return done(null, felhasznalo);

      } catch (error) {
        return done(error);
      }
    }
  ));

  passport.serializeUser((felhasznalo, done) => {
    done(null, felhasznalo.User_id);
  });

  passport.deserializeUser(async (id, done) => {
    try {
      const felhasznalo = await FelhasznaloModell.findByPk(id);
      done(null, felhasznalo);
      console.log("deserializer "+felhasznalo);
    } catch (error) {
      console.error(error)
      done(error);
    }
  });
}

module.exports = setupPassport;

