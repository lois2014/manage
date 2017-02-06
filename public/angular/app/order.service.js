System.register(['@angular/core', "./base.service"], function(exports_1, context_1) {
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
    var core_1, base_service_1;
    var OrderService;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (base_service_1_1) {
                base_service_1 = base_service_1_1;
            }],
        execute: function() {
            OrderService = class OrderService {
                constructor(base) {
                    this.base = base;
                    this.listUrl = 'order/list';
                    this.addUrl = 'workflow/run';
                    this.runUrl = 'workflow/run';
                }
                getOrderList() {
                    return this.base.getData(this.listUrl);
                }
                addOrder(data) {
                    return this.base.postData(data, this.addUrl);
                }
                run(data) {
                    return this.base.postData(data, this.runUrl);
                }
            };
            OrderService = __decorate([
                core_1.Injectable(), 
                __metadata('design:paramtypes', [base_service_1.BaseService])
            ], OrderService);
            exports_1("OrderService", OrderService);
        }
    }
});
//# sourceMappingURL=order.service.js.map