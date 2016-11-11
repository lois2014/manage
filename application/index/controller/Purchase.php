<?php

namespace app\index\controller;

use app\index\service\OrderService;
use app\index\service\DepartmentService;
use app\index\service\SupplierService;
use app\index\service\WorkflowNodService;
use app\index\service\WorkflowProService;
use app\index\service\WorkflowThrService;
use think\Request;
use think\Cookie;

class Purchase extends Base
{
    static function create(){
        static $instance ;
        if (!$instance){
            $instance = new Purchase();
        }
        return $instance;
    }

    public function start($process)
    {
        $proService = new WorkflowProService();

        $json = Request::instance()->getContent();
        $post = json_decode($json,true);
//        $post = $_POST;
        if(isset($post['data'])&&!empty($post['data'])){
            $ser = new OrderService();
            $post = $post['data'];
            $user = Cookie::get('user');
            if(empty($user)) return $this->ajaxFail('未登录');
            $post['user_id'] = $user['id'];
            $log['reason'] = $post['reason'];
            $log['memo'] = $post['memo'];
            unset($post['reason']);
            unset($post['memo']);
            $info = $ser->addOrder($post);
            $info = current($info);
            $data=['id'=>$process['id'],'context'=>$info['id'],'des'=>'开始Purchase'];
            $proService->updateProcess($data);
            return true;
        }
        return false;
    }

    public function init($data)
    {
//        var_dump($data);die;
        $data['node'] = $this->getField($data['node'],['id','index','next_index','name']);
        return $this->ajaxSuccess(['thrId'=>$data['thread']['id']]);
//        extract($data);
//        if(isset($thread) && isset($process) && isset($node))
//        {
//            $data = [
//                'thrId'=>$thread['id']
//            ];
////            var_dump($data);die;
//            return $this->ajaxSuccess($data);
//        }
//        return $this->ajaxFail('数据错误');
    }

    public function run($data)
    {
        extract($data);
        if(isset($thread) && isset($process) && isset($node))
        {
            $return = $this->check($thread);
            if($return !== true){
                return $this->ajaxFail($return);
            }

            $id = (int)$process['context'];
            $ordService = new OrderService();
            $order['id'] = $id;
            $order['order_status'] = $process['node_index'];
//            var_dump($order);die;
            $ordService->updateOrder($order);

            $nextNodes=explode(',',$node['next_index']);
            $nodService = new WorkflowNodService();
            $nodes = $nodService->getNode($process['def_id'],$nextNodes,['id','index','name']);
            $data = [
                'thrId'=>$thread['id'],
                'nextNodes'=>$nodes,
                'process'=>$process
            ];
            $return = $this->ajaxSuccess($data);
            return $return;
//            var_dump($return);die;

        }
        return $this->ajaxFail('数据错误');
    }

    public function check($thread)
    {

        $start = strtotime($thread['receive_time']);
        $end = time();
        $thrService = new WorkflowThrService();
        if(($end-$start)/86400 > $thread['max_day']){
            $thread['state'] = 3;
            $thread['finish_time'] = date('Y-m-d H:i:s');
            $thrService->updateThread($thread);
           return '超时';
        }

        if(!Cookie::has('user')){
            $info  =  self::jsonFail('请登录');
            var_dump($info);die;
        }
        $user = Cookie::get('user');
        $executor = json_decode($thread['executor'],true);
        if(isset($executor['user'])){
            $ids = explode(',',$executor['user']);
            if(is_array($ids) && in_array($user['id'],$ids)){
                return true;
            }
            if($ids == $user['id']){
                return true;
            }
        }
        $info = '无权限';
       return $info;
    }

    public function save()
    {
        return true;
    }
    public function transit($data)
    {
        extract($data);
        if(isset($process) && isset($thread) && isset($node))
        {

        }
        return true;
    }

    public function getField($data,$field)
    {
        foreach ($data as $key=> &$value){
            if(!in_array($key,$field)){
                unset($data[$key]);
            }
        }
        return $data;
    }

    //1-待审核，2-待购置, 3-待验收，4-待确认，5-待入库, 6-入库
    public function orderList()
    {
        $service = new OrderService();
        $info = $service->getOrder(__CLASS__);
        var_dump($info);die;
        $data['orders'] = $info;
        $dep = new DepartmentService();
        $sup = new SupplierService();
        $data['dep'] = $dep->getDep();
        $data['sup'] = $sup->getSuppliers();
        return $this->ajaxSuccess($data);
    }
}
