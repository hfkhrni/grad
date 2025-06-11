<?php

$SEC_ERR = new SEC_ERR();

class SEC_ERR {
    public $msg;
    public function __call($name, $arguments) {
        $this->msg = [
            'success' => false,
            'error' => 'Unauthorized_Request ' . $arguments['0']
        ];
        return $this->msg;
    }
}
