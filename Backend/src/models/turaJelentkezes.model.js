const {DataTypes}=require("sequelize");

const sequelize=require("../adatbazisKapcsolat");

const TuraraJelentkezes=sequelize.define("TuraraJelentkezesTabla",{
    
    Felhasznalo_Id: {
        type: DataTypes.STRING,
        references: {
            model: Felhasznalo,
            key: 'User_id'
        }
    },

    Tura_Id: {
        type: DataTypes.STRING,
        references: {
            model: Tura,
            key: 'Tura_id'
        }
    }

},

{
    tableName:"TuraraJelentkezesTabla",
    timestamps: false,
});
TuraraJelentkezes.removeAttribute('id');


//module.exports=TuraraJelentkezes;  