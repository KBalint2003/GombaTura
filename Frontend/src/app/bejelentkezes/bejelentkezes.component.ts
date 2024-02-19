import { Component } from '@angular/core';
import {FormsModule} from "@angular/forms";
import {User} from "../User";

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

  felhasznalo: User = {
    felhasznalonev: '',
    email: '',
    jelszo: '',
  };

  onSubmit() {  // A bejelentkezés gombra kattintva, ez a metódus fog lefutni
    
  }
}
