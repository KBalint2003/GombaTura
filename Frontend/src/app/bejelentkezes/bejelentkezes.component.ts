import { Component } from '@angular/core';
import {FormsModule} from "@angular/forms";

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

  felhasznalo: any = {
    email: '',
    jelszo: '',
  };

  onSubmit() {
    console.log(this.felhasznalo)
  }
}
