<?php
namespace app\index\service;
use think\Cookie;

class WorkflowService extends BaseService
{
    private $definition;
    private $process;
    private $nodes;
    private $thread;
    private $input;
    private $handler;
    private $node;

    const THREAD_UNRECEIVED = 0;
    const THREAD_RECEIVED = 1;
    const THREAD_COMPLETED = 2;

    public function _constructor($input){
        $this->input = $input;
    }

    public function definitionList()
    {
        $def = new WorkflowDefService();
        return $def->getDefinitionList();
    }

    public function initProcess($defId)
    {
        $def = new WorkflowDefService();
        $this->definition = $def->getDefinition($defId);
        $this->handler = $this->definition['handler'];
        $node = new WorkflowNodService();
        $this->nodes = $node->getNodes($defId);
        $data=[
            'def_id'=>(int)$this->definition['id'],
            'des'=>'新建',
            'node_index'=>'0'
        ];
//        $user = Cookie::get('user');
        $data['start_user'] = 'qzz';

        $info=$data;
//        var_dump($info);die;
        $pro = new WorkflowProService();
        $id = $pro->addProcess($info);
//        var_dump($id);die;
        $this->process = $pro->getProcess($id);
        return $id;
    }

    public function startProcess()
    {
        $ctrl = new \app\index\controller\Base();
        $return = $ctrl->call_func($this->handler,'start',$this->process);
        if($return == false) return false;
        return $this->initThread(1);
    }

    public function initThread($nodeIndex)
    {
        $nodes = array_column($this->nodes,null,'index');
//        var_dump($nodes);die;
        if(isset($nodes[$nodeIndex])){
            $node = $this->node = $nodes[$nodeIndex];
//            var_dump($node);die;
            $pro = new WorkflowProService();
            $thread = new WorkflowThrService();
            $data=['node_index'=>$nodeIndex,'id'=>$this->process['id'],'des'=>'初始化'.$this->handler];
            $pro->updateProcess($data);
            $this->process['node_index'] = $nodeIndex;
            switch($node['type']){
                case '1':
                    $data=[
                        'pro_id'=>$this->process['id'],
                        'pro_desc'=>$this->process['des'],
                        'node_id'=>$node['id'],
                        'node_name'=>$node['name'],
                        'executor'=>$node['executor'],
                        'max_day'=>$node['max_day']
                    ];
                    $id = $thread->addThread($data);
                    $info = $thread->getThread($id);
                    $ctrl = new \app\index\controller\Base();
                    $return = $ctrl->call_func($this->handler,$node['init_function'],['thread'=>$info,'node'=>$node,'process'=>$this->process]);
                    break;
            }
        }
        return isset($return)?$return:false;
    }

    public function runThread($threadId)
    {
        $thrService = new WorkflowThrService();
        $proService = new WorkflowProService();
        $nodService = new WorkflowNodService();
        $thread = $thrService->getThread($threadId);
//        var_dump($thread);die;
        if(empty($thread)) return false;

        $proId = $thread['pro_id'];
        $process = $proService->getProcess($proId);
        $nodeId = $thread['node_id'];
        $node = $nodService->getNodeById($nodeId);

        $def = new WorkflowDefService();
        $this->definition = $def->getDefinition($node['def_id']);
        $this->handler = $this->definition['handler'];
        switch($node['type']){
            case '1':
                $data = [
                    'id'=>$threadId,
                    'state'=>self::THREAD_RECEIVED,
                    'receive_time'=>date('Y-m-d H:i:s')
                ];
                $thrService->updateThread($data);
                $thread = $thrService->getThread($threadId);
                $param=['process'=>$process,'node'=>$node,'thread'=>$thread];
                $ctrl = new \app\index\controller\Base();
                $return =  $ctrl->call_func($this->handler,$node['run_function'],$param);
//                var_dump($return);die;
                break;
        }
        return isset($return)?$return:false;
    }

    public function saveThread($threadId)
    {

        $thrService = new WorkflowThrService();
        $proService = new WorkflowProService();
        $nodService = new WorkflowNodService();

        $thread = $thrService->getThread($threadId);
        if(empty($thread)) return false;
        $proId = $thread['pro_id'];
        $process = $proService->getProcess($proId);
        $nodeId = $thread['node_id'];
        $node = $nodService->getNodeById($nodeId);

        switch($node['type']){
            case '1':
                $data=[
                    'id'=>$threadId,
                    'pro_id'=>$process['id'],
                    'pro_desc'=>$process['des'],
                    'node_id'=>$node['id'],
                    'node_name'=>$node['name'],
                    'executor'=>$node['executor'],
                    'max_day'=>$node['max_day']
                ];
                $thrService->updateThread($data);
                $thread = $thrService->getThread($threadId);
                $param = ['process'=>$process,'node'=>$node,'thread'=>$thread];
                $ctrl = new \app\index\controller\Base();
                $return = $ctrl->call_func($this->handler,$node['run_function'],$param);
                break;
        }
        return isset($return)?$return:false;
    }

    public function transitThread($threadId,$nextNodeIndex)
    {
        $thrService = new WorkflowThrService();
        $proService = new WorkflowProService();
        $nodService = new WorkflowNodService();

        $thread = $thrService->getThread($threadId);
        if(empty($thread)) return false;
        $proId = $thread['pro_id'];
        $process = $proService->getProcess($proId);
        $nodeId = $thread['node_id'];
        $defId = $process['def_id'];
        $node = $nodService->getNodeById($nodeId);
        switch($node['type']){
            case '1':
                if($nextNodeIndex<$node['index']){
                    $thrService->deleteGreater($defId,$nextNodeIndex);
                }else {
                    $data = [
                        'id' => $threadId,
                        'state' => self::THREAD_COMPLETED
                    ];
                    $thrService->updateThread($data);
                    $thread = $thrService->getThread($threadId);
                    $ctrl = new \app\index\controller\Base();
                    $ctrl->call_func($this->handler,$node['transit_function'],['process'=>$process,'node'=>$node,'thread'=>$thread,'nextNodeIndex'=>$nextNodeIndex]);
                }
                $this->initProcess($defId);
                $return = $this->initThread($nextNodeIndex);
                break;
        }
        return isset($return)?$return:false;

    }

    public function endProcess($id)
    {
        $proService = new WorkflowProService();
        $data =[
            'id'=>$id,
            'state'=>2
        ];
        $proService->updateProcess($data);
        return true;
    }

    public function listMyProcess()
    {

    }

    public function listMyThread()
    {

    }

    public function viewProcess()
    {

    }
}