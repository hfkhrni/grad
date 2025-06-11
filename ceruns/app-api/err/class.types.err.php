<?php

$TYPES_ERR = new TYPES_ERR();

class TYPES_ERR {
    public function TypeNotExist() {
        return [
            'success' => false,
            'error' => 'Type_Not_Exist'
        ];
    }
    public function TypeEmpty() {
        return [
            'success' => false,
            'error' => 'Type_Empty'
        ];
    }
}
