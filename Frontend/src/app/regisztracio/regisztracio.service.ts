import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { signupObj } from "../signupObj";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class regisztracioService {

  constructor(private http: HttpClient) { }

  // Backend szerver végpontja, ami a regisztrációs adatokat fogadja.

  private eleresiUt = "http://localhost:3000/regisztracio";

  // Ez a metódus a regisztráció során megadott adatokat HTTP PUT metódussal, a backend szervernek küldi.

  ujFelhasznalo(felhasznalo : signupObj) : Observable<signupObj> {
    return this.http.put<signupObj>(this.eleresiUt, felhasznalo)

  }

}

