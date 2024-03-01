import { Component } from '@angular/core';
import {RouterLink} from "@angular/router";
import { loginObj } from "../felhasznaloAdatObj";
import { AutService } from "../aut.service";
import {NgIf} from "@angular/common";

@Component({
  selector: 'app-navbar',
  standalone: true,
  // Itt kerül meghívásra a RouterLink aminek a navbar.component.html-ben adunk értéket.
  imports: [RouterLink, NgIf],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.css'
})
export class NavbarComponent {

  felhasznalo: loginObj = {
    email: '',
    jelszo: '',
  };

  constructor(protected navbarService : AutService) { }

  kijelentkezesGomb() {
    this.navbarService.kijelentkezes().subscribe(value => {console.log("Sikeres küldés")});
  }

}
