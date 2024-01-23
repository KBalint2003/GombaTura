const { Sequelize } = require("sequelize");
const sequelize = require("./adatbazisKapcsolat.model");
const { DataTypes } = Sequelize;

const Felhasznalo = sequelize.define('belepes', {
    
    User_id: {
        type: DataTypes.STRING(32),
        allowNull: false,
        primaryKey: true
    },
    
    Felhasznalonev: {
        type: DataTypes.STRING,
        allowNull: false,
    },

    Jelszo: {
        type: DataTypes.STRING,
        allowNull: false,

    },

    Email: {
        type: DataTypes.STRING,
        allowNull: false,
    },

    Szuletesi_ido: {
        type: DataTypes.DATEONLY,
        allowNull: false,
        
    },

    Telefon_szam: {
        allowNull: false,
    }

});

await Felhasznalo.sync({alter: true}).then(()=> {

}).catch(() => {
    
});