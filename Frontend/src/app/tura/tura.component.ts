import {Component, OnInit, TemplateRef, inject, ViewChild} from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {FrissitettTura, Tura, Turak} from "./tura";
import {TuraService} from "../tura.service";
import { NgForOf, NgIf} from "@angular/common";
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import {FormsModule} from "@angular/forms";
import {FooterComponent} from "../footer/footer.component";
import {jwtDecode, JwtPayload} from "jwt-decode";
import {UserData} from "../felhasznaloAdatObj";
import {AuthService} from "../auth.service";

@Component({
  selector: 'app-tura',
  standalone: true,
  imports: [
    NgForOf,
    FormsModule,
    NgIf,
    FooterComponent,
  ],
  templateUrl: './tura.component.html',
  styleUrl: './tura.component.css'
})
export class TuraComponent implements  OnInit{

  constructor(protected http: HttpClient, protected turaservice: TuraService, protected authService: AuthService) {  }

  private modalService = inject(NgbModal);

  felhasznalo: UserData = {
    felhasznalonev: '',
    felhasznaloID: '',
    email: '',
    token: ''
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
    Jelentkezok: 0,
    Felhasznalonev: ''
  }
  turak: Tura[] = []

  Frisstura: FrissitettTura = {
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
    Jelentkezok: 0,
    Felhasznalonev: ''
  }

  tokenIDjson: any
  sajatTuraJeloles = false
  jelentkezettTuraJeloles = false
  jelentkezettTuraID: string[] = []
  elmarad = false
  ujTuraId = ''


  turaLetrehozasModal(turaLetrehozas: TemplateRef<any>) {
    this.modalService.open(turaLetrehozas, { ariaLabelledBy: 'turaLetrehozasModal' })
  }

  turaModositasModal(turaModositas: TemplateRef<any>, Tura_id: string) {
    this.modalService.open(turaModositas,  { ariaLabelledBy: 'turaModositasModal' })
    for (let i = 0; i < this.turak.length; i++) {
      if (this.turak[i].Tura_id == Tura_id) {
        Tura_id = this.turak[i].Tura_id
        console.log(Tura_id)
      }
    }
  }

  @ViewChild('SajatTura') SajatTura: any;
  @ViewChild('JelentkezettTura') JelentkezettTura: any;


  ngOnInit() {
    this.tokenIDjson = {"token" : localStorage.getItem('access')}
    if (!this.tokenIDjson.token) {
      console.error("Nincs token")
      return this.http.get<Turak>(this.turaservice.osszesturaLekeresRoute).subscribe((valasz:any) => {
        this.turak = valasz.turak
      })
    }
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.tokenIDjson.token
    });
    const dekodoltToken = jwtDecode(this.tokenIDjson.token) as JwtPayload & { felhasznalonev: string, userId: string }
    this.felhasznalo.felhasznalonev = dekodoltToken.felhasznalonev
    return this.http.get<Turak>(this.turaservice.osszesturaLekeresRoute, {headers}).subscribe((valasz:any) => {
      this.turak = valasz.turak
      this.jelentkezettTuraID = valasz.jelentkezettTurakId
      console.log(this.turak.length)
      console.log(this.jelentkezettTuraID)
      for (var i = 0; i < this.jelentkezettTuraID.length; i++) {
        console.log(this.jelentkezettTuraID[0])
      }
    })
  }

  onCheckBoxSajatChange() {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.tokenIDjson.token
    });
    this.sajatTuraJeloles = this.SajatTura.nativeElement.checked
    if (this.sajatTuraJeloles) {
      return this.http.get<Turak>(this.turaservice.turaLekeresRoute,{headers}).subscribe((valasz: any) => {
        this.turak = valasz.turak
      })
    }
    return this.http.get<Turak>(this.turaservice.osszesturaLekeresRoute, {headers}).subscribe((valasz:any) => {
      this.turak = valasz.turak
    })
  }

  onCheckBoxJelentkezettChange() {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.tokenIDjson.token
    });
    this.jelentkezettTuraJeloles = this.JelentkezettTura.nativeElement.checked
    if (this.jelentkezettTuraJeloles) {
      return this.http.get<Turak>(this.turaservice.jelentkezettTuraLekeresRoute, {headers}).subscribe((valasz: any) => {
        this.turak = valasz.turak
      }, error => {
        this.turaservice.turahiba = "Ön még nem jelentkezett egy túrára sem!"
      })
    }
      return this.http.get<Turak>(this.turaservice.osszesturaLekeresRoute, {headers}).subscribe((valasz: any) => {
        this.turak = valasz.turak
    })
  }

  jelentkezesGomb(Tura_id: string) {
    this.turaservice.jelentkezesTurara(Tura_id)
  }

  jelentkezesTorlesGomb(Tura_id: string) {
    this.turaservice.jelentkezesTorlese(Tura_id)
  }


  torlesgomb(Tura_id: string) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.authService.tokenIDjson.token
    });
    for (let i = 0; i < this.turak.length; i++) {
      if (Tura_id == this.turak[i].Tura_id) {
        this.elmarad = true
      }
    }
    return this.http.patch(this.turaservice.turaSzerkesztesRoute, {}, {headers}).subscribe((valasz: any) => {
      console.log("Sikeres törlés")
    })
  }

  protected readonly localStorage = localStorage;
}
