import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'frontend-ag';
  toggledValue = true;

  toggled($event) {
    console.log('admin', $event);
    this.toggledValue = $event;
  }

}
