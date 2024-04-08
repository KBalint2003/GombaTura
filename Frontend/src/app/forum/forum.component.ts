import {Component, inject, OnInit, TemplateRef} from '@angular/core';
import {NgbModal} from "@ng-bootstrap/ng-bootstrap";
import {FormsModule} from "@angular/forms";
import {NgForOf, NgIf} from "@angular/common";
import {PosztKommenttel, Poszt, Komment} from "./forum";
import {ForumService} from "../forum.service";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {AuthService} from "../auth.service";
import {MatIconModule} from '@angular/material/icon'
import {jwtDecode, JwtPayload} from "jwt-decode";



@Component({
  selector: 'app-forum',
  standalone: true,
  imports: [
    FormsModule,
    NgIf,
    NgForOf,
    MatIconModule
  ],
  templateUrl: './forum.component.html',
  styleUrl: './forum.component.css'
})
export class ForumComponent implements OnInit{

  constructor(protected forumService: ForumService, protected http: HttpClient, protected authService: AuthService) { }

  private modalService = inject(NgbModal);

  ujPoszt: Poszt = {
    Poszt_id: '',
    Cim : '',
    Szoveg: '',
    PosztoloNeve: ''
  }
  Posztok : Poszt[] = []

  ujKomment: Komment = {
    Komment_id: '',
    Komment: '',
    Kommentelo: ''
  }

  Kommentek : Komment[] = []



  PosztokKommenttel : PosztKommenttel[] = []

  felhasznalonev = ''

  ngOnInit() {

    const token = localStorage.getItem('access')
    if (!token) {
      console.error("Nincs token")

      return this.http.get<Poszt>(this.forumService.posztLekeresRoute).subscribe((valasz: any) => {
        this.Posztok = valasz.posztok

      })
    }
    const dekodoltToken = jwtDecode(token) as JwtPayload & { felhasznalonev: string }

      this.felhasznalonev = dekodoltToken.felhasznalonev

    return this.http.get<Poszt>(this.forumService.posztLekeresRoute).subscribe((valasz: any) => {
      this.Posztok = valasz.posztok
    })
  }



  PosztMegniytasModal(PosztMegnyitas: TemplateRef<any>, Poszt: string) {
    this.modalService.open(PosztMegnyitas, {ariaLabelledBy: 'PosztMegnyitasModal'})
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token,
      'posztId': Poszt
    });
    return this.http.get<PosztKommenttel>(this.forumService.posztKommenttelLekeresRoute, {headers}).subscribe((valasz : any) => {
      this.PosztokKommenttel = valasz.poszt
      this.Kommentek = valasz.kommentek
    })
  }

  PosztLetrehozasModal(PosztLetrehozas: TemplateRef<any>) {
    this.modalService.open(PosztLetrehozas, { ariaLabelledBy: 'PosztLetrehozasModal' })
  }

  PosztModositasModal(PosztModositas: TemplateRef<any>) {
    this.modalService.open(PosztModositas, { ariaLabelledBy: 'PosztModositasModal' })
  }


  protected readonly localStorage = localStorage;
}
