import {Component, OnInit} from '@angular/core';
import {FormsModule} from "@angular/forms";
import {felhasznaloAdatObj} from "../felhasznaloAdatObj";
import {FelhasznaloService} from "./felhasznalo.service";
import {signupObj} from "../felhasznaloAdatObj";
import {jwtDecode, JwtPayload} from "jwt-decode";

@Component({
  selector: 'app-felhasznalo',
  standalone: true,
  imports: [
    FormsModule
  ],
  templateUrl: './felhasznalo.component.html',
  styleUrl: './felhasznalo.component.css'
})
export class FelhasznaloComponent implements OnInit{

  felhasznaloadatok: felhasznaloAdatObj = {
    telSzam: '',
    szulDatum: ''
}

  felhasznalo: signupObj = {
    userID: '',
    felhasznalonev: '',
    email: '',
    jelszo: '',
    jelszoUjra: ''
  };

  constructor(private felhasznaloService: FelhasznaloService) {
  }

  ngOnInit() {
    const token = localStorage.getItem('access')
    if (!token) {
      console.error("Nincs token")
      return
    }
      const dekodoltToken = jwtDecode(token) as JwtPayload & { felhasznalonev: string, userId: string }
      this.felhasznalo.userID = dekodoltToken.userId
      this.felhasznalo.felhasznalonev = dekodoltToken.felhasznalonev
    console.log(this.felhasznalo.userID)
  }

  adatMentesGomb() {
    this.felhasznaloService.adatMentes(this.felhasznaloadatok);
  }

  profilTorlesGomb() {
    this.felhasznaloService.profiltorles(this.felhasznalo)
    console.log("Törlés")
  }

}
