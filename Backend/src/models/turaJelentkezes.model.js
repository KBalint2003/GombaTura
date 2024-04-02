//db importálása importálása
const sequelize=require("../adatbazisKapcsolat");

//Model (kapcsolótábla) definiálása
const TuraraJelentkezes=sequelize.define("TuraraJelentkezesTabla",
{
    
},

{
    timestamps: false,
});

    TuraraJelentkezes.removeAttribute('id');

module.exports=TuraraJelentkezes