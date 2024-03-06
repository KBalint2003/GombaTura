const {Sequelize, DataTypes}=require("sequelize");
const sequelize=require('../adatbazisKapcsolat');
const Tura=sequelize.define("Turak",{

    Tura_id:{
        type:DataTypes.STRING,
        allowNull: false,
        primaryKey:true,
    },

    Tura_neve: {
        type: DataTypes.STRING,
        allowNull: false
    },

    Letrehozo:{
        type:DataTypes.STRING,
        allowNull: true,
    },

    Indulas_ido:{
        type:DataTypes.DATE,
        allowNull: false,
    },

    Indulas_hely:{
        type:DataTypes.STRING,
        allowNull: false,
    },

    Varhato_erkezesi_ido:{
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
        allowNull: true,
    },
    Tura_dija:{
        type:DataTypes.INTEGER,
        allowNull: true,
        defaultValue: 0
    },
    Elmarad_a_tura:{
        type:DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue: false
    },
    Leiras:{
        type: DataTypes.TEXT,
        allowNull: true
    }

},{
    tableName:"Turak"

});

//

module.exports=Tura;