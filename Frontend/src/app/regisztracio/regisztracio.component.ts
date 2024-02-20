import { Component } from '@angular/core';
import {FormsModule} from "@angular/forms";
import {User} from "../User";
import {FelhasznaloService} from "./regisztracio.service";
import {HttpClient} from "@angular/common/http";

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
  felhasznalo: User = {
    felhasznalonev: '',
    email: '',
    jelszo: '',
  };

  constructor(private felhasznaloService: FelhasznaloService) {}

  // A regisztracio.service.ts fájlban deklarált meródus itt kerül meghívásra.
  regisztralas() {
    this.felhasznaloService.ujFelhasznalo(this.felhasznalo).subscribe(value => {console.log("Sikeres küldés")});

  }

}
