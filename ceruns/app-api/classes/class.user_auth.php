<?php

$USAObj = new user_auth();

class user_auth {
    public $db;
    public $conn;
    public $lang;
    public $dateTime;
    public function __construct() {
        $this->db = new MO();
        $this->conn = $this->db->connect();
        $this->lang = $GLOBALS['LANGUAGE'];
        $this->dateTime = date('Y-m-d H:i:s');
    }
    //****************************************** CHECK ******************************************
    //****************************************** CHECK ******************************************
    //****************************************** CHECK ******************************************
    //****************************************** CHECK ******************************************
    //****************************************** CHECK ******************************************
    public function checkEmail($email) {
        $sql = "SELECT * 
                FROM users 
                WHERE email = :email";
        $stmt = $this->db->connect()->prepare($sql);
        $stmt->bindParam(':email', $email, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function checkIfEmailExist($a, $email) {
        if ($a == 0) {
            $sql = "SELECT * FROM `users` WHERE `email` = :email";
            $query = $this->conn->prepare($sql);
            $query->bindParam(':email', $email, PDO::PARAM_STR);
            $query->execute();
            return $query->fetch(PDO::FETCH_ASSOC);
        } elseif ($a == 1) {
            $deleteSql = "DELETE FROM `verification` WHERE `email` = :email";
            $deleteQuery = $this->conn->prepare($deleteSql);
            $deleteQuery->bindParam(':email', $email, PDO::PARAM_STR);
            $deleteQuery->execute();
        } elseif ($a == 2) {
            $sql = "SELECT u.email, ua.id 
                    FROM `users` u 
                    LEFT JOIN `user_auth` ua ON u.id = ua.user_id AND ua.page_type = 'user'
                    WHERE u.`email` = :email";
            $query = $this->conn->prepare($sql);
            $query->bindParam(':email', $email, PDO::PARAM_STR);
            $query->execute();
            return $query->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function generatePasswordResetToken() {
        $code = random_int(100000, 999999); // Generate a random number between 100000 and 999999 (inclusive)
        return (string) $code; // Convert the integer to string
    }
    public function storePasswordResetToken($email, $code) {
        $sql = "INSERT INTO verification SET code = :code  , email = :email ";
        $query = $this->conn->prepare($sql);
        $query->bindParam(':code', $code, PDO::PARAM_STR);
        $query->bindParam(':email', $email, PDO::PARAM_STR);
        $query->execute();
        return $query->rowCount() > 0;
    }
    //****************************************** LOGIN ******************************************
    //****************************************** LOGIN ******************************************
    //****************************************** LOGIN ******************************************
    //****************************************** LOGIN ******************************************
    //****************************************** LOGIN ******************************************
    public function checkPassword($email, $password) {
        $sql = "SELECT `id` FROM `users` ";
        $sql .= " WHERE  `email` = :email AND `password` = :password ";
        $query = $this->conn->prepare($sql);
        $query->bindParam(':email', $email, PDO::PARAM_STR);
        $query->bindParam(':password', $password, PDO::PARAM_STR);
        $query->execute();
        return $query->fetch(PDO::FETCH_ASSOC);
    }
    public function AddNewLogin($user_id) {
        $sql = "INSERT INTO users_login
                SET 
                    user_id = :user_id,
                    login_date = :login_date";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->bindParam(':login_date', $this->dateTime, PDO::PARAM_STR);
        $stmt->execute();
    }

    public function getUserDetailsInfo($id) {
        $sql = "SELECT *
                FROM users
                WHERE  id = :id";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_STR);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        $user['jop_times'] = $this->getMyJopTimes($user['jop_times']);
        $user['jop_titles'] = $this->getMyJopTitles($user['jop_titles']);
        return $user;
    }
    public function getMyJopTimes($jop_times) {
        $jop_times = commaStringToArray($jop_times);
        foreach ($jop_times as $jop_time) {
            $sql = "SELECT *
                    FROM jop_timing_langs
                    WHERE jop_timing_id  = :id 
                    AND lang_code = :lang_code";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(':id', $jop_time, PDO::PARAM_STR);
            $stmt->bindParam(':lang_code', $this->lang, PDO::PARAM_STR);
            $stmt->execute();
            $all_jop_times[] = $stmt->fetch(PDO::FETCH_ASSOC);
        }
        return $all_jop_times;
    }
    public function getMyJopTitles($jop_titles) {
        $jop_titles = commaStringToArray($jop_titles);
        foreach ($jop_titles as $jop_title) {
            $sql = "SELECT *
                    FROM jop_position
                    WHERE id  = :id ";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(':id', $jop_title, PDO::PARAM_STR);
            $stmt->execute();
            $all_jop_titles[] = $stmt->fetch(PDO::FETCH_ASSOC);
        }
        return $all_jop_titles;
    }

    //****************************************** REGISTER ******************************************
    //****************************************** REGISTER ******************************************
    //****************************************** REGISTER ******************************************
    //****************************************** REGISTER ******************************************
    //****************************************** REGISTER ******************************************


    public function checkIfMobileExistForEditing($mobile) {
        $sql = "SELECT u.mobile, ua.id 
                FROM `users` u 
                LEFT JOIN `user_auth` ua ON u.id = ua.user_id AND ua.page_type = 'user'
                WHERE u.`mobile` = :mobile";
        $query = $this->conn->prepare($sql);
        $query->bindParam(':mobile', $mobile, PDO::PARAM_STR);
        $query->execute();
        return $query->fetch(PDO::FETCH_ASSOC);
    }

    public function register($Req) {
        $sql = "INSERT INTO users 
                (
                    mobile,
                    email, 
                    password, 
                    user_name,
                    dial_code,
                    exp_years,
                    country,
                    jop_times,
                    birth_date,
                    jop_titles
                )
            VALUES 
                (
                    :mobile,
                    :email, 
                    :password, 
                    :user_name, 
                    :dial_code,
                    :exp_years,
                    :country,
                    :jop_times,
                    :birth_date,
                    :jop_titles
                ) ";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':mobile', $Req['mobile'], PDO::PARAM_STR);
        $stmt->bindParam(':email', $Req['email'], PDO::PARAM_STR);
        $stmt->bindParam(':password', $Req['password'], PDO::PARAM_STR);
        $stmt->bindParam(':user_name', $Req['user_name'], PDO::PARAM_STR);
        $stmt->bindParam(':dial_code', $Req['dial_code'], PDO::PARAM_STR);
        $stmt->bindParam(':exp_years', $Req['exp_years'], PDO::PARAM_INT);
        $stmt->bindParam(':country', $Req['country'], PDO::PARAM_STR);
        $stmt->bindParam(':jop_times', $Req['jop_times'], PDO::PARAM_STR); // Assuming it's stored as string
        $stmt->bindParam(':birth_date', $Req['birth_date'], PDO::PARAM_STR);
        $stmt->bindParam(':jop_titles', $Req['jop_titles'], PDO::PARAM_STR); // Assuming it's stored as string

        $stmt->execute();
        return $this->conn->lastInsertId();
    }

    public function makeAuthCode($id) {
        $token = password_hash($id . "MOSALAHISTHEKING" . $id, PASSWORD_DEFAULT);
        $sql = "UPDATE users
                SET code = :token 
                WHERE id = :id";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':token', $token);
        $stmt->bindParam(':id', $id);
        $stmt->execute();
    }

    //****************************************** FORGET PASS ******************************************
    //****************************************** FORGET PASS ******************************************
    //****************************************** FORGET PASS ******************************************
    //****************************************** FORGET PASS ******************************************
    //****************************************** FORGET PASS ******************************************
    public function check_code($email, $code) {
        $sql = "SELECT * FROM 
        verification
         WHERE `email` = :email AND `code` = :code";
        $query = $this->conn->prepare($sql);
        $query->bindParam(':email', $email, PDO::PARAM_STR);
        $query->bindParam(':code', $code, PDO::PARAM_STR);
        $query->execute();
        return $query->fetch(PDO::FETCH_ASSOC);
    }
    public function updatePassword($email, $newPassword, $type) {
        $column = ($type == 1) ? 'email' : 'mobile';
        $sql = "UPDATE users SET `password` = :password WHERE $column = :$column ";
        $query = $this->conn->prepare($sql);
        $query->bindParam(':' . $column, $email, PDO::PARAM_STR);
        $query->bindParam(':password', $newPassword, PDO::PARAM_STR); // Bind the new password parameter
        $query->execute();

        return $query->rowCount() > 0;
    }
    //****************************************** HEADER INFO ******************************************
    //****************************************** HEADER INFO ******************************************
    //****************************************** HEADER INFO ******************************************
    //****************************************** HEADER INFO ******************************************
    //****************************************** HEADER INFO ******************************************

    public function getUserDataByAuth($authentication_code) {
        // Query to retrieve the page_type from user_auth table
        $pageTypeQuery = "SELECT * FROM user_auth WHERE code = :authentication_code";
        $pageTypeStmt = $this->conn->prepare($pageTypeQuery);
        $pageTypeStmt->bindParam(':authentication_code', $authentication_code, PDO::PARAM_STR);
        $pageTypeStmt->execute();
        $pageType = $pageTypeStmt->fetch(PDO::FETCH_ASSOC);

        if ($pageType['page_type'] === 'user') {
            // Query to get user data if page_type is 'user'
            $sql = "SELECT u.*
            FROM users u
            WHERE u.id = '{$pageType['user_id']}'";
        } elseif ($pageType['page_type'] === 'page') {
            $sql = "SELECT
                    u.user_name,
                    u.img,
                    u.id,
                    pf.img AS post_img,
                    pf.video AS post_video,
                    pf.post,
                    IF(EXISTS (
                        SELECT 1
                        FROM subscriptions su
                        WHERE su.user_id = a.id
                        AND '{$this->dateTime}' BETWEEN su.date_from AND su.date_to
                    ), 1, 0) AS is_subs
                FROM user_page_acc u
                JOIN user_auth a ON a.page_id = u.id
                LEFT JOIN post_free pf ON a.id = pf.user_id
                WHERE a.code = :authentication_code
                GROUP BY u.user_name, u.img, u.id, pf.img, pf.video, pf.post
                ";
        } else {
            return false;
        }

        // Execute the main query
        $query = $this->conn->prepare($sql);
        $query->bindParam(':authentication_code', $authentication_code, PDO::PARAM_STR);
        $query->execute();
        $userData = $query->fetch(PDO::FETCH_ASSOC);

        // Merge the user data and page type information
        $mergedData = array_merge($userData, $pageType);
        if ($mergedData) {
            $mergedData['Have_page_id'] = $this->getIdOfPage($pageType['id']) ?: null;
            $mergedData['subscriptions_hide'] = $this->get_subscriptions_hide();
        }

        return $mergedData;
    }
    public function getUserDataByID($id) {
        $pageTypeQuery = "SELECT * FROM user_auth WHERE id = :id";
        $pageTypeStmt = $this->conn->prepare($pageTypeQuery);
        $pageTypeStmt->bindParam(':id', $id, PDO::PARAM_STR);
        $pageTypeStmt->execute();
        $pageType = $pageTypeStmt->fetch(PDO::FETCH_ASSOC);

        if ($pageType['page_type'] === 'user') {
            $sql = "SELECT u.*
            FROM users u
            WHERE u.id = '{$pageType['user_id']}'";
        } elseif ($pageType['page_type'] === 'page') {
            $sql = "SELECT
                        u.user_name AS user_name,
                        u.img,
                        a.id,
                        u.dial_code,
                        u.mobile,
                        u.description,
                        u.services_id AS service_id,
                        a.lat,
                        a.lon,
                        a.user_id,
                        u.address,
                        sl.ser_name AS service_name,
                        pf.img AS post_img,
                        pf.video AS post_video,
                        pf.post,
                        IF(EXISTS (
                            SELECT 1
                            FROM subscriptions su
                            WHERE su.user_id = a.id
                            AND '{$this->dateTime}' BETWEEN su.date_from AND su.date_to
                        ), 1, 0) AS is_subs
                    FROM user_page_acc u
                    JOIN user_auth a ON a.page_id = u.id
                    LEFT JOIN post_free pf ON a.id = pf.user_id
                    LEFT JOIN service_langs sl ON u.services_id = sl.service_id AND sl.lang_code = '" . LANGUAGE . "'
                    WHERE a.id = :id
                    GROUP BY u.user_name, u.img, a.id, u.dial_code, u.mobile, u.description, u.services_id, a.lat, a.lon, u.address, sl.ser_name, pf.img, pf.video, pf.post
                    ";
        } else {
            return false;
        }

        // Execute the main query
        $query = $this->conn->prepare($sql);
        $query->bindParam(':id', $id, PDO::PARAM_STR);
        $query->execute();
        $userData = $query->fetch(PDO::FETCH_ASSOC);
        // Merge the user data and page type information
        $mergedData = array_merge($userData, $pageType);
        if ($pageType['page_type'] === 'page') {
            $sql = "SELECT user_id FROM user_auth WHERE id = :id";
            $query = $this->conn->prepare($sql);
            $query->bindParam(':id', $userData['user_id'], PDO::PARAM_STR);
            $query->execute();
            $user_id = $query->fetchColumn(0);
            $sql = "SELECT password FROM users WHERE id = :id";
            $query = $this->conn->prepare($sql);
            $query->bindParam(':id', $user_id, PDO::PARAM_STR);
            $query->execute();
            $mergedData['password'] = $query->fetchColumn(0);
        }
        if ($mergedData) {
            $mergedData['Have_page_id'] = $this->getIdOfPage($id) ?: null;
            if ($mergedData['Have_page_id'] == null && $pageType['page_type'] === 'page') {
                $mergedData['Have_page_id'] = $id;
            }
            $mergedData['subscriptions_hide'] = $this->get_subscriptions_hide();
        }
        return $mergedData;
    }

    public function getIdOfPage($id) {
        $sql = "SELECT id FROM user_auth WHERE page_type = 'page' AND user_id = :id AND is_deleted = '0' AND active != '0'";
        $query = $this->conn->prepare($sql);
        $query->bindParam(':id', $id, PDO::PARAM_STR);
        $query->execute();
        return $query->fetchColumn(0);
    }
    public function get_subscriptions_hide() {
        $sql = "SELECT `value` FROM settings WHERE name = 'subscriptions_hide'";
        $query = $this->conn->prepare($sql);
        $query->execute();
        return $query->fetchColumn(0);
    }
}
