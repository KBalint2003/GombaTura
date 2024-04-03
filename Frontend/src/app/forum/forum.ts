export interface Poszt {
  Poszt_id: string
  Cim: string
  Szoveg: string
  PosztoloNeve: string
}

export interface PosztKommenttel {
  Poszt_id: string
  Cim: string
  Szoveg: string
  PosztoloNeve: string
  Komment: string
  Kommentelo: string
}

export interface  Komment {
  Komment_id: string
  Komment: string
  Kommentelo: string
}
