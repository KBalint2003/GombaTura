const { DataTypes }=require("sequelize");
const sequelize=require('../adatbazisKapcsolat');

const Komment = sequelize.define("Kommentek", {
    Komment_id: {
        type: DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },

    Kommentelo: {
        type: DataTypes.STRING,
        allowNull: false
    },
     Komment: {
        type: DataTypes.TEXT,
        allowNull: false
     },

     Poszt: {
        type: DataTypes.STRING,
        allowNull: false
     }
},
{
    timestamps: false
});

module.exports = Komment