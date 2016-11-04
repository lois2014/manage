<?php
namespace app\index\service;
use think\Cookie;

class WorkflowService extends BaseService
{
    private $defination;
    private $process;
    private $nodes;
    private $thread;
    private $input;
    private $handler;
    private $node;

    const THREAD_UNRECIEVED = 0;
    const THREAD_RECIEVED = 1;
    const THREAD_COMPLETED = 2;


    public function __constructor($input)
    {
        $this->input = $input;
    }

    public function listDefination()
    {
        $def = new WorkflowDefService();
        return $def->getDefinationList();
    }

    public function initProcess($defId)
    {
        $def = new WorkflowDefService();
        $this->defination = $def->getDefination($defId);
        $this->handler = $this->defination['handler'];
        $node = new WorkflowNodService();
        $this->nodes = $node->getNodes($defId);
        $data=[
            'def_id'=>$this->defination['id'],
            'description'=>'运行业务'.$this->handler,
            'node_index'=>0
        ];
        $user = Cookie::get('user');
        $data['start_user'] = $user['name'];
        $pro = new WorkflowProService();
        $id = $pro->addProcess($data);
        $this->process = $pro->getProcess($id);
        return $id;
    }

    public function startProcess()
    {
        $this->call_func($this->handler,$this->defination['start_function'],$this->process);
        $this->initThread(1);
        return;
    }

    public function initThread($nodeIndex)
    {
        $nodes = array_column($this->nodes,null,'node_index');
        if(isset($nodes[$nodeIndex])){
            $node = $this->node = $nodes[$nodeIndex];
            $pro = new WorkflowProService();
            $thread = new WorkflowThrService();
            $data=['node_index'=>$nodeIndex,'id'=>$this->process['id'],'executor'=>$node['executor']];
            $pro->updateProcess($data);
            $this->process['node_index'] = $nodeIndex;
            $this->process['executor'] = $node['executor'];

            switch($node['type']){
                case '1':
                    $data=[
                        'pro_id'=>$this->process['id'],
                        'pro_desc'=>$this->process['description'],
                        'node_id'=>$node['id'],
                        'node_name'=>$node['name'],
                        'executor'=>$node['executor'],
                        'max_day'=>$node['max_day']
                    ];
                    $id = $thread->addThread($data);
                    $info = $thread->getThread($id);
                    if(isset($info['state'])){
                        if($info['state'] == self::THREAD_RECIEVED){
                            $this->call_func($this->handler,$this->defination['run_function'],['process'=>$this->process,'node'=>$node,'thread'=>$info]);
                        }
                    }

                    break;
            }
        }
        return ;
    }

    public function runThread($threadId)
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
                $data = [
                    'id'=>$threadId,
                    'state'=>self::THREAD_RECIEVED
                ];
                $thrService->updateThread($data);
                $thread['state'] = self::THREAD_RECIEVED;
                $this->call_func($this->handler,$this->defination['run_function'],['process'=>$process,'node'=>$node,'thread'=>$thread]);
                break;
        }
        return;
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
                    'pro_desc'=>$process['description'],
                    'node_id'=>$node['id'],
                    'node_name'=>$node['name'],
                    'executor'=>$node['executor'],
                    'max_day'=>$node['max_day']
                ];
                $thrService->updateThread($data);
                $thread = $thrService->getThread($threadId);
                $this->call_func($this->handler,$this->defination['run_function'],['process'=>$process,'node'=>$node,'thread'=>$thread]);
                break;
        }
        return;
    }

    public function transitThread($threadId,$nextNodeId)
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
                    'state'=>self::THREAD_COMPLETED
                ];
                $thrService->updateThread($data);
                $thread = $thrService->getThread($threadId);
                $this->call_func($this->handler,$this->defination['transit_function'],['process'=>$process,'node'=>$node,'thread'=>$thread,'nextNodeId'=>$nextNodeId]);
                break;
        }
        return ;

    }

    public function endProcess()
    {

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