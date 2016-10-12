import { Component,OnInit } from '@angular/core' ;
import { UserService } from './user.service';
import { Router } from '@angular/router';

declare var __moduleName: string;
@Component({
    selector: 'my-home',
    moduleId: __moduleName,
    template:`
      <h1>{{title}}</h1>
      <button (click)="logout()">Logout</button>
      <nav>
        <a routerLink="/app/dashboard" routerLinkActive="active">Dashboard</a>
        <a routerLink="/app/heroes" routerLinkActive="active">Heroes</a>
        <a routerLink="/app/devices" routerLinkActive="active">Devices</a>
      </nav>
      <router-outlet></router-outlet>
    `,
    styleUrls:[`
        'http://local.tp5.com/public/angular/css/app.component.css',
`],
    providers:[
        UserService
    ],
})

export class HomeComponent {
    title = ' Tour of heroes';

    constructor(private user:UserService){}

    logout(){
        this.user.logout().subscribe(val=>{
            if(val.state == 1){
                alert('注销成功');
            }else{
                alert('注销失败');
            }
            location.reload();
        });
    }
}