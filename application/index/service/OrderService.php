<?php
namespace app\index\service;


use app\index\model\DevOrder;
use app\index\model\Order;
use think\Db;

class OrderService extends BaseService
{
    private function setOrderNo(){
        $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
        $orderSn = $yCode[(intval(date('Y')) - 2011)%10] . strtoupper(dechex(date('m'))) . date('d') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%02d', rand(0, 99));
        return $orderSn;
    }
    public function addOrder($data)
    {
        $order = new DevOrder();
        $data['order_no'] = $this->setOrderNo();
        $db = $order->allowField(true)->saveAll([0=>$data],false);
        if(empty($db)) return [];
        $info = $this->getArray($db);
        return $info;
    }
    public function getOrder($class,$status=1)
    {
        $where = [
            'ord.status'=>$status,
            'sup.status'=>1,
            'dep.status'=>1,
            'd.handler'=>$class
        ];
//        $list = Db::Query('SELECT sup.name sup_name,dep.name dep_name, FROM supplier sup , department dep , s WHERE sup.status = 1');
        $list = Db::table('dev_order')
            ->alias('ord')
            ->field('ord.*,sup.name sup_name,dep.name dep_name,u.username,w.name as status_name')
            ->join('supplier sup','ord.sup_id = sup.id','left')
            ->join('department dep','ord.dep_id = dep.id','left')
            ->join('user u','u.id = ord.user_id','left')
            ->join('workflow_node w','w.index = ord.order_status','left')
            ->join('workflow_definition d','d.id = w.def_id','left')
            ->where($where)
            ->order('ord.create_time DESC')
//            ->fetchSql(true)
            ->select();
//        var_dump($list);die;
        return $list;
    }

    public function getOrderById($id)
    {
        $db = DevOrder::get($id);
        if(empty($db)) return [];
        return $db->toArray();
    }

    public function updateOrder($data)
    {
        if(empty($data['id'])) return '';
        $order = new DevOrder();
        $num = $order->update($data);
        return $data['id'];
    }
}