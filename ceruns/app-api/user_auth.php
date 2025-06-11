<?php

require_once 'init.php';

if ($_GET['action'] == 'login' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $checkEmail = $USAObj->checkEmail($Req['email']);
    if ($checkEmail) {
        $signInData = $USAObj->getUserDetailsInfo($checkEmail['id']);
        $hash = password_verify($Req['password'], $signInData['password']);
        if ($hash) {
            unset($signInData['password']);
            $Data = [
                'success' => true,
                'data' => $signInData
            ];
        } else {
            $Data = $PASS_ERR->WrongPassword();
        }
    } else {
        $Data = [
            'success' => false,
            'message' => 'Email_not_exist'
        ];
    }
} elseif ($_GET['action'] == 'register' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $checkEmail = $USAObj->checkEmail($Req['email']);
    if ($checkEmail) {
        $Data = [
            'success' => false,
            'message' => 'Email_exists'
        ];
    } else {
        $password = password_hash($Req['password'], PASSWORD_DEFAULT);
        $Req['jop_times'] = arrayToCommaString($Req['jop_times']);
        $Req['jop_titles'] = arrayToCommaString($Req['jop_titles']);
        $Req['password'] = $password;
        $res = $USAObj->register($Req);
        if ($res) {
            $signInData = $USAObj->getUserDetailsInfo($res);
            unset($signInData['password']);
            $Data = [
                'success' => true,
                'data' => $signInData
            ];
        } else {
            $Data = $SQL_ERR->RegisterSqlError();
        }
    }
}


echo json_encode($Data);
