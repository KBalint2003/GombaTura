import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {felhasznaloAdatObj} from "./felhasznaloAdatObj";
import {AuthService} from "./auth.service";
import {Router} from "@angular/router";

@Injectable({
  providedIn: 'root'
})
export class FelhasznaloService {

  constructor(private  http: HttpClient, protected  authservice: AuthService, private router: Router) { }

  public profilAdatLekeres = "http://localhost:3000/profil";
  public profilModositas = "http://localhost:3000/profil";
  public profilTorles = "http://localhost:3000/profil";

  adatMentes(felhasznaloadatok: felhasznaloAdatObj) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authservice.tokenIDjson.token
    });
    return this.http.patch(this.profilModositas, {"felhasznaloadatok": felhasznaloadatok}, {headers}).subscribe((valasz: any) => {
      if (valasz.success) {
        window.location.reload()
      }
    })
  }

  profiltorles()  {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authservice.tokenIDjson.token
    });
    return this.http.delete(this.profilTorles, {headers}).subscribe((valasz: any) => {
      if (valasz.success) {
        localStorage.removeItem('access')
        this.router.navigate(['/'])
          .then(() => {
            console.log("Sikeres navigálás")
            window.location.reload()
          })
          .catch(() => {
            console.log("Sikertelen navigálás")
          })
      }
    })
  }

}
