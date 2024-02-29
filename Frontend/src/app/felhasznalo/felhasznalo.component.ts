import { Component } from '@angular/core';
import {FormsModule} from "@angular/forms";
import {felhasznaloAdatObj} from "../felhasznaloAdatObj";
import {FelhasznaloService} from "./felhasznalo.service";
import {signupObj} from "../felhasznaloAdatObj";

@Component({
  selector: 'app-felhasznalo',
  standalone: true,
  imports: [
    FormsModule
  ],
  templateUrl: './felhasznalo.component.html',
  styleUrl: './felhasznalo.component.css'
})
export class FelhasznaloComponent {

  felhasznaloadatok: felhasznaloAdatObj = {
    telSzam: '',
    szulDatum: ''
}

  felhasznalo: signupObj = {
    felhasznalonev: '',
    email: '',
    jelszo: '',
    jelszoUjra: ''
  };

  constructor(private felhasznaloService: FelhasznaloService) {
  }

  adatMentesGomb() {
    this.felhasznaloService.adatMentes(this.felhasznaloadatok);
  }

  profilTorlesGomb() {
    this.felhasznaloService.profiltorles(this.felhasznalo)
    console.log("Törlés")
  }

}
