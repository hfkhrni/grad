<?php

$conditions = new conditions();

class conditions {
    public $db;
    public $conn;
    public $dateTime;

    public function __construct() {
        $this->db = new MO();
        $this->conn = $this->db->connect();
        $this->dateTime = date('Y-m-d H:i:s');
    }
    public function checkSecritKeyIsExist($key) {
        $sql = "SELECT secrit_key 
                FROM api_secrit_keys 
                WHERE secrit_key = :key";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':key', $key);
        $stmt->execute();
        return $stmt->fetchColumn(0);
    }
    public function insertSecritKey($key) {
        $sql = "INSERT INTO api_secrit_keys   
                SET secrit_key = :key ";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':key', $key);
        $stmt->execute();
    }
    public function getLangs() {
        $sql = "SELECT lang FROM langs";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return array_column($stmt->fetchAll(PDO::FETCH_ASSOC), 'lang');
    }
}
