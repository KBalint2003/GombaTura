const LocalStrategy = require('passport-local').Strategy
const bcrypt = require('bcrypt')

function initialize(passport, getUserByEmail, getUserById) {

    const authenticateUser = async (email, passport, done) => {
        const user = getUserByEmail(email)
        if (user == null){
            return done(null, false, {message: 'Nincs felhasználó ezzel az email címmel!'})
        }

        try{
            if(await bcrypt.compare(passport, user.passport)) {
                return done(null,  user )
            }
            else{
                return done(null, false, { message: 'Helytelen jelszó'})
            }
        }

        catch (e){
            return done(e)
        }
        
}

    passport.use(new LocalStrategy({usernameField: 'email'}, authenticateUser))
    passport.serializeUser((user, done) => done(null, user.email))
    passport.deserializeUser((id, done) => { 
        return done(null, getUserById(id))
     })

}

module.exports = initialize