import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class TuraService {

  constructor(private http: HttpClient) { }

  public turaLekeresRoute = "http://localhost:3000/turak/osszes"
  public turaJelentkezesRoute = "http://localhost:3000/turak"
  public turaLetrehozasRoute = "http://localhost:3000/turak"
  public turaSzerkesztesRoute = "http://localhost:3000/turak"
  public turaTorlesRoute = "http://localhost:3000/turak"




}
