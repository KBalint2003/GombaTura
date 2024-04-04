export interface Gomba {
  Gomba_Id : number,
  Latin_nev : string,
  Magyar_nev : string,
  Nemzetseg: string,
  Etkezes_ertek: number,
  Feltetel: string,
  Leiras: string,
  Bocskora: number,
  Galler: number,
  Szezon_eleje: number,
  Szezon_vege: number,
  Novenyzet: string,
  Termotest_tipus: string,
  Termoretegtarto_tipusok: string,
  Kalap_forma: string,
  Kalap_felszin: string,
  Kalap_perem: string,
  Lemezallas: string,
  Lemez_el: string,
  Burok_maradvany: string,
  Tonk_alak: string,
  Tonk_felulet: string,
  Hus: string,
  Hus_elszinezodes: string,
  Ize: string,
  Illata: string,
  Ara_HUF: number,
  Kep_keszito_neve: string,
  Kep_neve: string
}

export interface Gombak {
  gombak: Gomba[]
}