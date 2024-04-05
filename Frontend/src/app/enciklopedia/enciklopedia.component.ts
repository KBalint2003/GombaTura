import {Component, OnInit, } from '@angular/core';
import {NgForOf, SlicePipe} from "@angular/common";
import {HttpClient} from "@angular/common/http";
import {Gomba} from "./gomba";
import {EnciklopediaService} from "../enciklopedia.service";
import { FormsModule, ReactiveFormsModule} from "@angular/forms";
import { DecimalPipe } from '@angular/common';
import {NgbPaginationConfig, NgbPaginationModule, NgbTypeaheadModule} from '@ng-bootstrap/ng-bootstrap';



@Component({
  selector: 'app-enciklopedia',
  standalone: true,
  imports: [
    DecimalPipe,
    FormsModule,
    NgbTypeaheadModule,
    NgbPaginationModule,
    NgForOf,
    SlicePipe,
    ReactiveFormsModule
  ],
  templateUrl: './enciklopedia.component.html',
  styleUrl: './enciklopedia.component.css'
})
export class EnciklopediaComponent implements OnInit{

  constructor(protected http: HttpClient, protected enciklopediaService: EnciklopediaService, config: NgbPaginationConfig, ) {
  }



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
  gombakSlice: Gomba[] = []

  page = 0;
  pageSize = 2;


  ngOnInit() {
    this.refreshCountries()
    return this.http.get<Gomba>(this.enciklopediaService.gombaLekeres).subscribe((valasz: any) => {
      this.gombak = valasz.gombak
      this.gombakSlice = this.gombak.slice(
        (this.page - 1) * this.pageSize,
        (this.page - 1) * this.pageSize + this.pageSize
      )
    })
  }

  refreshCountries() {
    console.log(this.page)
    this.gombakSlice = this.gombak.slice(
      (this.page) * this.pageSize,
      (this.page) * this.pageSize + this.pageSize,
    );
    console.log(this.gombakSlice)
  }


}
