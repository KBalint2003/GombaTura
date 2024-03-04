let regisztracioMegkotesek = {};

const regex = "[\-\'A-Za-z0-9áéíóöőúüűÁÉÍÓÖŐÚÜŰ]+";

regisztracioMegkotesek.felhasznalonev = () => {

    const megkotes = {
        'presence': {
            allowEmpty: false,
            message: "Kötelező megadni felhasználónevet!"
        },
        'type': 'string',
        'length':{
            'minimum': 8,
            'maximum':32,
            'message': 'A felhasználónév túl rövid vagy túl hosszú! A felhasználónévnek 10 és 32 karakterhossz közöttinek kell lennie!'
        },
        'format': {
            'pattern' : regex,
            'flags' : 'i',
            'message':'A felhasználónévnek a következő sémát kell követnie: Nagybetű A-Z, kisbetű a-z, számok 0-9'
        }
    }

    return megkotes;
}

regisztracioMegkotesek.email = () => {

    const megkotes = {
        'presence': {
            allowEmpty: false
        },
        'type': 'string',
        'email':true
    }

    return megkotes;

}

regisztracioMegkotesek.jelszo = () => {
    const megkotes = {
        'presence': {
            allowEmpty: false
        },
        'type': 'string',
        'length':{
            'minimum': 10
        },
        'format': {
            'pattern' : regex,
            'flags' : 'i',
            'message':'A jelszónak a következő sémát kell követnie: '+ regex
        }
    }

    return megkotes;
}

module.exports = regisztracioMegkotesek;