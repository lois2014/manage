<?php
namespace app\index\service;

use app\index\model\WorkflowThread;

class WorkflowThrService extends BaseService
{
    public function addThread($data)
    {
        $thread = new WorkflowThread();
        $ids = $thread->allowField(true)->saveAll([0=>$data],false);
        return current($ids);
    }

    public function getThread($id)
    {
        $thread = new WorkflowThread();
        $db = $thread->where(['id'=>$id])->find();
        if(empty($db)) return '';
        return $db->toArray();
    }

    public function updateThread($data)
    {
        $thread = new WorkflowThread();
        if(!empty($data)) {
            $thread->update($data);
        }
        return true;
    }
}