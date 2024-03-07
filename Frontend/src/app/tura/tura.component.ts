import {Component, OnInit, TemplateRef, inject} from '@angular/core';
import { AuthService } from "../auth.service";
import {HttpClient} from "@angular/common/http";
import {Tura, Turak} from "./tura";
import {TuraService} from "../tura.service";
import {NgForOf} from "@angular/common";
import { NgbModal,  } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-tura',
  standalone: true,
  imports: [
    NgForOf, 
  ],
  templateUrl: './tura.component.html',
  styleUrl: './tura.component.css'
})
export class TuraComponent implements  OnInit{

  constructor(protected authservice: AuthService, protected http: HttpClient, protected turaservice: TuraService) {  }

  private modalService = inject(NgbModal);
	closeResult = '';

  open(content: TemplateRef<any>) {
		this.modalService.open(content, { ariaLabelledBy: 'modal-basic-title' })
	}

  turak: Tura[] = []

  ngOnInit() {
    return this.http.get<Turak>(this.turaservice.turaLekeresRoute).subscribe((valasz:any) => {
    this.turak = [
      {
        Tura_neve: "Kismacska",
        Letrehozo: "adadasdas",
        Tura_id: "46dc8c4b-f05c-42e8-bd74-18d043d41c25",
        Indulas_ido: "2024-06-06T12:00:00.000Z",
        Indulas_hely: "Sárospatak",
        Varhato_erkezesi_ido: "2024-06-06T14:40:00.000Z",
        Erkezesi_hely: "Sárospatak",
        Utvonal_nehezsege: "Közepes",
        Szervezo_elerhetosege: "klubertbalint@test.com",
        Tura_dija: 0,
        Elmarad_a_tura: false,
        Leiras: "Ez egy teszt túra 2",
        LetrehozoNeve: {
          "Felhasznalonev": "ShadowCaptain"
        }
      },
      {
        Tura_neve: "Kiskutya",
        Tura_id: "46dc8c4b-f05c-42e8-bd74-18d043d41c25",
        Letrehozo: "aa33880b-489b-4929-86d9-02c400ce2c91",
        Indulas_ido: "2024-06-06T12:00:00.000Z",
        Indulas_hely: "Sárospatak",
        Varhato_erkezesi_ido: "2024-06-06T14:40:00.000Z",
        Erkezesi_hely: "Sárospatak",
        Utvonal_nehezsege: "Közepes",
        Szervezo_elerhetosege: "klubertbalint@test.com",
        Tura_dija: 0,
        Elmarad_a_tura: false,
        Leiras: "Ez egy teszt túra 2",
        LetrehozoNeve: {
        Felhasznalonev: "Tesztuser"
    }
  },
];
  })
  }

  // turalekeres(): Observable<TurakResponse> {
  //   return this.http.get<TurakResponse>(this.turaservice.turaLekeresRoute);
  // }

}
