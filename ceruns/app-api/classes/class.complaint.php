<?php

$complaintObj = new complaintObj();

class complaintObj {
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
    public function AddComplaint($data) {
        $sql = "INSERT INTO complaints (
                    full_name, 
                    contact_info, 
                    complaint_type, 
                    employer_name, 
                    employer_address, 
                    employer_phone, 
                    evidence_file_path, 
                    evidence_description, 
                    created_at
                ) VALUES (
                    :full_name, 
                    :contact_info, 
                    :complaint_type, 
                    :employer_name, 
                    :employer_address, 
                    :employer_phone, 
                    :evidence_file_path, 
                    :evidence_description, 
                    :created_at
                )";

        $stmt = $this->conn->prepare($sql);

        // استخدام bindValue بدلاً من bindParam
        $stmt->bindValue(':full_name', $data['full_name'], PDO::PARAM_STR);
        $stmt->bindValue(':contact_info', $data['contact_info'], PDO::PARAM_STR);
        $stmt->bindValue(':complaint_type', $data['complaint_type'], PDO::PARAM_STR);
        $stmt->bindValue(':employer_name', $data['employer_name'], PDO::PARAM_STR);
        $stmt->bindValue(':employer_address', $data['employer_address'], PDO::PARAM_STR);
        $stmt->bindValue(':employer_phone', $data['employer_phone'] ?? null, PDO::PARAM_STR);
        $stmt->bindValue(':evidence_file_path', $data['evidence_file_path'] ?? null, PDO::PARAM_STR);
        $stmt->bindValue(':evidence_description', $data['evidence_description'] ?? null, PDO::PARAM_STR);
        $stmt->bindValue(':created_at', $this->dateTime, PDO::PARAM_STR);

        return $stmt->execute();
    }
}
