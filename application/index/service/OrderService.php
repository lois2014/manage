<?php
namespace app\index\service;


use app\index\model\Order;

class OrderService extends BaseService
{
    private function setOrderNo(){
        $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
        $orderSn = $yCode[(intval(date('Y')) - 2011)%10] . strtoupper(dechex(date('m'))) . date('d') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%02d', rand(0, 99));
        return $orderSn;
    }
    public function addOrder($data)
    {
        $order = new Order();
        $data['order_no'] = $this->setOrderNo();
        $ids = $order->allowField(true)->saveAll([0=>$data],false);
        if(empty($ids)) return '';
        return current($ids);
    }
    public function getOrder()
    {
        $where = [
            'o.status'=>1,
            'sup.status'=>1,
            'dep.status'=>1
        ];
        $list = Db::table('order')
            ->alias('o')
            ->field('o.*,sup.name sup_name,dep.name dep_name')
            ->join('supplier','sup','sup.id = o.sup_id','left')
            ->join('department','dep','dep.id = o.dep_id','left')
            ->where($where)
            ->select();
        return $list;
    }
}