<?php

require_once 'init.php';
if ($_GET['action'] == 'GetAllUsersByJopID' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    $data = $users->GetAllUsersByJopID($Req['id']);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['data'] = [];
        $Data['error'] = 'noContent';
        $Data['success'] = false;
    }
}

echo json_encode($Data);
