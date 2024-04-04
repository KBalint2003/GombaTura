import {Component, inject, OnInit, TemplateRef} from '@angular/core';
import {NgbModal} from "@ng-bootstrap/ng-bootstrap";
import {FormsModule} from "@angular/forms";
import {NgForOf, NgIf} from "@angular/common";
import {PosztKommenttel, Poszt, Komment} from "./forum";
import {ForumService} from "../forum.service";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {AuthService} from "../auth.service";

@Component({
  selector: 'app-forum',
  standalone: true,
  imports: [
    FormsModule,
    NgIf,
    NgForOf
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

  ujPosztKommenttel: PosztKommenttel = {
    Poszt_id: '',
    Cim : '',
    Szoveg: '',
    PosztoloNeve: '',
  }

  PosztokKommenttel : PosztKommenttel[] = []

  ngOnInit() {

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
      console.log(this.PosztokKommenttel)
      this.Kommentek = valasz.kommentek
      console.log(this.Kommentek)
    })
  }

  PosztLetrehozasModal(PosztLetrehozas: TemplateRef<any>) {
    this.modalService.open(PosztLetrehozas, { ariaLabelledBy: 'PosztLetrehozasModal' })
  }


  protected readonly console = console;
}
