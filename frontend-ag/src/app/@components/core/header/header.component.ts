import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent {

  toggledValue = true;
  @Output() toggledChange = new EventEmitter<boolean>();
  toggled() {
    if (this.toggledValue === undefined) {
      this.toggledValue = true;
    }
    this.toggledValue = !this.toggledValue;
    console.log(this.toggledValue);
    this.toggledChange.emit(this.toggledValue);
  }
}
