<?php

namespace app\index\controller;

use app\index\service\WorkflowProService;
use think\Request;

class Purchase extends Base
{
    private $purchase;
    public function start($process)
    {
        $this->purchase = $process;
        return true;
    }

    public function init($data)
    {
        extract($data);
        if(isset($process) && isset($node) && isset($thread))
        {
            return true;
        }
        return false;
    }

    public function run()
    {
        return true;
    }

    public function save()
    {
        return true;
    }
    public function transit($data)
    {
        return true;
    }
}
