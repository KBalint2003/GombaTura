import { Component } from '@angular/core';
import { FormsModule } from "@angular/forms";
import { loginObj } from "../felhasznaloAdatObj";
import {AuthService} from "../auth.service";
import {NgIf} from "@angular/common";

@Component({
  selector: 'app-bejelentkezes',
  standalone: true,
  imports: [
    FormsModule,
    NgIf,
  ],
  templateUrl: './bejelentkezes.component.html',
  styleUrl: './bejelentkezes.component.css'
})
export class BejelentkezesComponent {

  constructor(protected bejelentkezesService: AuthService) { }


  // Az ngModul segítségével kinyert adatok ebbe a változóba kerülnek bele

  felhasznalo: loginObj = {
    email: '',
    jelszo: '',
  };

  bejelentkezesGomb() {  // A bejelentkezés gombra kattintva, ez a metódus fog lefutni
    this.bejelentkezesService.bejelentkezes(this.felhasznalo)
  }

}
