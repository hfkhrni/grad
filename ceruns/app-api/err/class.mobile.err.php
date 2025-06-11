<?php

$Mobile_ERR = new Mobile_ERR();

class Mobile_ERR {
    public function MobileExist() {
        return [
            'success' => false,
            'error' => 'Mobile_Exist'
        ];
    }
    public function MobileEmpty() {
        return [
            'success' => false,
            'error' => 'Mobile_Empty'
        ];
    }
    public function MobileMustBeNumber() {
        return [
            'success' => false,
            'error' => 'Mobile_Must_Be_Number'
        ];
    }


    public function MobileNotExist() {
        return [
            'success' => false,
            'error' => 'Mobile_Not_Exist'
        ];
    }
}
