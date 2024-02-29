import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {BehaviorSubject, Observable, Subscription} from "rxjs";
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

  bejelentkezve  = new BehaviorSubject(false)

  ujFelhasznalo(felhasznalo : signupObj) : Observable<signupObj> {
    return this.http.put<signupObj>(this.regisztracioRoute, felhasznalo)
  }

  bejelentkezes(felhasznalo: loginObj): Subscription {
    return this.http.post<loginObj>(this.bejelentkezesRoute, felhasznalo).subscribe((valasz: any) => {
      if (valasz.success) {
        this.bejelentkezve.next(false)
        console.log(this.bejelentkezve.value)
      }
    })
  }

  kijelentkezes() {
    return this.http.delete(this.kijelentkezesRoute)
  }

}
