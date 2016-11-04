<?php

namespace app\index\service;
use think\Model;
use app\index\controller;

class BaseService extends Model{

    public function getArray($model,$field='')
    {
        if(empty($model)){
            return [];
        }
        $info =[];
        if(!empty($field)){
            foreach ($model as $item){
                $data=$item->visible($field)->toArray();
                $info[]=$data;
            }
        }else{
            foreach ($model as $item){
                $data=$item->toArray();
                $info[]=$data;
            }
        }
        return $info;
    }

    public function call_func($className,$func,$data='')
    {
        $class = new $className();
        if(method_exists($class,$func)) {
            if(!empty($data)){
                return $class->$func($data);
            }
            return $class->$func();
        }else{
            throw new \think\Exception('方法不存在', 100006);
        }
    }

}