const {DataTypes}=require("sequelize");
const sequelize = require("../adatbazisKapcsolat");

const Gombak=sequelize.define("Gombak",{

    Gomba_Id:{
        type:DataTypes.INTEGER,
        allowNull: false,
        primaryKey:true,
        comment:"Gomba ID",
    },

    Latin_nev:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba latin neve"
    },  

    Magyar_nev:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba magyar neve"
    },  
    
    Nemzetseg:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba nemzetsége"
    }, 
    
    Etkezes_ertek:{
        type:DataTypes.TINYINT,
        allowNull: false,
        comment:"Gomba étkezési értéke"
    }, 
    Feltetel:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba étkezésének feltétele"
    }, 
    Leiras:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba rövid leírása"
    }, 
    Bocskora:{
        type:DataTypes.TINYINT,
        allowNull: false,
        comment:"Gomba van e bocskora"
    }, 
    Galler:{
        type:DataTypes.TINYINT,
        allowNull: false,
        comment:"Gomba van e gallérja"
    }, 
    Szezon_eleje:{
        type:DataTypes.TINYINT,
        allowNull: false,
        comment:"Gomba hivatalos megtalálásának első honapja számként"
    }, 
    Szezon_vege:{
        type:DataTypes.TINYINT,
        allowNull: false,
        comment:"Gomba hivatalos megtalálásának utolso honapja számként"
    }, 
    Novenyzet:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba körül megtalálhato növényzet"
    }, 
    Termotest_tipus:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba termotestének típusa"
    }, 
    Termoretegtarto_tipusok:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba termőrétegtartő típusa"
    }, 
    Kalap_forma:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba kalapjának formája"
    }, 
    Kalap_felszin:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba kalapjának felszíne"
    }, 
    Kalap_perem:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba kalapjénak pereme"
    }, 
    Lemezallas:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba lemez állása"
    }, 
    Lemez_el:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba lemezéle"
    }, 
    Burok_maradvany:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba gallérjának felépitése"
    }, 
    Tonk_alak:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba tönkjének "
    }, 
    Tonk_felulet:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba tönkjének alakja"
    }, 
    Hus:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba húsának állaga"
    }, 
    Hus_elszinezodes:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba húsának elszineződése"
    }, 
    Ize:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba ize"
    }, 
    Illata:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba illata"
    }, 
    Ara_HUF:{
        type:DataTypes.INTEGER,
        allowNull: false,
        comment:"Gomba ára csak védett gombánál"
    }, 
    Kep_keszito_neve:{
        type:DataTypes.STRING(35),
        allowNull: false,
        comment:"Gomba kép készítöjének a neve"
    }, 
    Kep_neve:{
        type:DataTypes.STRING,
        allowNull: false,
        comment:"Gomba kép neve"
    }, 
},{
    tableName:"Gomba",
    timestamps: false
}
)
module.exports=Gombak;