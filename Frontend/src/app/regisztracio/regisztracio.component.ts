import { Component } from '@angular/core';
import {FormsModule} from "@angular/forms";

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
  felhasznalo: any = {
    felhasznalonev: '',
    email: '',
    jelszo: '',
  };

  onSubmit() {
        console.log(this.felhasznalo)
  }

}
