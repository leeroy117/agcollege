import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from 'src/app/@components/shared/dialog/dialog.component';
import { Product } from 'src/app/models/product';
import { ProductService } from 'src/app/services/product.service';



@Component({
  selector: 'app-sales',
  templateUrl: './sales.component.html',
  styleUrls: ['./sales.component.css']
})
export class SalesComponent implements OnInit {
  titleCustomerButton = 'Agregar cliente';
  titleProductButton = 'Agregar producto';
  salesTitle = 'Generar venta';
  dialogTitle = 'Desea salir?';
  products = [];
  constructor(public dialog: MatDialog, private productService: ProductService) {
    this.getProducts();
  }

  ngOnInit(): void {
  }

  openDialog(): void {
    const dialogRef = this.dialog.open(DialogComponent, {
      width: '350px',
      height: '120px',
      data: '¿Desea salir de la venta?'
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        window.location.href = '/listado_ventas';
      }
    });
  }

  getProducts() {
    // tslint:disable-next-line: deprecation
    this.productService.getProducts().subscribe((productsFromTheAPI: any) => {
      this.products = productsFromTheAPI.productos;

      console.log(this.products);
    }, (err: any) => {
      console.error(err);
    });
  }

}
