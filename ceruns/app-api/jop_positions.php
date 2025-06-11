<?php
require_once 'init.php';
if ($_GET['action'] == 'getAllJopPositions' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    $data = $jopPositionsObj->getAllJopPositions();
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'someErrorHappen';
        $Data['success'] = false;
    }
}
echo json_encode($Data);
