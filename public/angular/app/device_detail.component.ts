import { Component,Input,OnInit } from '@angular/core';
import {ActivatedRoute, Params, Router} from '@angular/router';
import { Location } from '@angular/common';

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
                alert(this.dev.name);
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

    onSubmit()
    {
        this.submitted = false;
        alert('update');
    }
}