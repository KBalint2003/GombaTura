import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class EnciklopediaService {

  constructor(protected http: HttpClient) { }

  public gombaLekeres = "http://localhost:3000/enciklopedia";



}
