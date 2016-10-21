<?php
namespace app\index\service;

use app\index\model\Device;

class DeviceService extends BaseService
{

    public function getDevices($start='',$limit='',$all=true)
    {
        $device = new Device();
        if(!empty($start)){
            $db = $device->where('status',1)->limit($start,$limit)->select();
        }else{
            $db = $device->where('status',1)->select();
        }
        $info = $this->getArray($db);
        if($all){
            $typeService = new TypeService();
            $type = array_column($typeService->getTypes(),'type_name','id');
            foreach ($info as &$item){
                $item['type_name']=$type[$item['type_id']];
            }

            $sup = new SupplierService();
            $makers = array_column($sup->getSuppliers(),'name','id');
            foreach ($info as &$item){
                $item['maker_name']=$makers[$item['maker_id']];
            }
        }
        return $info;
    }

    public function addDevice($data)
    {
        $res = Device::create($data);
        return $res->id;
    }

    public function addDevices($data)
    {
        $device = new Device();
        $ids = $device->allowField(true)->saveAll($data,false);
        return $ids;
    }

    public function getDevice($id)
    {
        $device = new Device();
        $db = $device->where('status',1)->where('id',$id)->find();
        if(empty($db)) return '';
        $info = $db->toArray();
        $typeService = new TypeService();
        $types = $typeService->getTypes();
        $type = array_column($types,'type_name','id');
        $info['type_name']=$type[$info['type_id']];
        $sup = new SupplierService();
        $maker = $sup->getSuppliers();
        $makers = array_column($maker,'name','id');
        $info['maker_name']=$makers[$info['maker_id']];
        $info['makers'] = $maker;
        $info['types'] = $types;
        return $info;
    }

    public function updateDevice($data)
    {
        $device = new Device();
        $device->allowField(true)->save($data,['id'=>$data['id']]);
        return $data;
    }
}