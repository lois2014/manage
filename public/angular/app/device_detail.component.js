System.register(['@angular/core', '@angular/router', "./device.service"], function(exports_1, context_1) {
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
    var core_1, router_1, device_service_1;
    var DeviceDetailComponent;
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
            }],
        execute: function() {
            DeviceDetailComponent = class DeviceDetailComponent {
                constructor(device, route, router) {
                    this.device = device;
                    this.route = route;
                    this.router = router;
                    this.submitted = false;
                    this.active = true;
                    this.dev = null;
                }
                getDevice(id) {
                    this.device.getDetail(id).subscribe(val => {
                        if (val.state == 1) {
                            this.dev = val.data;
                        }
                        else {
                            alert(val.msg);
                        }
                    });
                }
                ngOnInit() {
                    this.route.params.forEach((params) => {
                        let id = +params['id'];
                        this.getDevice(id);
                    });
                }
                updateDevice(data) {
                    // alert(data.name);
                    this.device.updateDevice(data).subscribe(val => {
                        if (val.state == 1) {
                            alert('更新成功');
                            this.submitted = false;
                        }
                        else {
                            alert(val.msg);
                            window.history.back();
                        }
                    });
                }
                onSubmit() {
                    this.submitted = true;
                    this.updateDevice(this.dev);
                    this.router.navigate(['../app/devices']);
                }
                goBack() {
                    window.history.back();
                }
            };
            __decorate([
                core_1.Input(), 
                __metadata('design:type', Object)
            ], DeviceDetailComponent.prototype, "dev", void 0);
            DeviceDetailComponent = __decorate([
                core_1.Component({
                    selector: 'my-hero-detail',
                    moduleId: __moduleName,
                    templateUrl: '/public/angular/tpl/device_detail.component.html',
                    styleUrls: [
                        'http://local.tp5.com/public/angular/css/app.component.css',
                    ]
                }), 
                __metadata('design:paramtypes', [device_service_1.DeviceService, router_1.ActivatedRoute, router_1.Router])
            ], DeviceDetailComponent);
            exports_1("DeviceDetailComponent", DeviceDetailComponent);
        }
    }
});
//# sourceMappingURL=device_detail.component.js.map