<?php
namespace app\index\controller;

use app\index\service\OrderService;
use app\index\service\DepartmentService;
use app\index\service\SupplierService;
use think\Cookie;
use think\Request;

class Order extends Base
{
    public function add()
    {
        $json = Request::instance()->getContent();
        $post = json_decode($json,true);
//        $post = $_POST;
        if(empty($post)){
            return $this->ajaxFail('数据为空');
        }
        $user = Cookie::get('user');
        if(empty($user)) return $this->ajaxFail('未登录');
        $post['user_id'] = $user['id'];
        $ser = new OrderService();
        $log['reason'] = $post['reason'];
        $log['memo'] = $post['memo'];
        unset($post['reason']);
        unset($post['memo']);
        $id = $ser->addOrder($post);

        if(empty($id)){
            return $this->ajaxFail('新增失败');
        }
        return $this->ajaxSuccess();
    }

    //1-待审核，2-待购置, 3-待验收，4-待确认，5-待入库, 6-入库
    public function orderList()
    {
        $service = new OrderService();
        $info = $service->getOrder('Purchase');
//        var_dump($info);die;
        foreach($info as &$item){
            $name='';
//            var_dump($item['order_status']);die;
            switch($item['order_status']){
                case '1':$name='待审核';break;
                case '0':$name='新建';break;
                case '2':$name='待购置';break;
                case '3':$name='待验收';break;
                case '4':$name='待确认';break;
                case '5':$name='待入库';break;
                case '6':$name='入库';break;
            }
            $item['status_name'] = $name;
        }
        $data['orders'] = $info;
        $dep = new DepartmentService();
        $sup = new SupplierService();
        $data['dep'] = $dep->getDep();
        $data['sup'] = $sup->getSuppliers();
        return $this->ajaxSuccess($data);
    }

    public function del()
    {
//        $json = Request::instance()->getContent();
//        $post = json_decode($json,true);
        $post = $_POST;
        if(empty($post)){
            return $this->ajaxFail('数据为空');
        }
        $service = new OrderService();
        $post['status'] = 0;
        $res = $service->updateOrder($post);
        if(empty($res)){
            return $this->ajaxFail('删除失败');
        }
        return $this->ajaxSuccess('删除成功');
    }
}