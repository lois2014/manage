<?php
namespace app\index\service;

use app\index\model\WorkflowProcess;

class WorkflowProService extends BaseService
{

    public function addProcess($data)
    {
        $process = new WorkflowProcess();
        $ids = $process->saveAll($data,false);
        return current($ids);
    }

    public function getProcess($id)
    {
        $process = new WorkflowProcess();
        $db = $process->where(['id'=>$id])->select();
        return $this->getArray($db);
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