<?php

namespace app\index\controller;

use think\Config;
use think\Controller;
use think\View;

class Base extends Controller
{
    public $view;

    const DEFAULT_PAGE = 10;

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

    public function setCode()
    {
        $time=substr(date('Y'),2).date('m').date("d");
        $code = $time.substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%02d', rand(0, 99));
        return $code;
    }
}