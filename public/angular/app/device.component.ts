import {Component, OnInit, style, state, animate, group, transition, trigger} from '@angular/core';
import {Router, ActivatedRoute} from '@angular/router';
import {DeviceService} from "./device.service";
import {Device} from "./device";

@Component({
    selector: 'app-device',
    templateUrl:'/public/angular/tpl/device.component.html',
    styleUrls:['http://local.tp5.com/public/angular/css/hero.component.css'],
    animations: [
        trigger('flyInOut', [
            state('in', style({width: 120, transform: 'translateX(0)', opacity: 1})),
            transition('void => *', [
                style({width: 10, transform: 'translateX(50px)', opacity: 0}),
                group([
                    animate('0.3s 0.1s ease', style({
                        transform: 'translateX(0)',
                        width: 120
                    })),
                    animate('0.3s ease', style({
                        opacity: 1
                    }))
                ])
            ]),
            transition('* => void', [
                group([
                    animate('0.3s ease', style({
                        transform: 'translateX(50px)',
                        width: 10
                    })),
                    animate('0.3s 0.2s ease', style({
                        opacity: 0
                    }))
                ])
            ])
        ])
    ]
})

export class DeviceComponent implements OnInit{

    private devices=[];
    public selected:any;
    model:Device;
    type:any;
    maker:any;

    private ADD = false;

    submitted = false;

    active = true;

    constructor(private device:DeviceService,
                private router:Router,
                private route: ActivatedRoute,
    ){
        this.model = new Device();
    }

    getDevices(){
        this.device.getDevices().subscribe(val=>this.devices=val.data);
    }

    ngOnInit(){
        this.getDevices();
    }

    addDevice(){
        this.device.addDevice(this.model).subscribe(val=>{
            if(val.state == 1){
                alert('新增成功');
                this.getDevices();
                this.ADD = false;
                this.submitted = false;
            }
            else{
               alert(val.msg);
            }
            this.router.navigate(['../app/devices']);
        });
    }

    cancel(){
        this.ADD = false;
        this.router.navigate(['../app/devices']);
    }

    gotoDetail(){
        this.router.navigate(['../app/device/',this.selected.id]);
    }

    onSelect(device:any){
        this.selected = device;
    }

    getChoice(){
        this.device.addDevice('').subscribe(val=>{
                this.maker = val.data.maker;
                this.type = val.data.type;
                this.router.navigate(['../app/devices']);
            }
        );
    }

    add(){
        this.ADD = true;
        this.getChoice();
    }

    onSubmit(){
        this.submitted = true;
        this.addDevice();
    }

}