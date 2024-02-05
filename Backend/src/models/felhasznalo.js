const { v4: uuidv4 } = require('uuid');
const validate = require('validate.js'); 
const megkotesek = require('../megkotesek');
const bcrypt = require('bcrypt');

let felhasznaloModel = class Felhasznalo {
    
    constructor() {
        this.id = uuidv4();
        this.felhasznalonev = null;
        this.email = null;
        this.security = {
        jelszoHash: null
        };
    }

    //A felhasználó mentése az adatbázisba.
    mentes() {
        console.log(`Sikeresen mentve ${this.id} azonosítóval az adatbázisba.`);
    };

    //A megadott id-jú felhasználó megkeresése az adatbázisban.
    kereses(id) {
        return '';
    };

    setFelhasznalonev(felhasznalonev) {
        
        try{
            if (felhasznalonev) {
                felhasznalonev = felhasznalonev.trim().replace(/ +/g, ' ');
            }

            let msg = validate.single(felhasznalonev, megkotesek.felhasznalonev);

            if (msg) {
                return msg;
            }
            else{
                this.felhasznalonev = felhasznalonev;
                return;
            }

        }
        catch(e){
            throw new Error(e);
        }
    }

    setEmail(email) {

        try{
            let msg = validate.single(email, megkotesek.email);
        
            if (msg) {
                return msg;
            }
            else{
                this.email = email;
                return;
            }
        }

       

        catch(e){
            throw new Error(e);
        }

    }

    async setJelszo(jelszo){
        try{
            let msg = validate.single(jelszo, megkotesek.jelszo);
        
            if (msg) {
                return msg;
            }
            else{
               this.security.jelszoHash = await bcrypt.hash(jelszo, 10);
                return;
            }
        }

    
    catch(e){
        throw new Error(e);
    }
}
};



module.exports = felhasznaloModel;