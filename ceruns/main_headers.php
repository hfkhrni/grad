<?php

error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED);
ini_set('memory_limit', '-1');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET,POST');
header('Access-Control-Allow-Headers: Content-Type,User-Token,Date-Offeset,lang,App-Version, Access-Control-Allow-Headers,Usertoken,Authorization,X-Requested-With,access-control-allow-origin,Secretapi');

date_default_timezone_set('Africa/Cairo');

$postdata = file_get_contents("php://input");

$Req = json_decode($postdata, true);
$apache_request = apache_request_headers();
$lang = apache_request_headers()["Lang"];
define('LANGUAGE', $lang);

$app_version = apache_request_headers()["App-Version"];
define('APP_VERSION', $app_version);

$date_offeset = apache_request_headers()["Date-Offeset"];
define('date_offeset', $date_offeset);
