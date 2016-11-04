<?php
namespace app\index\service;

use app\index\model\WorkflowNode;

class WorkflowNodService extends BaseService
{
    public function getNode($defId,$index)
    {
        $node = new WorkflowNode();
        $db = $node->where(['def_id'=>$defId,'node_index'=>$index])->find();
        if(empty($db)) return '';
        $info = $db->toArray();
        return $info;
    }

    public function getNodeById($id)
    {
        $node = new WorkflowNode();
        $db = $node->where(['id'=>$id])->find();
        if(empty($db)) return '';
        $info = $db->toArray();
        return $info;
    }

    public function getNodes($defId)
    {
        $node = new WorkflowNode();
        $db = $node->where(['def_id'=>$defId])->select();
        $info = $this->getArray($db);
        return $info;
    }
}