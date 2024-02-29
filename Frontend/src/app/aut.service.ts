import { Injectable, OnInit } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {CookieService} from "ngx-cookie-service";
import { loginObj } from "./felhasznaloAdatObj";
import { signupObj } from "./felhasznaloAdatObj";

@Injectable({
  providedIn: 'root'
})

export class AutService{

  constructor(private http: HttpClient, private cookie: CookieService) { }

  private regisztracioRoute = "http://localhost:3000/regisztracio";
  private bejelentkezesRoute = "http://localhost:3000/login";
  private kijelentkezesRoute = "http://localhost:3000/logout"


  ujFelhasznalo(felhasznalo : signupObj) : Observable<signupObj> {
    return this.http.put<signupObj>(this.regisztracioRoute, felhasznalo)

  }

  bejelentkezes(felhasznalo: loginObj): Observable<loginObj> {
    return this.http.post<loginObj>(this.bejelentkezesRoute, felhasznalo)
  }

  kijelentkezes(felhasznalo: loginObj): Observable<loginObj> {

    return this.http.delete<loginObj>(this.kijelentkezesRoute)
  }

}
