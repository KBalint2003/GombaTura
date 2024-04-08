import {Component, inject, OnInit, TemplateRef,} from '@angular/core';
import {NgForOf, NgIf, SlicePipe} from "@angular/common";
import {HttpClient} from "@angular/common/http";
import {Gomba} from "./gomba";
import { FormsModule, ReactiveFormsModule} from "@angular/forms";
import { DecimalPipe } from '@angular/common';
import {Kereses} from "./kereses";
import {MatIcon} from "@angular/material/icon";
import {NgbModal, NgbTooltip} from "@ng-bootstrap/ng-bootstrap";



@Component({
  selector: 'app-enciklopedia',
  standalone: true,
  imports: [
    DecimalPipe,
    FormsModule,
    NgForOf,
    SlicePipe,
    ReactiveFormsModule,
    Kereses,
    NgIf,
    MatIcon,
    NgbTooltip
  ],
  templateUrl: './enciklopedia.component.html',
  styleUrl: './enciklopedia.component.css'
})
export class EnciklopediaComponent implements OnInit{

  constructor(protected http: HttpClient) {
  }

  protected gombaLekeres = "http://localhost:3000/enciklopedia";


  gomba: Gomba = {
    Gomba_Id : 0,
    Latin_nev : '',
    Magyar_nev : '',
    Nemzetseg: '',
    Etkezes_ertek: 0,
    Feltetel: '',
    Leiras: '',
    Bocskora: 0,
    Galler: 0,
    Szezon_eleje: 0,
    Szezon_vege: 0,
    Novenyzet: '',
    Termotest_tipus: '',
    Termoretegtarto_tipusok: '',
    Kalap_forma: '',
    Kalap_felszin: '',
    Kalap_perem: '',
    Lemezallas: '',
    Lemez_el: '',
    Burok_maradvany: '',
    Tonk_alak: '',
    Tonk_felulet: '',
    Hus: '',
    Hus_elszinezodes: '',
    Ize: '',
    Illata: '',
    Ara_HUF: 0,
    Kep_keszito_neve: '',
    Kep_neve: ''
  }

  gombak: Gomba[] = []

  searchText = '';

  private modalService = inject(NgbModal);


  ngOnInit() {
    return this.http.get<Gomba>(this.gombaLekeres).subscribe((valasz: any) => {
      this.gombak = valasz.gombak
    })
  }

  GombaMegnyitasModal(gombaMegnyitas: TemplateRef<any>) {
    this.modalService.open(gombaMegnyitas, { ariaLabelledBy: 'gombaMegnyitas' })
  }


}
