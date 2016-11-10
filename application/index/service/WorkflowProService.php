<?php
namespace app\index\service;

use app\index\model\WorkflowProcess;
use think\Db;

class WorkflowProService extends BaseService
{

    public function addProcess($data)
    {

        $ids = Db::table('workflow_process')->insertGetId($data);
        if(empty($ids)) return [];
        return $ids;
    }

    public function getProcess($id)
    {
        $process = new WorkflowProcess();
        $db = $process->where(['id'=>$id,'state'=>1])->find();
        if(empty($db)) return [];
        return $db->toArray();
    }

    public function updateProcess($data)
    {
        $process = new WorkflowProcess();
        if(!empty($data)){
            $process->update($data);
        }
        return true;
    }
}