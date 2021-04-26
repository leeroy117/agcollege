import { Component, OnInit } from '@angular/core';
import { Sale } from 'src/app/models/sale';
import { SaleService } from '../../services/sale.service';

@Component({
  selector: 'app-sales-list',
  templateUrl: './sales-list.component.html',
  styleUrls: ['./sales-list.component.css']
})
export class SalesListComponent implements OnInit {
  salesListTitle = 'Lista de ventas';
  salesHeaders = ['id_venta', 'nombre', 'apellidos', 'total', 'fecha'];
  sales: Sale[];
  message: string;
  constructor(private saleService: SaleService) { }

  ngOnInit(): void {
    this.getSales();
  }

  getSales() {
    // tslint:disable-next-line: deprecation
    this.saleService.getSales().subscribe((productsFromTheAPI: any) => {
      this.sales = productsFromTheAPI.ventas;
      this.message = productsFromTheAPI.message;
      console.log(this.sales);
      console.log(this.message);
    }, (err: any) => {
      console.error(err);
    });
  }

}
