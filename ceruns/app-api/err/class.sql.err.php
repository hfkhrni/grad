<?php

$SQL_ERR = new SQL_ERR();

class SQL_ERR {
    public function RegisterSqlError() {
        return [
            'success' => false,
            'error' => 'Failed_To_Register'
        ];
    }
    public function AddLangsSqlError() {
        return [
            'success' => false,
            'error' => 'Failed_To_Register'
        ];
    }
}
