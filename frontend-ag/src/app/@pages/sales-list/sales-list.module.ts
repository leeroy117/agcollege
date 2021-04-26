import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SalesListRoutingModule } from './sales-list-routing.module';
import { SalesListComponent } from './sales-list.component';
import { SaleService } from '../../services/sale.service';
import { SharedModule } from 'src/app/@components/shared/shared.module';
import { KeysPipe } from 'src/app/pipes/keys.pipe';
import { MatButtonModule } from '@angular/material/button';


@NgModule({
  declarations: [SalesListComponent],
  imports: [
    CommonModule,
    SharedModule,
    MatButtonModule,
    SalesListRoutingModule
  ],
  providers: [
    SaleService
  ]
})
export class SalesListModule { }
