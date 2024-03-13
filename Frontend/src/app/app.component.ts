import {Component, OnInit} from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import {NavbarComponent} from "./navbar/navbar.component";
import {FooterComponent} from "./footer/footer.component";
import {jwtDecode, JwtPayload} from "jwt-decode";



@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule,NavbarComponent, FooterComponent, RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit{
  title = 'UjGomba';

  ngOnInit() {
    const token = localStorage.getItem('access')
    if (!token) {
      console.error("Nincs token")
      return
    }
    try {
      const dekodoltToken = jwtDecode(token) as JwtPayload & { exp : number }
      const idoMasodpercben = Math.floor(Date.now() / 1000);
      if (idoMasodpercben > dekodoltToken.exp) {
        localStorage.removeItem('access')
      }
      return
    } catch (err) {
      console.error('Error decoding token:', err);
      return false;
    }
  }
}
