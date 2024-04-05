import {HttpClient, HttpHeaders} from "@angular/common/http";
import { Injectable } from '@angular/core';
import {AuthService} from "./auth.service";
import {Komment, Poszt} from "./forum/forum";
import {delay} from "rxjs";

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

  posztHiba : any
  kommentHiba : any

  posztLetrehozas(ujPoszt: Poszt) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    return this.http.put<Poszt>(this.poszLetrehozasRoute, {ujPoszt}, {headers}).subscribe((valasz: any) => {
      if (valasz.success) {
        this.posztHiba = 'Siker'
        window.location.reload()
      }
    }, error => {
      if (error.error.type === 'NincsCim') {
        this.posztHiba = 'NincsCim'
      }
      else if (error.error.type === 'NincsSzoveg') {
        this.posztHiba = 'NincsSzoveg'
      }
      else if  (!localStorage.getItem('access')) {
        this.posztHiba = 'NincsBejelentkezve'
      }
    })
  }

  posztModositas(ujPoszt: Poszt, PosztID: string) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token,
      'posztId': PosztID
    });
    return this.http.patch(this.posztModositasRoute, {"poszt": ujPoszt}, {headers}).subscribe((valasz: any) => {
      console.log(valasz.message)
    })
  }


  kommentLetrehozas(ujKomment: Komment, Poszt: string) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    return this.http.put<Komment>(this.kommentLetrehozasRoute, {ujKomment, Poszt}, {headers}).subscribe((valasz: any) => {
      if (valasz.success) {
        this.kommentHiba = 'Siker'
        window.location.reload()
      }
    }, error => {
      if (error.error.type === 'NincsKomment') {
        this.kommentHiba = 'NincsKomment'
      }
    })
  }

}

