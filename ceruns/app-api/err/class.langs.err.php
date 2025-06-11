<?php

$Langs_ERR = new Langs_ERR();

class Langs_ERR {
    public function Lang_NotExist() {
        return [
            "success" => false,
            "message" => "You Must Add Key Lang"
        ];
    }
    public function Lang_Empty() {
        return [
            "success" => false,
            "message" => "Lang Is Empty ,You Must Add Lang"
        ];
    }
    public function Lang_Exist() {
        return [
            "success" => false,
            "message" => "This lang Are Exist"
        ];
    }
}
