<?php

namespace app\index\controller;
use app\index\service\UserService;
use think\Cookie;
use think\Request;

class User extends Base
{
    public function login(){

        $post = $this->getJson(Request::instance()->post());
//        var_dump($post);die;
        if(!isset($post['username']) || !isset($post['password'])) {
            return $this->ajaxFail('数据为空');
        }
        $name = $post['username'];
        $password = $post['password'];
        $user = new UserService();
        $id = $user->checkUser($name,$password);
        if(!empty($id)){
            $info = [
                'name'=>$name,
                'id'=>$id
            ];
            if(!Cookie::has('user')) {
                Cookie::set('user', $info);
            }
            return $this->ajaxSuccess();
        }
        return $this->ajaxFail('用户名或者密码错误');
    }

    public function index(){
        $user = new UserService();
        $info = $user->getUser();
        var_dump($info);die;
    }

    public function isLogin(){
        if(Cookie::has('user')){
           return $this->ajaxSuccess();
        }
        return $this->ajaxFail('请先登陆');
    }

    public function logout(){
       Cookie::delete('user');
        return $this->ajaxSuccess();
    }
}