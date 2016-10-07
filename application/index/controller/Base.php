<?php

namespace app\index\controller;

use think\Config;
use think\Controller;
use think\View;

class Base extends Controller
{
    public $view;

    public function _initialize()
    {
        $this->view = new View([],Config::get('view_replace_str'));
    }

    public function ajaxSuccess($data=''){
        $return = ['state'=>1,'msg'=>'','data'=>''];
        if(!empty($data)){
            $return['data'] = $data;
        }
        return json_encode($return);
    }

    public function ajaxFail($msg){
        $return=[
            'state'=>0,
            'msg'=>$msg,
            'data'=>''
        ];
        return json_encode($return);
    }
}