import { Component,OnInit } from '@angular/core' ;
import { UserService } from './user.service';
import { Router } from '@angular/router';

declare var __moduleName: string;
@Component({
    selector: 'my-home',
    moduleId: __moduleName,
    templateUrl:'/public/angular/tpl/home.component.html',
    styleUrls:[`
        'http://local.tp5.com/public/angular/css/app.component.css',
`],
    providers:[
        UserService
    ],
})

export class HomeComponent {

    title = '设备管理';
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