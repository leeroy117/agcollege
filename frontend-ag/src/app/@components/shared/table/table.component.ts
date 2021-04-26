import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})
export class TableComponent implements OnInit {
  @Input() headers: [];
  @Input() data: [];

  constructor() {
    // this.getValues();
    // console.log(this.data, 'table');
  }

  ngOnInit(): void {
  }

  // getValues() {
  //   const data = this.data;
  //   // for (let index = 0; index < data.length; index++) {
  //   //   const element = data[index];
  //   //   console.log(element);

  //   // }
  // }

}
