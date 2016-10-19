import { Component,Input,OnInit } from '@angular/core';
import {ActivatedRoute, Params, Router} from '@angular/router';

import {DeviceService} from "./device.service";
declare var __moduleName: string;
@Component({
    selector: 'my-hero-detail',
    moduleId: __moduleName,
    templateUrl: '/public/angular/tpl/device_detail.component.html',
    styleUrls: [
        'http://local.tp5.com/public/angular/css/app.component.css',
    ]
})

export class DeviceDetailComponent implements OnInit{
    @Input()
    dev:any;

    submitted = false;
    active = true;
    model:any;

    constructor(private device:DeviceService,
                private route:ActivatedRoute,
                private router:Router
    ){
        this.dev = null;
    }

    getDevice(id:number)
    {
        this.device.getDetail(id).subscribe(val=>{
            if(val.state == 1){
                this.dev = val.data;
            }else{
                alert(val.msg);
            }
        });
    }

    ngOnInit():void{
        this.route.params.forEach((params:Params)=>{
            let id = +params['id'];
            this.getDevice(id);
        });
    }

    updateDevice(data:any){
        // alert(data.name);
        this.device.updateDevice(data).subscribe(val=>{
             if(val.state == 1){
                 alert('更新成功');
                 this.submitted = false;
             }else{
                 alert(val.msg);
                 window.history.back();
             }
         });
    }

    onSubmit()
    {
        this.submitted = true;
        this.updateDevice(this.dev);
        this.router.navigate(['../app/devices']);
    }

    goBack()
    {
        window.history.back();
    }
}