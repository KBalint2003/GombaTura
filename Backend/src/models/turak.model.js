const {Sequelize, DataTypes}=require("sequelize");
const sequelize=require('../adatbazisKapcsolat');
const Tura=sequelize.define("Turak",{
    
    Tura_id:{
        type:DataTypes.STRING,
        allowNull: false,
        primaryKey:true,
    },

    Letrehozo:{
        type:DataTypes.STRING,
        allowNull: false,
    },  

    Indulas_ido:{
        type:DataTypes.DATE,
        allowNull: false,
    },  
    
    Indulas_hely:{
        type:DataTypes.STRING,
        allowNull: false,
    }, 
    
    Varhato_erkezési_ido:{
        type:DataTypes.DATE,
        allowNull: false,
    }, 
    Erkezesi_hely:{
        type:DataTypes.STRING,
        allowNull: false,
    }, 
    Utvonal_nehezsege:{
        type:DataTypes.STRING,
        allowNull: false,
    },  
    Szervezo_elerhetosege:{
        type:DataTypes.STRING,
        allowNull: false,
    },  
    Tura_dija:{
        type:DataTypes.STRING,
        allowNull: true,
    }, 
    Elmarad_a_tura:{
        type:DataTypes.TINYINT,
        allowNull: true,
    },  
    
},{
    tableName:"Turak"

});

//Tura.belongsToMany(Felhasznalo, { through: TuraraJelentkezes });

module.exports=Tura;