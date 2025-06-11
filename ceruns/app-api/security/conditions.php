<?php
// $apiSeritKey_correct = password_verify('MO-BASHANDY-SECRET', apache_request_headers()['Secretapi']);
// if (!isset($apache_request['Secretapi'])) {
//     echo json_encode($SEC_ERR->ERR(1));
//     exit();
// }
// if ($apiSeritKey_correct) {
//     $is_exist = $conditions->checkSecritKeyIsExist(apache_request_headers()['Secretapi']);
//     if (!$is_exist) {
//         $conditions->insertSecritKey(apache_request_headers()['Secretapi']);
//     } else {
//         echo json_encode($SEC_ERR->ERR(2));
//         exit();
//     }
// } else {
//     echo json_encode($SEC_ERR->ERR(3));
//     exit();
// }
