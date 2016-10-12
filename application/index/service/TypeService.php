<?php
namespace  app\index\service;

use app\index\model\Type;

class TypeService extends BaseService
{
    public function getTypes()
    {
        $type = new Type();
        $db = $type->where('status',1)->select();
        $info = $this->getArray($db);
        return $info;
    }
}