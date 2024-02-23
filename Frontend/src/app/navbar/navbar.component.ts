import { Component } from '@angular/core';
import {RouterLink} from "@angular/router";
import {loginObj} from "../loginObj";
import {NavbarService} from "./navbar.service";

@Component({
  selector: 'app-navbar',
  standalone: true,
  // Itt kerül meghívásra a RouterLink aminek a navbar.component.html-ben adunk értéket.
  imports: [RouterLink],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.css'
})
export class NavbarComponent {

  felhasznalo: loginObj = {
    email: '',
    jelszo: ''
}

  constructor(private navbarService : NavbarService) { }

  kijelentkezesGomb() {
    this.navbarService.kijelentkezes(this.felhasznalo).subscribe(value => {console.log("Sikeres küldés")});
  }

}
