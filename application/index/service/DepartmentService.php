<?php

namespace app\index\service;

use app\index\model\Department;

class DepartmentService extends BaseService
{
    public function getDep()
    {
        $dep = new Department();
        $db = $dep->where('status',1)->select();
        $info = $this->getArray($db,['id','name']);
        return $info;
    }
}