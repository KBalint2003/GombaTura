let regisztracioMegkotesek = {};

const regexFelhasznalo = "[\-\'A-Za-z0-9áéíóöőúüűÁÉÍÓÖŐÚÜŰ]+";
const regexJelszo = /^(?=.*[a-z+áéíóöőúüű])(?=.*[A-Z+ÁÉÍÓÖŐÚÜŰ])(?=.*\d).+$/;

regisztracioMegkotesek.felhasznalonev = () => {

    const megkotes = {
        'presence': {
            allowEmpty: false,
            message: "Kötelező megadni felhasználónevet!"
        },
        'type': 'string',
        'length':{
            'minimum': 10,
            'maximum':32,
            'message': 'A felhasználónév túl rövid vagy túl hosszú! A felhasználónévnek 10 és 32 karakterhossz közöttinek kell lennie!'
        },
        'format': {
            'pattern' : regexFelhasznalo,
            'flags' : 'i',
            'message':'A felhasználónévnek a következő sémát kell követnie: Nagybetű A-Z, kisbetű a-z, számok 0-9'
        }
    }

    return megkotes;
}

regisztracioMegkotesek.email = () => {

    const megkotes = {
        'presence': {
            allowEmpty: false,
            message: "Kötelező megadni jelszót!"
        },
        'type': 'string',
        'email':true
    }

    return megkotes;

}

regisztracioMegkotesek.jelszo = () => {
    const megkotes = {
        'presence': {
            allowEmpty: false,
            message: "Kötelező megadni jelszót!"
        },
        'type': 'string',
        'length':{
            'minimum': 10,
            message: "A jelszónak legalább 10 karakter hosszúnak kell lennie!"
        },
        'format': {
            'pattern' : regexJelszo,
            'flags' : 'i',
            'message': "A jelszónak a következő karaktereket kell tartalmaznia: Kisbetű, nagybetű, szám."
        }
    }

    return megkotes;
}

module.exports = regisztracioMegkotesek;