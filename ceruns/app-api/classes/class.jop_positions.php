<?php

$jopPositionsObj = new jopPositionsObj();
class jopPositionsObj {
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
    public function getAllJopPositions() {
        $sql = "SELECT * FROM jop_position";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
