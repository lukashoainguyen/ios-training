import { Component, Directive, ElementRef, Input } from '@angular/core';

@Directive({
	selector: '[myDirective]'
})

export class myDirective {
	@Input('myDirective') color:string;

	constructor(public el:ElementRef) {}

	ngOnInit() {
		this.highLight(this.color);
	}

	highLight(color:string) {
		this.el.nativeElement.style.color = color;
		console.log(color);
	}
}

@Component({
  selector: 'app-root',
  template: `
  	<div [myDirective]="'red'">Demo text</div>
  `,
  // templateUrl: './app.component.html',
  // styleUrls: ['./app.component.css']
})

export class AppComponent {
  title = 'app';
  name:string = 'lukas';

  getConsole(name) {
    console.log(name);
  }
}
