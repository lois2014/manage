import { Component,OnInit } from '@angular/core' ;
import { UserService } from './user.service';
import { Router } from '@angular/router';

declare var __moduleName: string;
@Component({
    selector: 'my-app',
    moduleId: __moduleName,
    template:`
           <router-outlet></router-outlet>
    `,
    styleUrls:[`
        'http://local.tp5.com/public/angular/css/app.component.css',
`],
    providers:[
        UserService
    ],
})

export class AppComponent{
    title = ' Tour of heroes';
}