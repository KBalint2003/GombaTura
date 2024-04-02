const {DataTypes}=require("sequelize");
const sequelize=require('../adatbazisKapcsolat');

const Poszt=sequelize.define("PostTabla",{
    Poszt_id:{
        type:DataTypes.STRING,
        allowNull: false,
        primaryKey:true,
    },

    Posztolo:{
        type:DataTypes.STRING,
        allowNull: false,
    },  
    
    Cim: {
        type: DataTypes.STRING,
        allowNull: false
    },

    Szoveg: {
        type: DataTypes.TEXT,
        allowNull: false
    }
    
},{
    tableName:"Posztok"

}
)
module.exports=Poszt;