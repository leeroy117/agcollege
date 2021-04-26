import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SalesRoutingModule } from './sales-routing.module';
import { SalesComponent } from './sales.component';
import { SharedModule } from 'src/app/@components/shared/shared.module';
import { MatButtonModule } from '@angular/material/button';
import { ProductService } from 'src/app/services/product.service';

@NgModule({
  declarations: [SalesComponent],
  imports: [
    CommonModule,
    SharedModule,
    MatButtonModule,
    SalesRoutingModule
  ],
  providers: [
    ProductService,

  ]
})
export class SalesModule { }
