<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'     => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],

    '/' => 'index/Index/index',
    'heroes' => 'index/Index/dashboard',
    'user' => 'index/User/index',
    'user/isLogin' => 'index/User/isLogin',
    'user/login' => 'index/User/login',
    'user/logout' => 'index/User/logout',
    'device/add' => 'index/Device/add',
    'device/list' => 'index/Device/deviceList',
    'device/detail' => 'index/Device/detail',
    'device/update' => 'index/Device/update',
    'allot/list' => 'index/Allot/getList',
    'allot/add' => 'index/Allot/add',
    'allot/update' => 'index/Allot/update',
    'allot/detail' => 'index/Allot/detail',
    'order/add' => 'index/Order/add',
    'order/list' => 'index/Order/orderList',
    'order/del' => 'index/Order/del',
    'workflow/run' => 'index/Workflow/run',
];
