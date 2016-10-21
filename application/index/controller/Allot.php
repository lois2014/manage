<?php

namespace app\index\controller;

use app\index\service\AllotService;
use app\index\service\DepartmentService;
use app\index\service\DeviceService;
use think\Cookie;
use think\Request;

class Allot extends Base
{
    public function getList()
    {
        $service = new AllotService();
        $data['allot'] = $service->getAllInfo();
        $dep = new DepartmentService();
        $dev = new DeviceService();

        $data['dep'] = $dep->getDep();
        $data['dev'] = $dev->getDevices('','',false);
        return $this->ajaxSuccess($data);
    }

    public function add()
    {
        $json = Request::instance()->getContent();
        $post = json_decode($json,true);
        if(empty($post)){
            return $this->ajaxFail('无数据');
        }
        $service = new AllotService();
        $device = new DeviceService();
        if(isset($post['dev_id'])){
            $dev = $device->getDevice($post['dev_id']);
            if(empty($dev)){
                return $this->ajaxFail('设备不存在');
            }
        }
        $user = Cookie::get('user');
        $post['user_id'] = $user['id'];
        $res = $service->addAllot($post);
        if(empty($res)){
            return $this->ajaxFail('新增失败');
        }
        return $this->ajaxSuccess();
    }

    public function update()
    {
        $json = Request::instance()->getContent();
        $post = json_decode($json,true);
        if(empty($post)){
            return $this->ajaxFail('无数据');
        }
        if(!isset($post['access_status']))
        {
            $post['access_status'] = 2;
        }
        $service = new AllotService();
        $res = $service->updateAllot($post);
        if(!$res){
            return $this->ajaxFail('更新失败');
        }
        return $this->ajaxSuccess();
    }

    public function detail()
    {
        $json = Request::instance()->getContent();
        $post = json_decode($json,true);
//        $post = $_POST;
        if(empty($post)){
            return $this->ajaxFail('无数据');
        }
        $service = new AllotService();
        $info = $service->getAllotById($post['id']);
        $dep = new DepartmentService();
        $dev = new DeviceService();
        $data['detail'] = $info;
        $data['dep'] = $dep->getDep();
        $data['dev'] = $dev->getDevices('','',false);
        return $this->ajaxSuccess($data);
    }
}