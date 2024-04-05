import {Injectable} from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import { Tura} from "./tura/tura";
import { AuthService } from "./auth.service";

@Injectable({
  providedIn: 'root'
})

export class TuraService {

  constructor(private http: HttpClient, protected authService: AuthService) {  }

  public osszesturaLekeresRoute = "http://localhost:3000/turak/osszes"
  public turaLekeresRoute = "http://localhost:3000/turak/"
  public jelentkezettTuraLekeresRoute = "http://localhost:3000/turak/jelentkezett"
  public turaJelentkezesRoute = "http://localhost:3000/turak"
  public turaJelentkezesTorleseRoute = "http://localhost:3000/turak"
  public turaLetrehozasRoute = "http://localhost:3000/turak"
  public turaSzerkesztesRoute = "http://localhost:3000/turak"

  turahiba = ''
  turaModosistasHiba = ''
  userID = '0b7b054e-53e2-427f-8d50-8999532dd706'


  turaLetrehozas(ujTura: Tura) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    return this.http.put<Tura>(this.turaLetrehozasRoute, {ujTura}, {headers}).subscribe((valasz : any) => {
      if (valasz.success) {
        this.turahiba = 'Siker'
          window.location.reload()
      }
    }, error => {
      console.log(error.error.type)
      if (error.error.type === 'NincsSzulEv') {
        this.turahiba = 'NincsSzulEv'
      }
      else if (error.error.type === 'Nem18') {
        this.turahiba = 'Nem18'
      }
      else if (error.error.type === 'Nincsnev') {
        this.turahiba = 'Nincsnev'
      }
      else if (error.error.type === 'NincsIndIdo') {
        this.turahiba = 'NincsIndIdo'
      }
      else if (error.error.type === 'RosszIndIdo') {
        this.turahiba = 'RosszIndIdo'
      }
      else if (error.error.type === 'NincsIndHely') {
        this.turahiba = 'NincsIndHely'
      }
      else if (error.error.type === 'NincsErkIdo') {
        this.turahiba = 'NincsErkIdo'
      }
      else if (error.error.type === 'RosszErkIdo') {
        this.turahiba = 'RosszErkIdo'
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
      else if (!localStorage.getItem('access')) {
        this.turahiba = 'NotLogged'
      }
    })
  }

  turaModositas(ujTura: Tura, Tura_id: string) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token,
      'turaid': Tura_id
    });
    return this.http.patch(this.turaSzerkesztesRoute, {"ujTura": ujTura}, {headers}).subscribe((valasz: any) => {
      if (valasz.success) {
        this.turaModosistasHiba = 'Siker'
        window.location.reload()
      }
    }, error => {
      console.log(error)
    })
  }

  jelentkezesTurara(Tura_id: string) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    return this.http.post(this.turaJelentkezesRoute, {Tura_id}, {headers}).subscribe( (valasz : any) => {
      this.turahiba = ""
      if (valasz.success) {
        window.location.reload()
      }
    }, error => {
      console.log(error)
    } )
  }

  jelentkezesTorlese(Tura_id: string) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token,
      'Tura_id': Tura_id
    });
    return this.http.delete(this.turaJelentkezesTorleseRoute, {headers}).subscribe((valasz: any) => {
      if (valasz.success) {
        window.location.reload()
      }
    }, error => {
      console.log(error)
    })
  }
}
