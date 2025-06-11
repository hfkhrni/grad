<?php

/* * *************************************************************************
 *
 *   POWERED BY MOHAMED BASHANDY
 *   PROJECT: KHAFAGA
 *   Copyright 2024 MO COMPANY
 *   http://
 *
 * ************************************************************************* */
class MO {
    public $MO; // إضافة الخاصية لحفظ الاتصال
    public function connect() {
        if (isset($this->MO)) {
            return $this->MO;
        }
        $dsn = "mysql:host=" . HOST . ";dbname=" . DATA_BASE . ";charset=utf8mb4";
        $user = USER;
        $pass = PASSWORD;
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // تفعيل وضع الأخطاء
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // طريقة إرجاع البيانات
            PDO::ATTR_EMULATE_PREPARES => true,
        ];
        try {
            $this->MO = new PDO($dsn, $user, $pass, $options);
            return $this->MO;
        } catch (PDOException $e) {
            echo "Failed To Connect " . $e->getMessage();
        }
    }
}
