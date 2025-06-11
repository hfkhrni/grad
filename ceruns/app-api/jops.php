<?php
require_once 'init.php';
if ($_GET['action'] == 'AddJops' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $Req['jop_times'] = arrayToCommaString($Req['jop_times']);
    $data = $jopObj->AddJops($Req);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'someErrorHappen';
        $Data['success'] = false;
    }
} elseif ($_GET['action'] == 'GetJops' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    $data = $jopObj->GetJops($Req);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'someErrorHappen';
        $Data['success'] = false;
    }
}
echo json_encode($Data);
