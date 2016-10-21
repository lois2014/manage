import {Component, OnInit} from '@angular/core';
import {AllotService} from "./allot.service";
import {Router, ActivatedRoute, Params} from "@angular/router";

@Component({
    selector: 'my-allot',
    templateUrl: '/public/angular/tpl/allot.component.html'
})

export class AllotComponent implements OnInit{

    constructor(private allotService:AllotService,
                private router:Router,
                private route:ActivatedRoute
    ){}

    private list:any;
    private dep:any;
    private dev:any;
    private selected:any;

    ADD=false;
    active = true;
    Submitted = false;

    ngOnInit(){
        this.getAllot();
    }

    getAllot(){
        this.allotService.getAllot().subscribe(val=>{
            if(val.state == 1){
                this.list = val.data.allot;
                this.dev = val.data.dev;
                this.dep = val.data.dep;
            }else{
                this.list = [];
            }
        });
    }

    onSelect(val:any){
        this.selected = val;
        this.router.navigate(['../app/allot',this.selected.id]);
    }

    update(data:any){
       this.allotService.updateAllot(data).subscribe(val=>{
               if(val.state==1){
                   alert('操作成功');
                   this.getAllot();
                   this.router.navigate(['../app/allot']);
               }else{
                   alert(val.msg);
                   window.history.back();
               }
           });
    }

    pass(val:any,status:number){
        val.access_status = status;
        let set = {'id':val.id,'access_status':val.access_status};
        this.update(set);
    }



    addAllot(data:any)
    {
        this.allotService.addAllot(data).subscribe(val=>{
            if(val.state == 1){
                alert('新增成功');
                this.getAllot();
                this.router.navigate(['../app/allot']);
            }else{
                alert(val.msg);
                window.history.back();
            }
        });
    }

    onSubmit(val:any){
        this.Submitted = true;
         this.addAllot(val);
    }
    cancel(){
        this.ADD = false;
    }
}