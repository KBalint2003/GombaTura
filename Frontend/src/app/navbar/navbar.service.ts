import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {loginObj} from "../loginObj";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class NavbarService {

  constructor(private http: HttpClient) { }

  private eleresiUt = "http://localhost:3000/login";

  kijelentkezes(felhasznalo: loginObj): Observable<loginObj> {
    return this.http.delete<loginObj>(this.eleresiUt)
  }

}
