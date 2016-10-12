<?php

namespace app\index\controller;

use app\index\service\DeviceService;
use app\index\service\SupplierService;
use app\index\service\TypeService;
use think\Cookie;
use think\Request;

class Device extends Base
{
    public function deviceList()
    {
        $post = json_decode(Request::instance()->getContent(),true);
        $page = isset($post['page'])?$post['page']:1;
        $pageSize = self::DEFAULT_PAGE;
        $start = ($page-1)*$pageSize;
        $device = new DeviceService();
        $info = $device->getDevices($start,$pageSize);
        return $this->ajaxSuccess($info);
    }

    public function add()
    {
        $post = json_decode(Request::instance()->getContent(),true);
        if(empty($post))
        {
            $sup = new SupplierService();
            $data['maker'] = $sup->getSuppliers();
            $type = new TypeService();
            $data['type'] = $type->getTypes();
            return $this->ajaxSuccess($data);
        }
        $device = new DeviceService();
        if(!Cookie::has('user')){
            return $this->ajaxFail('请登录');
        }
        $user = Cookie::get('user');
//        var_dump($user);die;
        $uid =$user['id'];
        $post['user_id'] = $uid;
        $post['last_user'] = $uid;
        $post = $this->checkData($post);
        if(!is_array($post)){
            return $this->ajaxFail($post);
        }
        $id = $device->addDevice($post);
        if(!$id) return $this->ajaxFail('新增失败');
        return $this->ajaxSuccess(['id'=>$id]);
    }

    public function checkData($data)
    {
        foreach ($data as $key=>&$item){
            if($key == 'id') continue;
            $item = trim($item);
            if(empty($item)){
                $msg = '数据不能为空!';
                return $msg;
            }
        }
        if(strlen($data['measure'])>50){
            $msg = '单位名太长!';
            return $msg;
        }
        return $data;
    }

    public function detail()
    {
        $post = json_decode(Request::instance()->getContent(),true);
        $device = new DeviceService();
        $info = $device->getDevice($post['id']);
        if(empty($info)){
            return $this->ajaxFail('设备不存在');
        }
        return $this->ajaxSuccess($info);
    }
}