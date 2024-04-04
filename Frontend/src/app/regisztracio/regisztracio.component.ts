import {Component, ViewChild} from '@angular/core';
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
    userID: '',
    felhasznalonev: '',
    email: '',
    jelszo: '',
    jelszoUjra: ''
  };

  szabalyCheck = false

  constructor(protected regisztracioService: AuthService) {}
  protected readonly open = open;

  @ViewChild('Szabaly') Szabaly: any;

  onCheckBoxSzabalyChange() {
    this.szabalyCheck = this.Szabaly.nativeElement.checked
  }

  // A regisztracio.service.ts fájlban deklarált meródus itt kerül meghívásra.
  regisztracioGomb() {
    this.regisztracioService.ujFelhasznalo(this.felhasznalo)
  }

}
