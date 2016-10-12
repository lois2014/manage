export class Device{
    constructor(
        public id:number=null,
        public name:string='',
        public type_id:number=null,//类型
        public version:string='',//型号
        public code:string='',//编号
        public maker_id:number=null,//设备商
        public master:string='',//负责人
        public measure:string=''//计量单位
    ){}
}