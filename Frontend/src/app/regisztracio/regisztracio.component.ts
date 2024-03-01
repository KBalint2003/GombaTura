import { Component } from '@angular/core';
import {FormsModule} from "@angular/forms";
import {signupObj} from "../felhasznaloAdatObj";
import { AutService } from "../aut.service";

@Component({
  selector: 'app-regisztracio',
  standalone: true,
  imports: [
    FormsModule
  ],
  templateUrl: './regisztracio.component.html',
  styleUrl: './regisztracio.component.css'
})

export class RegisztracioComponent {
  // A regisztáció során megadott adatok itt kerülnek tárolásra.
  felhasznalo: signupObj = {
    felhasznalonev: '',
    email: '',
    jelszo: '',
    jelszoUjra: ''
  };

  constructor(private regisztracioService: AutService) {}

  // A regisztracio.service.ts fájlban deklarált meródus itt kerül meghívásra.
  regisztracioGomb() {
    this.regisztracioService.ujFelhasznalo(this.felhasznalo).subscribe(value => {console.log("Sikeres küldés")});
  }

}
