<?php

$users = new users();

class users {

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

    public function GetAllUsersByJopID($id) {
        $sql = "SELECT * 
                FROM users 
                WHERE jop_titles 
                LIKE :id";
        $stmt = $this->conn->prepare($sql);
        $searchTerm = '%' . $id . '%';
        $stmt->bindValue(':id', $searchTerm, PDO::PARAM_STR);
        $stmt->execute();
        $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($users as &$user) {
            unset($user['password']);
            $user['jop_times'] = $this->getMyJopTimes($user['jop_times']);
            $user['jop_titles'] = $this->getMyJopTitles($user['jop_titles']);
        }
        return $users;
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
}
