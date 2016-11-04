<?php
namespace app\index\service;

use app\index\model\WorkflowDefination;

class WorkflowDefService extends BaseService
{
    public function getDefination($id)
    {
        $def = new WorkflowDefination();
        $db = $def->where(['id'=>$id])->find();
        $info = $db->toArray();
        return $info;
    }

    public function getDefinationList()
    {
        $def = new WorkflowDefination();
        $db = $def->where(['status'=>1])->select();
        $info = $this->getArray($db);
        return $info;
    }
}