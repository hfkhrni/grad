<?php

$jopObj = new jopObj();
class jopObj {
    public $db;
    public $conn;
    public $lang;
    public $dateTime;
    public $user;


    public function __construct() {
        $this->db = new MO();
        $this->conn = $this->db->connect();
        $this->lang = $GLOBALS['LANGUAGE'];
        $this->dateTime = date('Y-m-d H:i:s');
    }
    public function AddJops($data) {
        $sql = "INSERT INTO jops 
                    (
                        jop_title,
                        jop_times,
                        jop_requirments,
                        country,
                        is_money,
                        money
                    ) 
                VALUES 
                    (
                        :jop_title,
                        :jop_times,
                        :jop_requirments,
                        :country,
                        :is_money,
                        :money
                    )";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute($data);
        return $stmt->rowCount();
    }
    public function GetJops($data) {
        $sql = "SELECT * FROM jops";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $jops = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($jops) {
            foreach ($jops as &$jop) {
                $jop['jop_times'] = $this->getMyJopTimes($jop['jop_times']);
                $jop['jop_title'] = $this->getMyJopTitles($jop['jop_title']);
            }
            return $jops;
        } else {
            return false;
        }
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
    public function getMyJopTitles($jop_title) {
        $sql = "SELECT *
                FROM jop_position
                WHERE id  = :id ";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id', $jop_title, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
