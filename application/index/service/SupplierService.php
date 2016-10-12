<?php
namespace app\index\service;

use app\index\model\Supplier;

class SupplierService extends BaseService
{
    public function getSuppliers()
    {
        $supplier = new Supplier();
        $db = $supplier->where('status',1)->select();
        $info = $this->getArray($db);

        return $info;
    }
}