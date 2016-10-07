<?php

namespace app\index\controller;
use app\index\service\UserService;
class User extends Base
{
    public function login(){
        if(!isset($_POST['username'])) {
            return $this->ajaxFail('数据为空');
        }
        if(!isset($_POST['password'])) {
            return $this->ajaxFail('数据为空');
        }
        $name = $_POST['username'];
        $password = $_POST['password'];
        $user = new UserService();
        $id = $user->checkUser($name,$password);
        if(!empty($id)){
            $info = [
                'name'=>$name,
                'id'=>$id
            ];
            $_COOKIE['user'] = $info;
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
        if(isset($_COOKIE['user']) && !empty($_COOKIE['user'])){
           return $this->ajaxSuccess();
        }
        return $this->ajaxFail('请先登陆');
    }

    public function logout(){
        $_COOKIE['user'] = '';
        return $this->ajaxSuccess();
    }
}