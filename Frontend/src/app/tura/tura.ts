export interface Tura {
  TuraID: string;
  TuraNeve: string;
  IndulasIdo: string;
  IndulasHely: string;
  ErkezesiIdo: string;
  ErkezesiHely: string;
  UtvonalNehezsege: string;
  SzervezoElerhetosege: string;
  TuraDija: number;
  ElmaradE: boolean;
  Leiras: string;
  LetrehozoNeve: {
    Felhasznalonev: string;
  };
}

export interface Turak {
  turak: Tura[];
}
