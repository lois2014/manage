<?php
namespace app\index\service;
use app\index\model\User;

class UserService extends BaseService
{
    public function getUser()
    {
        $user = new User();
        $db = $user->where('status',1)
            ->select();
        $info = [];
        foreach ($db as $item){
            $data=$item->visible(['id','username'])->toArray();
            $info[]['name']=$data['username'];
        }

        return $info;
    }

    public function checkUser($name,$password)
    {
        $user = new User();
        $info = $user->where('status',1)->where('username',$name)->where('password',md5($password))->find();
        $id = $info->get('id');
        return $id;
    }
}