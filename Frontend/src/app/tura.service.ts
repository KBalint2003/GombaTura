import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {Tura} from "./tura/tura";
import { AuthService } from "./auth.service";

@Injectable({
  providedIn: 'root'
})
export class TuraService {

  constructor(private http: HttpClient, protected authService: AuthService) { }

  public turaLekeresRoute = "http://localhost:3000/turak/osszes"
  public turaJelentkezesRoute = "http://localhost:3000/turak"
  public turaLetrehozasRoute = "http://localhost:3000/turak"
  public turaSzerkesztesRoute = "http://localhost:3000/turak"
  public turaTorlesRoute = "http://localhost:3000/turak"



  turaLetrehozas(ujTura: Tura) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    console.log(ujTura)
    return this.http.put<Tura>(this.turaLetrehozasRoute, {ujTura}, {headers}).subscribe((valasz : any) => {
      console.log(ujTura)
    }, error => {
      console.log(ujTura)
      console.log(error)
    })
  }



}
