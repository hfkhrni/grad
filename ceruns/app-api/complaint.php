<?php

require_once 'init.php';

if ($_GET['action'] == 'SubmitComplaint' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = $complaintObj->AddComplaint($Req);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'wrong happened';
        $Data['success'] = false;
    }
}
echo json_encode($Data);
