export interface Tura {
  Tura_id: string;
  Tura_neve: string;
  Indulas_ido: string;
  Indulas_hely: string;
  Erkezesi_ido: string;
  Erkezesi_hely: string;
  Utvonal_nehezsege: string;
  Szervezo_elerhetosege: string;
  Tura_dija: number;
  Elmarad_a_tura: boolean;
  Leiras: string;
  Jelentkezok: number;
  Felhasznalonev: string
}

export interface FrissitettTura {
  Tura_neve: string;
  Indulas_ido: string;
  Indulas_hely: string;
  Erkezesi_ido: string;
  Erkezesi_hely: string;
  Utvonal_nehezsege: string;
  Szervezo_elerhetosege: string;
  Tura_dija: number;
  Elmarad_a_tura: boolean;
  Leiras: string;
  Jelentkezok: number;
  Felhasznalonev: string
}

export interface Turak {
  turak: Tura[];
}
