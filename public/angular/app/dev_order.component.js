System.register(['@angular/core', "./order.service", "@angular/router"], function(exports_1, context_1) {
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
    var core_1, order_service_1, router_1;
    var DevOrderComponent;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (order_service_1_1) {
                order_service_1 = order_service_1_1;
            },
            function (router_1_1) {
                router_1 = router_1_1;
            }],
        execute: function() {
            DevOrderComponent = class DevOrderComponent {
                constructor(order, router) {
                    this.order = order;
                    this.router = router;
                    this.ADD = false;
                    this.submitted = false;
                }
                ngOnInit() {
                    this.getOrderList();
                }
                getOrderList() {
                    this.order.getOrderList().subscribe(val => {
                        if (val.state == 1) {
                            this.list = val.data.orders;
                            this.dep = val.data.dep;
                            this.sup = val.data.sup;
                        }
                    });
                }
                runThread(id) {
                    let data = { 'thrId': id, 'op': 'runThread' };
                    this.order.run(data).subscribe(val => {
                        if (val.state != 1) {
                            alert(val.msg);
                        }
                    });
                }
                addOrder(data) {
                    this.order.addOrder(data).subscribe(val => {
                        if (val.state == 1) {
                            alert('新增成功');
                            this.ADD = false;
                            this.submitted = false;
                            this.runThread(val.data.thrId);
                            this.router.navigate(['../app/order']);
                        }
                        else {
                            alert('新增失败');
                            window.history.back();
                        }
                    });
                }
                onSubmit(data) {
                    this.submitted = true;
                    let info = { 'data': data, 'defId': 1, 'op': 'startProcess' };
                    this.addOrder(info);
                }
                cancel() {
                    this.ADD = false;
                    this.router.navigate(['../app/order']);
                }
            };
            DevOrderComponent = __decorate([
                core_1.Component({
                    selector: 'my-order',
                    templateUrl: '/public/angular/tpl/order.component.html'
                }), 
                __metadata('design:paramtypes', [order_service_1.OrderService, router_1.Router])
            ], DevOrderComponent);
            exports_1("DevOrderComponent", DevOrderComponent);
        }
    }
});
//# sourceMappingURL=dev_order.component.js.map