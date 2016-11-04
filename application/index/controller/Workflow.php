<?php
namespace app\index\controller;

use app\index\service\WorkflowService;

class Workflow extends Base
{
    private $input;

    public function _initialize()
    {
        parent::_initialize();
        $json = Request::instance()->getContent();
        $this->input = $post = json_decode($json,true);

    }

    public function run()
    {
        $post = $this->input;
        $service = new WorkflowService();

        switch($post['op']){
            case 'startProcess':
                $service->initProcess($post['defId']);
                $service->startProcess();break;
            case 'runThread':$service->runThread($post['thrId']);break;
            case 'saveThread':$service->saveThread($post['thrId']);break;
            case 'transitThread':$service->transitThread($post['thrId'],$post['nextNodeId']);break;
        }
    }


}