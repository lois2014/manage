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
        $ids = $order->allowField(true)->saveAll([0=>$data],false);
        if(empty($ids)) return '';
        return current($ids);
    }
    public function getOrder()
    {
        $where = [
            'ord.status'=>1,
            'sup.status'=>1,
            'dep.status'=>1
        ];
//        $list = Db::Query('SELECT sup.name sup_name,dep.name dep_name, FROM supplier sup , department dep , s WHERE sup.status = 1');
        $list = Db::table('dev_order')
            ->alias('ord')
            ->field('ord.*,sup.name sup_name,dep.name dep_name,u.username')
            ->join('supplier sup','ord.sup_id = sup.id','left')
            ->join('department dep','ord.dep_id = dep.id','left')
            ->join('user u','u.id = ord.user_id','left')
            ->where($where)
//            ->fetchSql(true)
            ->select();
//        var_dump($list);die;
        return $list;
    }

    public function updateOrder($data)
    {
        if(empty($id)) return '';
        $order = new DevOrder();
        $order->update($data);
        return $id;
    }
}