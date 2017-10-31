import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  /*template: `
    <p>This is my app</p>
    <form (ngSubmit)="getConsole(name)">
      <input [(ngModel)]="name" name="myName">
      <button type="submit">Gui</button>
      <pre>
        {{ name }}
      </pre>
    </form>
  `,*/
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';
  name:string = 'lukas';

  getConsole(name) {
    console.log(name);
  }
}
