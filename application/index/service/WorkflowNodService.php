<?php
namespace app\index\service;

use app\index\model\WorkflowNode;

class WorkflowNodService extends BaseService
{
    public function getNode($defId,$index,$field='')
    {
        $node = new WorkflowNode();
        if(!empty($field)){
            $node->field($field);
        }
        if(is_array($index)){
            $db = $node->where(['def_id'=>$defId,'index'=>['in',$index]])->select();
            $info = $this->getArray($db);
            return $info;
        }
        $db = $node->where(['def_id'=>$defId,'index'=>$index])->find();
        $info = $this->getArray($db);
        return $info;
    }


    public function getNodeById($id)
    {
        $node = new WorkflowNode();
        $db = $node->where(['id'=>$id])->find();
        if(empty($db)) return '';
        $info = $this->getArray($db);
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