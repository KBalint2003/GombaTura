import { Component } from '@angular/core';
import {RouterLink} from "@angular/router";
import { loginObj } from "../felhasznaloAdatObj";
import { AuthService } from "../auth.service";
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


  constructor(protected navbarService : AuthService) { }

  kijelentkezesGomb() {
    this.navbarService.kijelentkezes();
  }

  protected readonly localStorage = localStorage;
}
