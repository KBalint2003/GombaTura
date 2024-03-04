import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable, Subscription} from "rxjs";
import {CookieService} from "ngx-cookie-service";
import { loginObj, signupObj, token } from "./felhasznaloAdatObj";
import {Router} from "@angular/router";

@Injectable({
  providedIn: 'root'
})

export class AutService{

  constructor(private http: HttpClient, private cookie: CookieService, private router: Router) { }

  private regisztracioRoute = "http://localhost:3000/regisztracio";
  private bejelentkezesRoute = "http://localhost:3000/login";
  private kijelentkezesRoute = "http://localhost:3000/logout"

  bejelentkezve: any
  tokenIDjson: any

  ujFelhasznalo(felhasznalo : signupObj) : Observable<signupObj> {
    return this.http.put<signupObj>(this.regisztracioRoute, felhasznalo, )
  }

  bejelentkezes(felhasznalo: loginObj): Subscription {
    return this.http.post<loginObj>(this.bejelentkezesRoute, felhasznalo).subscribe((valasz: any) => {
      this.tokenIDjson = {"token": valasz.data.token}
      console.log(this.tokenIDjson)
      if (valasz.success) {
        this.bejelentkezve = true
        localStorage.setItem("access", valasz.data.token)
        this.router.navigate(['/'])
          .then(() => {
            console.log("Sikeres navigálás")
          })
          .catch(() => {
            console.log("Sikertelen navigálás")
          })
      }
    })
  }

  kijelentkezes() {
    return this.http.post(this.kijelentkezesRoute, this.tokenIDjson).subscribe((valasz: any) => {
      console.log("Sikeres küldés!")
      if(valasz.success) {
        this.bejelentkezve = false;
        localStorage.removeItem("access",)
        this.router.navigate(['/'])
          .then(() => {
            console.log("Sikeres navigálás")
          })
          .catch(() => {
            console.log("Sikertelen navigálás")
          })

      }
    })
  }

}
