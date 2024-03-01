import { Component } from '@angular/core';
import { FormsModule } from "@angular/forms";
import { loginObj } from "../felhasznaloAdatObj";
import {AutService} from "../aut.service";

@Component({
  selector: 'app-bejelentkezes',
  standalone: true,
  imports: [
    FormsModule,
  ],
  templateUrl: './bejelentkezes.component.html',
  styleUrl: './bejelentkezes.component.css'
})
export class BejelentkezesComponent {

  constructor(protected bejelentkezesService: AutService) { }


  // Az ngModul segítségével kinyert adatok ebbe a változóba kerülnek bele

  felhasznalo: loginObj = {
    email: '',
    jelszo: '',
  };

  bejelentkezesGomb() {  // A bejelentkezés gombra kattintva, ez a metódus fog lefutni
    this.bejelentkezesService.bejelentkezes(this.felhasznalo)
  }

}
