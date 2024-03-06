// A felhasznalo.component.ts ezen  interface alapján határozza meg az objektum paramétereit.
export interface felhasznaloAdatObj {
  telSzam: string;
  szulDatum: string;
}
export interface loginObj {
  email: string;
  jelszo: string;
}

export interface signupObj {
  felhasznalonev: string;
  email: string;
  jelszo: string;
  jelszoUjra: string
}

export interface UserData {
  felhasznalonev: string,
  felhasznaloID: string,
  email: string,
  token: string
}
