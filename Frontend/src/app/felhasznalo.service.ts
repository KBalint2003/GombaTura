import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {felhasznaloAdatObj} from "./felhasznaloAdatObj";
import {AuthService} from "./auth.service";
import {Router} from "@angular/router";
import {Poszt} from "./forum/forum";

@Injectable({
  providedIn: 'root'
})
export class FelhasznaloService {

  constructor(private  http: HttpClient, protected  authservice: AuthService, private router: Router) { }

  public profilAdatLekeresRoute = "http://localhost:3000/profil";
  public profilModositasRoute = "http://localhost:3000/profil";
  public profilTorlesRoute = "http://localhost:3000/profil";
  public sajatPosztLekeresRoute = "http://localhost:3000/profil/posztok";

  ujPoszt: Poszt = {
    Poszt_id: '',
    Cim: '',
    Szoveg: '',
    PosztoloNeve: ''
  }

  posztok : Poszt[] = []

  adatMentes(felhasznaloadatok: felhasznaloAdatObj) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authservice.tokenIDjson.token
    });
    return this.http.patch(this.profilModositasRoute, {"felhasznaloadatok": felhasznaloadatok}, {headers}).subscribe((valasz: any) => {
      if (valasz.success) {
        window.location.reload()
      }
    })
  }



  sajatPosztLekeres() {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authservice.tokenIDjson.token
    });
    return this.http.get(this.sajatPosztLekeresRoute, {headers}).subscribe((valasz: any) => {
      this.posztok = valasz.posztok
    })
  }

  profiltorles()  {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authservice.tokenIDjson.token
    });
    return this.http.delete(this.profilTorlesRoute, {headers}).subscribe((valasz: any) => {
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
