import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {BehaviorSubject, Observable, Subscription} from "rxjs";
import {CookieService} from "ngx-cookie-service";
import { loginObj } from "./felhasznaloAdatObj";
import { signupObj } from "./felhasznaloAdatObj";
import {Router} from "@angular/router";

@Injectable({
  providedIn: 'root'
})

export class AutService{

  constructor(private http: HttpClient, private cookie: CookieService, private router: Router) { }

  private regisztracioRoute = "http://localhost:3000/regisztracio";
  private bejelentkezesRoute = "http://localhost:3000/login";
  private kijelentkezesRoute = "http://localhost:3000/logout"

  bejelentkezve: boolean = false
  tokenID: string = ''

  ujFelhasznalo(felhasznalo : signupObj) : Observable<signupObj> {
    return this.http.put<signupObj>(this.regisztracioRoute, felhasznalo, )
  }

  bejelentkezes(felhasznalo: loginObj): Subscription {
    return this.http.post<loginObj>(this.bejelentkezesRoute, felhasznalo).subscribe((valasz: any) => {
     this.tokenID = valasz.data.token
      if (valasz.success) {
        this.bejelentkezve = true
        this.router.navigate(['/'])
          .then(() => {
            console.log("Sikeres navigálás")
            console.log(this.tokenID)
          })
          .catch(() => {
            console.log("Sikertelen navigálás")
          })
      }
    })
  }

  kijelentkezes() {
    return this.http.delete(this.kijelentkezesRoute)
  }

}
