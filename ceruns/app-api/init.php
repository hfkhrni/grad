<?php
require_once('../main_headers.php');
// require_once '../I18N/Arabic.php';
// require_once '../utils/util.php';

// ! connection ! //
require_once('../env.defines.php');

require_once('../utils/utils.php');
require_once('classes/conn.php');
// ! connection ! //

// // ! secretApiSecurityPart ! //
require_once('classes/class.users.php');
require_once('err/class.security.err.php');
require_once('security/class/class.conditions.php');
require_once('security/conditions.php');
require_once('security/defines.php');
// // ! secretApiSecurityPart ! //

// ! errors ! //
require_once('err/class.mobile.err.php');
require_once('err/class.password.err.php');
require_once('err/class.names.err.php');
require_once('err/class.sql.err.php');
require_once('err/class.types.err.php');
require_once('err/class.admin.err.php');
require_once('err/class.langs.err.php');
// ! errors ! //

// ! Api Classes ! //
require_once('classes/class.user_auth.php');
require_once('classes/class.users.php');
require_once('classes/class.jop_timing.php');
require_once('classes/class.jop_positions.php');
require_once('classes/class.complaint.php');
require_once('classes/class.jops.php');
// ! Api Classes ! //
// require_once 'classes/upload-class.php';
// require_once 'classes/class.hs256.php';
// require_once 'classes/class.api-push-notifications.php';

// require_once 'classes/class.user_auth.php';

// require_once 'classes/class.notifications.php';
// require_once 'classes/class.cart.php';
// require_once 'classes/class.orders.php';
// require_once 'classes/class.pages.php';
// require_once 'classes/class.subs.php';
// require_once 'classes/class.services.php';
// require_once 'classes/class.messages.php';
// require_once 'classes/class.addword.php';
// require_once 'classes/class.payment_ways.php';
// require_once 'classes/class.posts.php';
// require_once 'classes/class.user_page_acc.php';
// require_once 'classes/class.get_url_desc.php';






// // $Req['id'] ? $Req['id'] = intval($Req['id']) : '';
// // $Req['conversation_id'] ? $Req['conversation_id'] = intval($Req['conversation_id']) : '';
// // $Req['post_id'] ? $Req['post_id'] = intval($Req['post_id']) : '';
// // $Req['comment_id'] ? $Req['comment_id'] = intval($Req['comment_id']) : '';
// // //  $userObj->inserInApiTable(json_encode($_SERVER) , json_encode( apache_request_headers()) ,json_encode($Req) ,json_encode($_GET) ,$Req['useree_id']);
