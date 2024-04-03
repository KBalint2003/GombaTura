import {Component, inject, OnInit, TemplateRef} from '@angular/core';
import {NgbModal} from "@ng-bootstrap/ng-bootstrap";
import {FormsModule} from "@angular/forms";
import {NgForOf, NgIf} from "@angular/common";
import {Poszt} from "./poszt";
import {ForumService} from "../forum.service";
import {HttpClient} from "@angular/common/http";

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

  constructor(protected forumService: ForumService, protected http: HttpClient) { }

  private modalService = inject(NgbModal);

  ujPoszt: Poszt = {
    Poszt_id: '',
    Cim : '',
    Szoveg: '',
    PosztoloNeve: ''
  }
  Posztok : Poszt[] = []

  ngOnInit() {

    return this.http.get<Poszt>(this.forumService.posztLekeresRoute).subscribe((valasz: any) => {
      this.Posztok = valasz.posztok
    })

  }

  PosztMegniytasModal(PosztMegnyitas: TemplateRef<any>) {
    this.modalService.open(PosztMegnyitas, {ariaLabelledBy: 'PosztMegnyitasModal'})
  }

  PosztLetrehozasModal(PosztLetrehozas: TemplateRef<any>) {
    this.modalService.open(PosztLetrehozas, { ariaLabelledBy: 'PosztLetrehozasModal' })
  }


  protected readonly console = console;
}
