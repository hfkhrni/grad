<?php

$Names_ERR = new Names_ERR();
class Names_ERR {
    public function FirstNameEmpty() {
        return [
            'success' => false,
            'error' => 'First_Name_Empty'
        ];
    }
    public function LastNameEmpty() {
        return [
            'success' => false,
            'error' => 'Last_Name_Empty'
        ];
    }
    public function Name_NotExist() {
        return [
            'success' => false,
            'error' => 'You Must Add Key name'
        ];
    }
    public function Name_Empty() {
        return [
            'success' => false,
            'error' => 'You Must Add Value To The name'
        ];
    }
}
