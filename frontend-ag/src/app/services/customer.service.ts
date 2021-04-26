import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Global } from './global';
import { Customer } from '../models/customer';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {
  baseUrl: string = Global.apiUrl + 'clientes';

  constructor(private http: HttpClient) { }

  getCustomers(): Observable<Customer> {
    return this.http.get<Customer>(this.baseUrl);
  }

}
