import { Component,OnInit } from '@angular/core' ;

declare var __moduleName: string;
@Component({
    selector: 'my-app',
    moduleId: __moduleName,
    template:`
      <router-outlet></router-outlet>
    `
})

export class AppComponent{
    title = ' Tour of heroes';
}