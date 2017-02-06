System.register(['@angular/core', "./allot.service", "@angular/router"], function(exports_1, context_1) {
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
    var core_1, allot_service_1, router_1;
    var AllotDetailComponent;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (allot_service_1_1) {
                allot_service_1 = allot_service_1_1;
            },
            function (router_1_1) {
                router_1 = router_1_1;
            }],
        execute: function() {
            AllotDetailComponent = class AllotDetailComponent {
                constructor(allotService, route, router) {
                    this.allotService = allotService;
                    this.route = route;
                    this.router = router;
                    this.submitted = false;
                }
                ngOnInit() {
                    this.route.params.forEach((params) => {
                        let id = params['id'];
                        this.getDetail(id);
                    });
                }
                getDetail(id) {
                    this.allotService.getDetail(id).subscribe(val => {
                        if (val.state == 1) {
                            this.allot = val.data.detail;
                            this.dev = val.data.dev;
                            this.dep = val.data.dep;
                        }
                    });
                }
                updateDetail(data) {
                    this.allotService.updateAllot(data).subscribe(val => {
                        if (val.state == 1) {
                            this.allot = val.data;
                            alert("更新成功");
                            this.router.navigate(['../app/allot']);
                        }
                        else {
                            alert("更新失败");
                            window.history.back();
                        }
                    });
                }
                onSubmit() {
                    this.submitted = true;
                    this.updateDetail(this.allot);
                }
                cancel() {
                    this.router.navigate(['../app/allot']);
                }
            };
            AllotDetailComponent = __decorate([
                core_1.Component({
                    selector: 'my-allot',
                    templateUrl: '/public/angular/tpl/allot_detail.component.html'
                }), 
                __metadata('design:paramtypes', [allot_service_1.AllotService, router_1.ActivatedRoute, router_1.Router])
            ], AllotDetailComponent);
            exports_1("AllotDetailComponent", AllotDetailComponent);
        }
    }
});
//# sourceMappingURL=allot_detail.component.js.map