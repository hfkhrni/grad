<?php
//************************************* funcs for version *****************************************//
// function versionToArray(string $version): array {
    //     preg_match('/(\d+\.\d+\.\d+)/', $version, $matches);
    //     return array_map('intval', explode('.', $matches[1]));
// }

// function compareVersions(array $version): int {
    //     $targetVersion = [1, 0, 11];
    //     foreach ($version as $index => $value) {
        //         if ($value > ($targetVersion[$index] ?? 0)) {
            //             return 1;
//         } elseif ($value < ($targetVersion[$index] ?? 0)) {
//             return -1;
//         }
//     }
//     return 0;
// }
//************************************* init.php *****************************************//
        //         if ($apache_request['Usertoken']) {
        //                $userId = $userObj->getUserIDByToken($apache_request['Usertoken']);
        //                  $userId ?  $Req['user_id'] = intval($Req['user_id']) : '';
        //                  if (!$Req['user_id'] && $apache_request['Usertoken']) {
        //                      echo json_encode(["status" => 401, "message" => "Unauthorized Request a"]);
        //                      exit();
        //                  }
        //
        ////             //print_r($Req) ;die();
        //
        //             $AuthorizationUserCode = $userObj->getAuthorizationCodeByUserId($Req['user_id']);
        //             // echo '<pre>'; print_r( $UserToken)  ."<br>" .$AuthorizationUserCode  ;die();
        //             if ($AuthorizationUserCode != $apache_request['Usertoken'] && !$Req['fawryApiInfo'] && !$Req['postType'] && !$Req['someSettingsString'] && !$Req['video_name']) {
        //                 echo json_encode(["status" => 401, "message" => "Unauthorized Request a"]);
        //                 exit();
        //             }
        //
        //         }
        //          if ($Req['from']  || $Req['to']) {
        //              if ($Req['from'] != $Req['user_id']  &&    $Req['to'] != $Req['user_id']) {
        //                  echo json_encode(["status" => 401, "message" => "Unauthorized Request b"]);
        //                  exit();
        //              }
        //          }
        //         if ($Req['conversation_id'] || $_GET['conversation_id']) {
        //             $conversation_id = $_GET['conversation_id'] ? $_GET['conversation_id'] : $Req['conversation_id'];
        //             $id = $message->cheackIfUserRelatedToConversion($Req['user_id'], $conversation_id);
        //
        //             if (!$id) {
        //                 echo json_encode(["status" => 401, "message" => "Unauthorized Request d", "on" => "conversation_id"]);
        //                 exit();
        //             }
        //         }
//     } else {
//         echo json_encode(["status" => 401, "message" => "Unauthorized Request5"]);
//         exit();
//     }
// } else {
//     echo json_encode(["status" => 401, "message" => "Unauthorized Request6"]);
//     exit();
// }
