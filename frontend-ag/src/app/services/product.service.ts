import { Injectable } from '@angular/core';
import { Global } from './global';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Product } from '../models/product';


@Injectable({
    providedIn: 'root'
})
export class ProductService {
    baseURL: string = Global.apiUrl + 'productos';
    constructor(private http: HttpClient) {

    }

    getProducts(): Observable<Product> {
        const url = this.baseURL;
        return this.http.get<Product>(this.baseURL);
    }
}
