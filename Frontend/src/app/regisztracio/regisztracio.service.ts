import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { User } from "../User";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class FelhasznaloService {
  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };
  constructor(private http: HttpClient) { }

  // Backend szerver végpontja, ami a regisztrációs adatokat fogadja.

  private eleresiUt = "http://localhost:3000/regisztracio";

  // Ez a metódus a regisztráció során megadott adatokat HTTP PUt metódussal, a backend szervernek küldi.

  ujFelhasznalo(felhasznalo : User) : Observable<User> {
    return this.http.put<User>(this.eleresiUt, felhasznalo, this.httpOptions)
  }

}

