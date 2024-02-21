import { Component } from '@angular/core';
import { FormsModule } from "@angular/forms";
import { loginObj } from "../loginObj";

@Component({
  selector: 'app-bejelentkezes',
  standalone: true,
  imports: [
    FormsModule
  ],
  templateUrl: './bejelentkezes.component.html',
  styleUrl: './bejelentkezes.component.css'
})
export class BejelentkezesComponent {

  // Az ngModul segítségével kinyert adatok ebbe a változóba kerülnek bele

  felhasznalo: loginObj = {
    felhasznalonev: '',
    jelszo: '',
  };

  bejelentkezes() {  // A bejelentkezés gombra kattintva, ez a metódus fog lefutni

  }
}
