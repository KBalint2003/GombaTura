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
    TuraNeve:'',
    TuraID:'',
    IndulasIdo:'',
    IndulasHely:'',
    ErkezesiIdo:'',
    ErkezesiHely:'',
    UtvonalNehezsege:'',
    SzervezoElerhetosege:'',
    TuraDija: 0,
    ElmaradE: false,
    Leiras: '',
    LetrehozoNeve: {
      Felhasznalonev: ''
    }
  }
  turak: Tura[] = []

  ngOnInit() {
    return this.http.get<Turak>(this.turaservice.turaLekeresRoute).subscribe((valasz:any) => {
    this.turak =  valasz.turak
      console.log(valasz)
  })
  }



}
