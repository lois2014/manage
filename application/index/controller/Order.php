<?php
namespace app\index\controller;

use app\index\service\OrderService;
use think\Cookie;
use think\Request;

class Order extends Base
{
    public function add()
    {
//        $json = Request::instance()->getContent();
//        $post = json_decode($json,true);
        $post = $_POST;
        if(empty($post)){
            return $this->ajaxFail('数据为空');
        }
        $user = Cookie::get('user');
//        if(empty($user)) return $this->ajaxFail('未登录');
        $post['user_id'] = 1;
        $ser = new OrderService();
        $id = $ser->addOrder($post);

        if(empty($id)){
            return $this->ajaxFail('新增失败');
        }
        return $this->ajaxSuccess();
    }

    public function orderList()
    {
        
    }
}