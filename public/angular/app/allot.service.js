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
    var AllotService;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (base_service_1_1) {
                base_service_1 = base_service_1_1;
            }],
        execute: function() {
            AllotService = class AllotService {
                constructor(base) {
                    this.base = base;
                    this.listUrl = 'allot/list';
                    this.addUrl = 'allot/add';
                    this.updateUrl = 'allot/update';
                    this.detailUrl = 'allot/detail';
                }
                getAllot() {
                    return this.base.getData(this.listUrl);
                }
                addAllot(data) {
                    return this.base.postData(data, this.addUrl);
                }
                updateAllot(data) {
                    return this.base.postData(data, this.updateUrl);
                }
                getDetail(id) {
                    return this.base.postData({ 'id': id }, this.detailUrl);
                }
            };
            AllotService = __decorate([
                core_1.Injectable(), 
                __metadata('design:paramtypes', [base_service_1.BaseService])
            ], AllotService);
            exports_1("AllotService", AllotService);
        }
    }
});
//# sourceMappingURL=allot.service.js.map