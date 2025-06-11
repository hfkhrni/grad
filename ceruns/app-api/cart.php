<?php

require_once 'init.php';
if ($_GET['action'] == 'Get_Cart_NUM' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $mo = $cartObj->checkIFIHaveCart(2, $user_init['id'], 0);
    $data = $cartObj->Get_Cart_NUM($mo);
    if ($data || $data == 0) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'someErrorHappen';
        $Data['success'] = false;
    }
} elseif ($_GET['action'] == 'Add_TO_Cart' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $mo = $cartObj->checkIFIHaveCart(0, $user_init['id'], $Req);
    $mo_touch = $cartObj->checkIFIHaveCart(1, $user_init['id'], $Req);
    if ($mo) {
        $data = $cartObj->Add_TO_Cart($Req, $mo);
        if ($data) {
            $Data['data'] = $data;
            $Data['success'] = true;
        } else {
            $Data['error'] = 'this_product_is_already_in_cart';
            $Data['success'] = false;
        }
    } else {
        if ($mo_touch) {
            $Data['error'] = 'You can\'t add products to more than one facility';
            $Data['success'] = false;
        } else {
            $mo_touch_2 = $cartObj->addNewCart($user_init['id'], $Req);
            $data = $cartObj->Add_TO_Cart($Req, $mo_touch_2);
            if ($data) {
                $Data['data'] = $data;
                $Data['success'] = true;
            } else {
                $Data['error'] = 'this_product_is_already_in_cart';
                $Data['success'] = false;
            }
        }

    }
} elseif ($_GET['action'] == 'Update_Quantity' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $mo = $cartObj->checkIFIHaveCart(2, $user_init['id'], 0);
    $data = $cartObj->Update_Quantity($Req, $mo);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'wrong happened';
        $Data['success'] = false;
    }
} elseif ($_GET['action'] == 'Get_Cart' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $mo = $cartObj->checkIFIHaveCart(2, $user_init['id'], 0);
    $data = $cartObj->Get_Cart($mo);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'NO CART FOUND';
        $Data['success'] = false;
    }
} elseif ($_GET['action'] == 'Delete_From_Cart' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $mo = $cartObj->checkIFIHaveCart(2, $user_init['id'], 0);
    $data = $cartObj->Delete_From_Cart($Req, $mo);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'someErrorHappen';
        $Data['success'] = false;
    }
} elseif ($_GET['action'] == 'Delete_Cart' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $mo = $cartObj->checkIFIHaveCart(2, $user_init['id'], 0);
    $data = $cartObj->Delete_Cart($mo);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'someErrorHappen';
        $Data['success'] = false;
    }
}

echo json_encode($Data);
