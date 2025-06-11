<?php

$PASS_ERR = new PASS_ERR();

class PASS_ERR {
    public function ShortPassword() {
        return [
            'success' => false,
            'error' => 'Short_Password'
        ];
    }
    public function WrongPassword() {
        return [
            'success' => false,
            'error' => 'Wrong_Password'
        ];
    }
}
