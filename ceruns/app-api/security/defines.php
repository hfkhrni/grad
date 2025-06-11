<?php

// if (!($_GET['action'] == 'login' || $_GET['action'] == 'register' || $_GET['action'] == 'getAllJopTiming' || $_GET['action'] == 'getAllJopPositions')) {
//     if (!(isset(apache_request_headers()['Token']))) {
//         echo json_encode($SEC_ERR->ERR(4));
//         exit();
//     }
//     $user = $users->getUserByCode(apache_request_headers()['Token']);
//     if ($user) {
//         define('CLIENT', $user);
//     } else {
//         echo json_encode($SEC_ERR->ERR(6));
//         exit();
//     }
//     if (CLIENT['is_deleted'] == '1') {
//         // echo json_encode($SEC_ERR->ERR(5));
//         // exit();
//     } elseif (CLIENT['is_deleted'] == '2') {
//         echo json_encode($Admin_ERR->UserDeletedByAdmin());
//         exit();
//     }
// }
if (isset(apache_request_headers()['Lang-Code'])) {
    $langCode = apache_request_headers()['Lang-Code'];
    $GLOBALS['LANGUAGE'] = $langCode;
} else {
    echo json_encode($SEC_ERR->ERR(8));
    exit();
}
