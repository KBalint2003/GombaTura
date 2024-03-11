import {Component, OnInit, TemplateRef, inject} from '@angular/core';
import { AuthService } from "../auth.service";
import {HttpClient} from "@angular/common/http";
import {Tura, Turak} from "./tura";
import {TuraService} from "../tura.service";
import { NgForOf, NgIf} from "@angular/common";
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import {FormsModule} from "@angular/forms";

@Component({
  selector: 'app-tura',
  standalone: true,
  imports: [
    NgForOf,
    FormsModule,
    NgIf,
  ],
  templateUrl: './tura.component.html',
  styleUrl: './tura.component.css'
})
export class TuraComponent implements  OnInit{

  constructor(protected authservice: AuthService, protected http: HttpClient, protected turaservice: TuraService) {  }

  private modalService = inject(NgbModal);

  open(content: TemplateRef<any>) {
		this.modalService.open(content, { ariaLabelledBy: 'modal-basic-title' })
	}

  ujTura: Tura = {
    Tura_id: '',
    Tura_neve: '',
    Indulas_ido: '',
    Indulas_hely: '',
    Erkezesi_ido: '',
    Erkezesi_hely: '',
    Utvonal_nehezsege: '',
    Szervezo_elerhetosege: '',
    Tura_dija: 0,
    Elmarad_a_tura: false,
    Leiras: '',
    // LetrehozoNeve: {
    //   Felhasznalonev: ''
    // }
  }
  turak: Tura[] = []

  TuraID = ''

  ngOnInit() {
    return this.http.get<Turak>(this.turaservice.turaLekeresRoute).subscribe((valasz:any) => {
       for (let i = 0; i < valasz.turak.length; i++) {
      //   this.ujTura.Tura_id = valasz.turak[i].Tura_id
      //   console.log(this.ujTura.Tura_id)
      //   this.ujTura.Tura_neve = valasz.turak[i].Tura_neve
      //   console.log(this.ujTura.Tura_neve)
      //   this.ujTura.Indulas_ido = valasz.turak[i].Indulas_ido
      //   console.log(this.ujTura.Indulas_ido)
      //   this.ujTura.Indulas_hely = valasz.turak[i].Indulas_hely
      //   console.log(this.ujTura.Indulas_hely)
      //   this.ujTura.Varhato_erkezesi_ido = valasz.turak[i].Varhato_erkezesi_ido
      //   console.log(this.ujTura.Varhato_erkezesi_ido)
      //   this.ujTura.Erkezesi_hely = valasz.turak[i].Erkezesi_hely
      //   console.log(this.ujTura.Erkezesi_hely)
      //   this.ujTura.Utvonal_nehezsege = valasz.turak[i].Utvonal_nehezsege
      //   console.log(this.ujTura.Utvonal_nehezsege)
      //   this.ujTura.Szervezo_elerhetosege = valasz.turak[i].Szervezo_elerhetosege
      //   console.log(this.ujTura.Szervezo_elerhetosege)
      //   this.ujTura.Tura_dija = valasz.turak[i].Tura_dija
      //   console.log(this.ujTura.Tura_dija)
      //   this.ujTura.Elmarad_a_tura = valasz.turak[i].Elmarad_a_tura
      //   console.log(this.ujTura.Elmarad_a_tura)
      //   this.ujTura.Leiras = valasz.turak[i].Leiras
      //   console.log(this.ujTura.Leiras)
      //   // this.ujTura.LetrehozoNeve.Felhasznalonev = valasz.turak[i].LetrehozoNeve.Felhasznalonev
      //   // console.log(this.ujTura.LetrehozoNeve)
      //   this.turak.push(this.ujTura)
         this.TuraID = valasz.turak[i].Tura_id
         console.log(this.TuraID)
       }

      this.turak = valasz.turak

      console.log(valasz.turak.length)
    });
  }



}
