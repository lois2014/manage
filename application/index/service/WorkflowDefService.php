<?php
namespace app\index\service;

use app\index\model\WorkflowDefinition;

class WorkflowDefService extends BaseService
{
    public function getDefinition($id)
    {
        $info = WorkflowDefinition::get($id);
        if(empty($info)) return [];
        return $info->toArray();
    }

    public function getDefinitionList()
    {
        $def = new WorkflowDefinition();
        $db = $def->where(['status'=>1])->select();
        $info = $this->getArray($db);
        return $info;
    }
}