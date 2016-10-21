<?php
namespace app\index\service;

use app\index\model\Allot;
use think\Db;

class AllotService extends BaseService
{
    public function getAllInfo()
    {
        $where = [
            'a.status'=>1,
            'd.status'=>1,
            'dep.status'=>1
        ];
        $info = Db::table('allot')
            ->alias('a')
            ->field('a.*,d.name dev_name,dep.name dep_name')
            ->join('device d','a.dev_id = d.id','left')
            ->join('department dep','dep.id = a.dep_id','left')
            ->where($where)
            ->select();

        return $info;
    }

    public function addAllot($data)
    {
//        $allot = Allot::create($data);
        $allot = new Allot($data);
        $res = $allot->allowField(true)->save($data);
        if(empty($allot)) return '';
        return $res;
    }

    public function updateAllot($data)
    {
        $allot = new Allot();
        $allot->allowField(true)->save($data,['id'=>$data['id']]);
        return $data;
    }

    public function getAllotById($id){
        $where = [
            'a.status'=>1,
            'd.status'=>1,
            'dep.status'=>1,
            'a.id'=>$id,
        ];
        $info = Db::table('allot')
            ->alias('a')
            ->field('a.id,a.dev_id,a.dep_id,a.type,a.master,a.remark,a.create_time,a.dev_usage,d.name dev_name,dep.name dep_name')
            ->join('device d','a.dev_id = d.id','left')
            ->join('department dep','dep.id = a.dep_id','left')
            ->where($where)
            ->find();
        return $info;
    }
}