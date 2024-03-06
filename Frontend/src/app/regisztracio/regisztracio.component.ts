import { Component } from '@angular/core';
import {FormsModule} from "@angular/forms";
import {signupObj} from "../felhasznaloAdatObj";
import { AuthService } from "../auth.service";
import {NgIf} from "@angular/common";

@Component({
  selector: 'app-regisztracio',
  standalone: true,
  imports: [
    FormsModule,
    NgIf
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

  constructor(protected regisztracioService: AuthService) {}

  // A regisztracio.service.ts fájlban deklarált meródus itt kerül meghívásra.
  regisztracioGomb() {
    this.regisztracioService.ujFelhasznalo(this.felhasznalo)
  }

}
