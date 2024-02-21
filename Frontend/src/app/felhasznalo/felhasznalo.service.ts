import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {felhasznaloAdatObj} from "../felhasznaloAdatObj";
import {Observable, tap} from "rxjs";
import {signupObj} from "../signupObj";

@Injectable({
  providedIn: 'root'
})
export class FelhasznaloService {

  constructor(private  http: HttpClient) { }

  private eleresiUt = "http://localhost:3000/";

  adatMentes(felhasznaloAdat: felhasznaloAdatObj): Observable<felhasznaloAdatObj> {
    return this.http.patch<felhasznaloAdatObj>(this.eleresiUt, felhasznaloAdat);
  }

  profiltorles(felhasznalonev: signupObj): Observable<signupObj> {
    const url = `${this.eleresiUt}/${felhasznalonev}`;
    return this.http.delete<signupObj>(url);
  }

}
