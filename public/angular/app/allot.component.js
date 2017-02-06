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
    var AllotComponent;
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
            AllotComponent = class AllotComponent {
                constructor(allotService, router, route) {
                    this.allotService = allotService;
                    this.router = router;
                    this.route = route;
                    this.ADD = false;
                    this.active = true;
                    this.Submitted = false;
                }
                ngOnInit() {
                    this.getAllot();
                }
                getAllot() {
                    this.allotService.getAllot().subscribe(val => {
                        if (val.state == 1) {
                            this.list = val.data.allot;
                            this.dev = val.data.dev;
                            this.dep = val.data.dep;
                        }
                        else {
                            this.list = [];
                        }
                    });
                }
                onSelect(val) {
                    this.selected = val;
                    this.router.navigate(['../app/allot', this.selected.id]);
                }
                update(data) {
                    this.allotService.updateAllot(data).subscribe(val => {
                        if (val.state == 1) {
                            alert('操作成功');
                            this.getAllot();
                            this.router.navigate(['../app/allot']);
                        }
                        else {
                            alert(val.msg);
                            window.history.back();
                        }
                    });
                }
                pass(val, status) {
                    val.access_status = status;
                    let set = { 'id': val.id, 'access_status': val.access_status };
                    this.update(set);
                }
                addAllot(data) {
                    this.allotService.addAllot(data).subscribe(val => {
                        if (val.state == 1) {
                            alert('新增成功');
                            this.getAllot();
                            this.router.navigate(['../app/allot']);
                        }
                        else {
                            alert(val.msg);
                            window.history.back();
                        }
                    });
                }
                onSubmit(val) {
                    this.Submitted = true;
                    this.addAllot(val);
                }
                cancel() {
                    this.ADD = false;
                }
            };
            AllotComponent = __decorate([
                core_1.Component({
                    selector: 'my-allot',
                    templateUrl: '/public/angular/tpl/allot.component.html'
                }), 
                __metadata('design:paramtypes', [allot_service_1.AllotService, router_1.Router, router_1.ActivatedRoute])
            ], AllotComponent);
            exports_1("AllotComponent", AllotComponent);
        }
    }
});
//# sourceMappingURL=allot.component.js.map