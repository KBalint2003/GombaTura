import { Component } from '@angular/core';
import {FormsModule} from "@angular/forms";
import {User} from "../User";
import {FelhasznaloService} from "./regisztracio.service";

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
  felhasznalo: User = {
    felhasznalonev: '',
    email: '',
    jelszo: '',
  };

  constructor(private felhasznaloService: FelhasznaloService) {}

  onSubmit() {
    this.felhasznaloService.ujFelhasznalo(this.felhasznalo);
  }

}
