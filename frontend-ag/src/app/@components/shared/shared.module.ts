import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TitleComponent } from '../core/title/title.component';
import { TableComponent } from './table/table.component';
import { KeysPipe } from 'src/app/pipes/keys.pipe';
import { PaginationComponent } from './pagination/pagination.component';
import { DialogComponent } from './dialog/dialog.component';
import { MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { ModalComponent } from './modal/modal.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';


@NgModule({
  declarations: [TitleComponent, TableComponent, KeysPipe, PaginationComponent, DialogComponent,
    ModalComponent],
  imports: [
    CommonModule,
    MatDialogModule,
    MatButtonModule,
    NgbModule
  ],
  exports: [
    TitleComponent,
    TableComponent,
    PaginationComponent,
    DialogComponent,
    ModalComponent
  ],
})
export class SharedModule { }
