import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from "../User";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class FelhasznaloService {
  constructor(private http: HttpClient) { }

  private eleresiUt = "http://localhost:3000/regisztracio";

  ujFelhasznalo(felhasznalo : User) : Observable<User> {
    return this.http.put<User>(this.eleresiUt, felhasznalo)
  }

}

