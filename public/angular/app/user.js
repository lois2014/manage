System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var User;
    return {
        setters:[],
        execute: function() {
            User = class User {
                constructor(id, name, password) {
                    this.id = id;
                    this.name = name;
                    this.password = password;
                }
                ;
            };
            exports_1("User", User);
        }
    }
});
//# sourceMappingURL=user.js.map