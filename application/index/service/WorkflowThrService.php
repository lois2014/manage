<?php
namespace app\index\service;

use app\index\model\WorkflowThread;
use think\Db;
class WorkflowThrService extends BaseService
{

    public function addThread($data)
    {
        $id = Db::table('workflow_thread')->insertGetId($data);
        return $id;
    }

    public function getThread($id)
    {
        $db = WorkflowThread::get($id);
        if(empty($db)) return [];
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

    public function deleteGreater($defId,$index)
    {
        $nodeIds = Db::table('workflow_node')->field('id')
            ->where(['def_id'=>$defId,'index'=>['>',$index]])
            ->select();
        if(empty($nodeIds)) return 0;
        $info = Db::table('workflow_thread')
            ->where('node_id','in',array_column($nodeIds,'id'))
            ->update(['state'=>3]);
        return $info;
    }

}