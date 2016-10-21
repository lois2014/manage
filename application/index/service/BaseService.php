<?php

namespace app\index\service;

class BaseService{

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

}