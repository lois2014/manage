import {Component, OnInit} from '@angular/core';
import {OrderService} from "./order.service";
import {Router} from "@angular/router";

@Component({
    selector: 'my-order',
    templateUrl:'/public/angular/tpl/order.component.html'
})

export class DevOrderComponent implements OnInit
{
    list : any;
    dep:any;
    sup:any;

    ADD = false;
    submitted = false;

    constructor(private order:OrderService,
                private router:Router
    ){}

    ngOnInit(){
        this.getOrderList();
    }

    getOrderList(){
        this.order.getOrderList().subscribe(val=>{
            if(val.state == 1) {
                this.list = val.data.orders;
                this.dep = val.data.dep;
                this.sup = val.data.sup;
            }
        });
    }

    addOrder(data:any){
        this.order.addOrder(data).subscribe(val=>{
           if(val.state == 1){
               alert('新增成功');
               this.ADD = false;
               this.router.navigate(['../app/order']);
           }else{
               alert('新增失败');
               window.history.back();
           }
        });
    }

    onSubmit(data:any)
    {
        this.submitted = true;
        this.addOrder(data);
    }

    cancel()
    {
        this.ADD = false;
        this.router.navigate(['../app/order']);
    }
}