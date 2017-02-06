System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var Device;
    return {
        setters:[],
        execute: function() {
            Device = class Device {
                constructor(id = null, name = '', type_id = null, //类型
                    version = '', //型号
                    code = '', //编号
                    maker_id = null, //设备商
                    master = '', //负责人
                    measure = '', //计量单位,
                    document = '' //文件
                    ) {
                    this.id = id;
                    this.name = name;
                    this.type_id = type_id;
                    this.version = version;
                    this.code = code;
                    this.maker_id = maker_id;
                    this.master = master;
                    this.measure = measure;
                    this.document = document;
                }
            };
            exports_1("Device", Device);
        }
    }
});
//# sourceMappingURL=device.js.map