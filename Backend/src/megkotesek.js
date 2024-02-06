let megkotesek = {};

const regex = "[\-\'A-Za-z0-9áéíóöőúüűÁÉÍÓÖŐÚÜŰ]+";

megkotesek.felhasznalonev = () => {
    
    const megkotes = {
        'presence': {
            allowEmpty: false
        },
        'type': 'string',
        'length':{
            'minimum': 5,
            'maximum':32
        },
        'format': {
            'pattern' : regex,
            'flags' : 'i',
            'message':'A felhasználónévnek a következő sémát kell követnie: '+ regex
        }
    }

    return megkotes;
}

megkotesek.email = () => {

    const megkotes = {
        'presence': {
            allowEmpty: false
        },
        'type': 'string',
        'email':true
    }

    return megkotes;

}

megkotesek.jelszo = () => {
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

module.exports = megkotesek;