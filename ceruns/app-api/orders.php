<?php

require_once 'init.php';

if ($_GET['action'] == 'addOrder' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = $orderObj->addOrder($Req, $user_init['id']);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'someErrorHappen';
        $Data['success'] = false;
    }
} elseif ($_GET['action'] == 'getOrders' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $limit = ($Req['limit']) ? $Req['limit'] : '5';
    $start = ($Req['start']) ? $Req['start'] : '0';
    if ($Req['status'] == 'Processing') {
        if ($user_init['page_type'] == 'user') {
            $data = $orderObj->getOrders_ThatIsDelivering($user_init['id'], $user_init['lat'], $user_init['lon'], $start, $limit);
            if ($data) {
                $Data['data'] = $data;
                $Data['success'] = true;
            } else {
                $Data['data'] = [];
                $Data['success'] = true;

            }
        } elseif ($user_init['page_type'] == 'page') {
            $data = $orderObj->getOrders_ThatIsDelivering_ForAccs($user_init['id'], $user_init['lat'], $user_init['lon'], $start, $limit);
            if ($data) {
                $Data['data'] = $data;
                $Data['success'] = true;
            } else {
                $Data['data'] = [];
                $Data['success'] = true;
            }
        }
    } elseif ($Req['status'] == 'Received') {
        if ($user_init['page_type'] == 'user') {
            $data = $orderObj->getOrders_ThatIsReceived($user_init['id'], $user_init['lat'], $user_init['lon'], $start, $limit);
            if ($data) {
                $Data['data'] = $data;
                $Data['success'] = true;
            } else {
                $Data['data'] = [];
                $Data['success'] = true;
            }
        } elseif ($user_init['page_type'] == 'page') {
            $data = $orderObj->getOrders_ThatIsReceived_ForAccs($user_init['id'], $user_init['lat'], $user_init['lon'], $start, $limit);
            if ($data) {
                $Data['data'] = $data;
                $Data['success'] = true;
            } else {
                $Data['data'] = [];
                $Data['success'] = true;
            }
        }
    } elseif ($Req['status'] == 'Canceled') {
        if ($user_init['page_type'] == 'user') {
            $data = $orderObj->getOrders_ThatIsCanceled($user_init['id'], $user_init['lat'], $user_init['lon'], $start, $limit);
            if ($data) {
                $Data['data'] = $data;
                $Data['success'] = true;
            } else {
                $Data['data'] = [];
                $Data['success'] = true;
            }
        } elseif ($user_init['page_type'] == 'page') {
            $data = $orderObj->getOrders_ThatIsCanceled_ForAccs($user_init['id'], $user_init['lat'], $user_init['lon'], $start, $limit);
            if ($data) {
                $Data['data'] = $data;
                $Data['success'] = true;
            } else {
                $Data['data'] = [];
                $Data['success'] = true;
            }
        }
    } else {
        $Data['error'] = 'noStatus';
        $Data['success'] = false;
    }
} elseif ($_GET['action'] == 'ChangeStatus' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($Req['status'] == 'Canceled') {
        if ($user_init['page_type'] == 'user') {
            $data = $orderObj->Cancel_Order($Req['order_id'], $user_init['id']);
            if ($data) {
                $Data['data'] = $data;
                $Data['success'] = true;
            } else {
                $Data['error'] = 'noContent';
                $Data['success'] = false;
            }
        } elseif ($user_init['page_type'] == 'page') {
            $data = $orderObj->Cancel_Order_ForAccs($Req['order_id'], $user_init['id']);
            if ($data) {
                $Data['data'] = $data;
                $Data['success'] = true;
            } else {
                $Data['error'] = 'noContent';
                $Data['success'] = false;
            }
        }
    } elseif ($Req['status'] == 'Received') {
        $data = $orderObj->Receive_Done($Req['order_id']);
        if ($data) {
            $Data['data'] = $data;
            $Data['success'] = true;
        } else {
            $Data['error'] = 'noContent';
            $Data['success'] = false;
        }
    } else {
        $Data['error'] = 'noStatus';
        $Data['success'] = false;
    }
} elseif ($_GET['action'] == 'getOrderDetails' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($user_init['page_type'] == 'user') {
        $data = $orderObj->getOrderDetails($Req['order_id'], $user_init['lat'], $user_init['lon']);
        if ($data) {
            $Data['data'] = $data;
            $Data['success'] = true;
        } else {
            $Data['error'] = 'noContent';
            $Data['success'] = false;
        }
    } elseif ($user_init['page_type'] == 'page') {
        $data = $orderObj->getOrderDetails_ForAccs($Req['order_id'], $user_init['lat'], $user_init['lon']);
        if ($data) {
            $Data['data'] = $data;
            $Data['success'] = true;
        } else {
            $Data['error'] = 'noContent';
            $Data['success'] = false;
        }
    }
} elseif ($_GET['action'] == 'Reserve_Again' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = $orderObj->Reserve_Again($Req, $user_init['id']);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    } else {
        $Data['error'] = 'can\'t add products to more than one facility ';
        $Data['success'] = false;
    }
} elseif ($_GET['action'] == 'GetOrdersCount' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = $orderObj->GetOrdersCount($user_init['id'], $user_init['page_type']);
    if ($data) {
        $Data['data'] = $data;
        $Data['success'] = true;
    }
} else {
    $Data['error'] = 'noAction';
    $Data['success'] = false;
}

echo json_encode($Data);
