<?php

$jopTimingObj = new jopTimingObj();
class jopTimingObj {
    public $db;
    public $conn;
    public $lang;
    public $dateTime;
    public $user;


    public function __construct() {
        $this->db = new MO();
        $this->conn = $this->db->connect();
        $this->lang = LANGUAGE;
        $this->dateTime = date('Y-m-d H:i:s');
    }
    public function getAllJopTiming() {
        $jops = $this->getJopsTiming();
        foreach ($jops as &$jop) {
            $jop['lang_details'] = $this->getJopLang($jop['id']);
        }
        return $jops;
    }
    public function getJopsTiming() {
        $sql = "SELECT * FROM jop_timing";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function getJopLang($id) {
        $sql = "SELECT * FROM jop_timing_langs WHERE id = :id";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
