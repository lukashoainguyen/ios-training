import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
  	<input type="text"  />
    <pre>
      {{ data | json }}
    </pre>
  `,
})

export class AppComponent {
  title = 'app';

  data:any = {
    name: "lukas"
  };
}
