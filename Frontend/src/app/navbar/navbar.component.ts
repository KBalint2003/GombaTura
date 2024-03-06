import {Component, OnInit} from '@angular/core';
import {RouterLink} from "@angular/router";
import {AuthService} from "../auth.service";
import {NgIf} from "@angular/common";

@Component({
  selector: 'app-navbar',
  standalone: true,
  // Itt kerül meghívásra a RouterLink aminek a navbar.component.html-ben adunk értéket.
  imports: [RouterLink, NgIf],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.css'
})
export class NavbarComponent implements OnInit{


  constructor(protected navbarService : AuthService) { }

  ngOnInit() {
    this.navbarService.tokenIDjson = localStorage.getItem('access')
    console.log(this.navbarService.tokenIDjson)
  }


  kijelentkezesGomb() {
    this.navbarService.kijelentkezes();
  }

  protected readonly localStorage = localStorage;
}
