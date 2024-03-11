import { Component } from '@angular/core';
import { FooterComponent } from '../footer/footer.component';
import {NgbCarousel, NgbSlide} from "@ng-bootstrap/ng-bootstrap";
import {RouterLink} from "@angular/router";
import {NgIf} from "@angular/common";

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [FooterComponent, NgbCarousel, NgbSlide, RouterLink, NgIf],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css' })
export class HomeComponent {
  images = [
    '../assets/img/enciklopedia.jpg',
    '../assets/img/forum.jpg',
    '../assets/img/turak.jpg',
    '../assets/img/terkep.jpg',
    '../assets/img/profil.jpg'
  ]
  protected readonly localStorage = localStorage;
}
