import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class TuraService {

  constructor(private http: HttpClient) { }

  private turaLekeresRoute = "http://localhost:3000/turaGET"
  private turaJelentkezesRoute = "http://localhost:3000/turaPOST"
  private turaLetrehozasRoute = "http://localhost:3000/turaPUT"
  private turaSzerkesztesRoute = "http://localhost:3000/turaPATCH"
  private turaTorlesRoute = "http://localhost:3000/turaDELETE"

  


}
