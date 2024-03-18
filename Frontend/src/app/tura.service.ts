import {Injectable, OnInit} from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {Tura} from "./tura/tura";
import { AuthService } from "./auth.service";
import {TuraComponent} from "./tura/tura.component";
import {error} from "@angular/compiler-cli/src/transformers/util";


@Injectable({
  providedIn: 'root'
})

export class TuraService {

  constructor(private http: HttpClient, protected authService: AuthService) { }



  public osszesturaLekeresRoute = "http://localhost:3000/turak/osszes"
  public turaLekeresRoute = "http://localhost:3000/turak/"
  public turaJelentkezesRoute = "http://localhost:3000/turak"
  public turaLetrehozasRoute = "http://localhost:3000/turak"
  public turaSzerkesztesRoute = "http://localhost:3000/turak"
  public turaTorlesRoute = "http://localhost:3000/turak/torles"

  turahiba = ''
  userID = '0b7b054e-53e2-427f-8d50-8999532dd706'


  turaLetrehozas(ujTura: Tura) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    return this.http.put<Tura>(this.turaLetrehozasRoute, {ujTura}, {headers}).subscribe((valasz : any) => {
      if (valasz.success) {
        this.turahiba = 'Siker'
      }
      console.log(ujTura)
    }, error => {
      console.log(ujTura)
      if (error.error.type === 'Nincsnev') {
        this.turahiba = 'Nincsnev'
      }
      else if (error.error.type === 'NincsIndIdo') {
        this.turahiba = 'NincsIndIdo'
      }
      else if (error.error.type === 'NincsIndHely') {
        this.turahiba = 'NincsIndHely'
      }
      else if (error.error.type === 'NincsErkIdo') {
        this.turahiba = 'NincsErkIdo'
      }
      else if (error.error.type === 'NincsErkHely') {
        this.turahiba = 'NincsErkHely'
      }
      else if (error.error.type === 'NincsNehezseg') {
        this.turahiba = 'NincsNehezseg'
      }
      else if (error.error.type === 'Szerver') {
        this.turahiba = 'Szerver'
      }
      else if (error.error.type === 'Nincsleiras') {
        this.turahiba = 'Nincsleiras'
      }
    })
  }

  jelentkezesTurara(Tura_id: string) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    console.log(Tura_id)
    return this.http.post(this.turaJelentkezesRoute, Tura_id, {headers}).subscribe( (valasz : any) => {
      console.log("Sikeres jelentkezés")
    }, error => {
      console.log(error)
    } )
  }

  turaModositas(Tura_id: string) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    return this.http.patch(this.turaSzerkesztesRoute, Tura_id, {headers})
  }

  turaTorles(Tura_id: string) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    return this.http.post(this.turaTorlesRoute, Tura_id).subscribe((valasz: any) => {
    }, error => {
      console.log()
    })
  }

}
