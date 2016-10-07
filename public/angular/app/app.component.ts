import { Component,OnInit } from '@angular/core' ;
import { UserService } from './user.service';
import { Router } from '@angular/router';

declare var __moduleName: string;
@Component({
    selector: 'my-app',
    moduleId: __moduleName,
    template:`
         <nav>
            <router-outlet></router-outlet>
         </nav>  
    `,
    styleUrls:[`
        'http://local.tp5.com/public/angular/css/app.component.css',
`],
    providers:[
        UserService
    ],
})

export class AppComponent implements OnInit{
    title = ' Tour of heroes';
    info : any;

    constructor( private user:UserService,
                 private router:Router
    ){}

    ngOnInit():void{
        this.user.checkLogin().subscribe(d=>{
            if(d.state == 0) {
                alert(d.msg);
            }
        });
    }
}