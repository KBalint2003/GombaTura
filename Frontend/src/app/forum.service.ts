import {HttpClient, HttpHeaders} from "@angular/common/http";
import { Injectable } from '@angular/core';
import {AuthService} from "./auth.service";
import {Poszt} from "./forum/poszt";

@Injectable({
  providedIn: 'root'
})
export class ForumService {

  public posztLekeresRoute = "http://localhost:3000/forum/osszes"
  public posztKommenttelLekeresRoute = "http://localhost:3000/forum"
  public poszLetrehozasRoute = "http://localhost:3000/forum"
  public posztModositasRoute = "http://localhost:3000/forum"
  public posztTorlesRoute = "http://localhost:3000/forum"
  public kommentLetrehozasRoute = "http://localhost:3000/forum/komment"

  constructor(protected http: HttpClient, protected authService: AuthService) { }

  posztLetrehozas(ujPoszt: Poszt) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    return this.http.put<Poszt>(this.poszLetrehozasRoute, {ujPoszt}, {headers}).subscribe((valasz: any) => {
      console.log("Sikeres létrehozás")
    }, error => {
      console.log(ujPoszt.Cim)
      console.log(ujPoszt.Szoveg)
    })
  }

}

