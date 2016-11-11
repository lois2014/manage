<?php
namespace app\index\controller;

use app\index\service\WorkflowService;
use think\Request;
use think\Cookie;
class Workflow extends Base
{
    private $input;

    public function _initialize()
    {
        parent::_initialize();


    }

    public function run()
    {
        $json = Request::instance()->getContent();
        $post = json_decode($json,true);
        $post = $_POST;
        if(empty($post)){
            return $this->ajaxFail('数据为空');
        }
//        var_dump($post);die;
//        $user = Cookie::get('user');
//        if(empty($user)) return $this->ajaxFail('未登录');
        $post['user_id'] = 1;
        $service = new WorkflowService();
        $service->_constructor($post);
        $return = $this->ajaxSuccess();
        switch($post['op']){
            case 'startProcess':
                $service->initProcess($post['defId']);
                $return = $service->startProcess();
                break;
            case 'runThread':$return=$service->runThread($post['thrId']); break;
            case 'definitionList':$info = $service->definitionList();$return = $this->ajaxSuccess($info); break;
            case 'saveThread':$return = $service->saveThread($post['thrId']);break;
            case 'transitThread':$return = $service->transitThread($post['thrId'],$post['nextNodeId']);break;
        }
        if($return == false) $return = $this->ajaxFail('流程错误');
        return $return;
    }

}