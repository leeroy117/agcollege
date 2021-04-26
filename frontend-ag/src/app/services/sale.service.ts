import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Sale } from '../models/sale';
import { Global } from './global';

@Injectable({
  providedIn: 'root'
})
export class SaleService {
  baseUrl: string = Global.apiUrl + 'ventas';
  constructor(private http: HttpClient) {

  }

  getSales(): Observable<Sale> {
    return this.http.get<Sale>(this.baseUrl);
  }
}
