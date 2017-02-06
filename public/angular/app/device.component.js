System.register(['@angular/core', '@angular/router', "./device.service", "./device"], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __metadata = (this && this.__metadata) || function (k, v) {
        if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
    };
    var core_1, router_1, device_service_1, device_1;
    var DeviceComponent;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (router_1_1) {
                router_1 = router_1_1;
            },
            function (device_service_1_1) {
                device_service_1 = device_service_1_1;
            },
            function (device_1_1) {
                device_1 = device_1_1;
            }],
        execute: function() {
            DeviceComponent = class DeviceComponent {
                constructor(device, router, route) {
                    this.device = device;
                    this.router = router;
                    this.route = route;
                    this.devices = [];
                    this.ADD = false;
                    this.submitted = false;
                    this.active = true;
                    this.model = new device_1.Device();
                }
                getDevices() {
                    this.device.getDevices().subscribe(val => this.devices = val.data);
                }
                ngOnInit() {
                    this.getDevices();
                }
                addDevice() {
                    this.device.addDevice(this.model).subscribe(val => {
                        if (val.state == 1) {
                            alert('新增成功');
                            this.getDevices();
                            this.ADD = false;
                            this.submitted = false;
                        }
                        else {
                            alert(val.msg);
                        }
                        this.router.navigate(['../app/devices']);
                    });
                }
                cancel() {
                    this.ADD = false;
                    this.router.navigate(['../app/devices']);
                }
                gotoDetail() {
                    this.router.navigate(['../app/device/', this.selected.id]);
                }
                onSelect(device) {
                    this.selected = device;
                    this.gotoDetail();
                }
                getChoice() {
                    this.device.addDevice('').subscribe(val => {
                        this.maker = val.data.maker;
                        this.type = val.data.type;
                        this.router.navigate(['../app/devices']);
                    });
                }
                add() {
                    this.ADD = true;
                    this.getChoice();
                }
                onSubmit() {
                    this.submitted = true;
                    this.addDevice();
                }
            };
            DeviceComponent = __decorate([
                core_1.Component({
                    selector: 'app-device',
                    templateUrl: '/public/angular/tpl/device.html',
                    styleUrls: ['http://local.tp5.com/public/angular/css/hero.component.css'],
                    animations: [
                        core_1.trigger('flyInOut', [
                            core_1.state('in', core_1.style({ width: 120, transform: 'translateX(0)', opacity: 1 })),
                            core_1.transition('void => *', [
                                core_1.style({ width: 10, transform: 'translateX(50px)', opacity: 0 }),
                                core_1.group([
                                    core_1.animate('0.3s 0.1s ease', core_1.style({
                                        transform: 'translateX(0)',
                                        width: 120
                                    })),
                                    core_1.animate('0.3s ease', core_1.style({
                                        opacity: 1
                                    }))
                                ])
                            ]),
                            core_1.transition('* => void', [
                                core_1.group([
                                    core_1.animate('0.3s ease', core_1.style({
                                        transform: 'translateX(50px)',
                                        width: 10
                                    })),
                                    core_1.animate('0.3s 0.2s ease', core_1.style({
                                        opacity: 0
                                    }))
                                ])
                            ])
                        ])
                    ]
                }), 
                __metadata('design:paramtypes', [device_service_1.DeviceService, router_1.Router, router_1.ActivatedRoute])
            ], DeviceComponent);
            exports_1("DeviceComponent", DeviceComponent);
        }
    }
});
//# sourceMappingURL=device.component.js.map