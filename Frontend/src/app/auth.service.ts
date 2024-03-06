import {Injectable, OnInit} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import { Subscription} from "rxjs";
import {CookieService} from "ngx-cookie-service";
import { loginObj, signupObj} from "./felhasznaloAdatObj";
import {Router} from "@angular/router";

@Injectable({
  providedIn: 'root'
})

export class AuthService {

  constructor(private http: HttpClient, private cookie: CookieService, private router: Router) { }

  private regisztracioRoute = "http://localhost:3000/regisztracio";
  private bejelentkezesRoute = "http://localhost:3000/login";
  private kijelentkezesRoute = "http://localhost:3000/logout"

  bejelentkezve: any
  tokenIDjson: any
  regHiba: string = ''
  bejHiba: string = ''




  ujFelhasznalo(felhasznalo : signupObj) : Subscription {
    return this.http.put<signupObj>(this.regisztracioRoute, felhasznalo, ).subscribe((valasz : any) => {

    }, error => {
      if (error.error.type === "Nincsfnev") {
        this.regHiba = "Nincsfnev"
      }
      else if (error.error.type === "Nemjofnev") {
        this.regHiba = "Nemjofnev"
      }
      else if (error.error.type === "Vanilyenfnev") {
        this.regHiba = "Vanilyenfnev"
      }
      else if (error.error.type === "Nincsemail") {
        this.regHiba = "Nincsemail"
      }
      else if (error.error.type === "Rosszemail") {
        this.regHiba = "Rosszemail"
      }
      else if (error.error.type === "Vanmaremail") {
        this.regHiba = "Vanmaremail"
      }
      else if (error.error.type === "Nincsjelszo") {
        this.regHiba = "Nincsjelszo"
      }
      else if (error.error.type === "Nemegyezojelszavak") {
        this.regHiba = "Nemegyezojelszavak"
      }
      else if (error.error.type === "Nemjojelszo") {
        this.regHiba = "Nemjojelszo"
      }
    })
  }

  bejelentkezes(felhasznalo: loginObj): Subscription {
    return this.http.post<loginObj>(this.bejelentkezesRoute, felhasznalo).subscribe((valasz: any) => {
      this.tokenIDjson = {"token": valasz.data.token}
      console.log(this.tokenIDjson)
      if (valasz.success) {
        localStorage.setItem("access", valasz.data.token)
        this.router.navigate(['/'])
          .then(() => {
            console.log("Sikeres navigálás")
          })
          .catch(() => {
            console.log("Sikertelen navigálás")
          })
      }
    }, error => {
      if (error.error.type === "Szerver1") {
        this.bejHiba = "Szerver1"
      }
      else if (error.error.type === "Hibasadatok") {
        this.bejHiba = "Hibasadatok"
      }
      else if (error.error.type === "Szerver2") {
        this.bejHiba = "Szerver2"
      }
    })
  }

  kijelentkezes() {
    return this.http.post(this.kijelentkezesRoute, this.tokenIDjson).subscribe((valasz: any) => {
      console.log(this.tokenIDjson)
      localStorage.removeItem('access')
      console.log("Sikeres küldés!")
      if(valasz.success) {
        this.bejelentkezve = false;
        this.router.navigate(['/'])
          .then(() => {
            console.log("Sikeres navigálás")
          })
          .catch(() => {
            console.log("Sikertelen navigálás")
          })
      }
    }, error => {
      console.log(this.tokenIDjson)
    })
  }

}
