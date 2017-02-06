System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var Common;
    return {
        setters:[],
        execute: function() {
            Common = class Common {
                constructor(title = '首页', subTitle = '') {
                    this.title = title;
                    this.subTitle = subTitle;
                }
            };
            exports_1("Common", Common);
        }
    }
});
//# sourceMappingURL=common.js.map