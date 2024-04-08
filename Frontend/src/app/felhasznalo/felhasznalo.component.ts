import {Component, OnInit} from '@angular/core';
import {FormsModule} from "@angular/forms";
import {felhasznaloAdatObj} from "../felhasznaloAdatObj";
import {FelhasznaloService} from "../felhasznalo.service";
import {signupObj} from "../felhasznaloAdatObj";
import {jwtDecode, JwtPayload} from "jwt-decode";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {AuthService} from "../auth.service";
import {NgForOf, NgIf} from "@angular/common";

@Component({
  selector: 'app-felhasznalo',
  standalone: true,
  imports: [
    FormsModule,
    NgIf,
    NgForOf
  ],
  templateUrl: './felhasznalo.component.html',
  styleUrl: './felhasznalo.component.css'
})
export class FelhasznaloComponent implements OnInit{

  felhasznaloadatok: felhasznaloAdatObj = {
    Telefon_szam: '',
    Szuletesi_ido: ''
  }

  felhasznalo: signupObj = {
    userID: '',
    felhasznalonev: '',
    email: '',
    jelszo: '',
    jelszoUjra: ''
  };

    telszam = ''
    szulido = ''

  constructor(protected http: HttpClient,protected felhasznaloService: FelhasznaloService, protected authservice: AuthService) {
  }

  ngOnInit() {
    const token = localStorage.getItem('access')
    if (!token) {
      return
    }
      const dekodoltToken = jwtDecode(token) as JwtPayload & { felhasznalonev: string, userId: string }
      this.felhasznalo.userID = dekodoltToken.userId
      this.felhasznalo.felhasznalonev = dekodoltToken.felhasznalonev

      this.felhasznaloService.sajatPosztLekeres()

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authservice.tokenIDjson.token
    });
      return this.http.get(this.felhasznaloService.profilAdatLekeresRoute, {headers}).subscribe((valasz: any) => {
        this.telszam = valasz.user.Telefon_szam
        this.szulido = valasz.user.Szuletesi_ido
      })



  }

  adatMentesGomb() {
    this.felhasznaloService.adatMentes(this.felhasznaloadatok);
  }

  profilTorlesGomb() {
    this.felhasznaloService.profiltorles()
  }

}
