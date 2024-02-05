const { Sequelize } = require("sequelize");
const sequelize = require("./adatbazisKapcsolat");

const Felhasznalo = sequelize.define('belepes', {
    
    User_id: {
        type: Sequelize.Datatypes.STRING,
        allowNull: false,
    },
    
    Felhasznalonev: {
        type: Sequelize.Datatypes.STRING,
        allowNull: false,
    },

    Jelszo: {
        type: Sequelize.Datatypes.STRING,
        allowNull: false,
    },

    Email: {
        type: Sequelize.Datatypes.STRING,
        allowNull: false,
    },

    Szuletesi_ido: {
        allowNull: false,
    },

    Telefon_szam: {
        allowNull: false,
    }

},

{
    freezeTableName: true,
    timestamps: false
});

module.exports = Felhasznalo;