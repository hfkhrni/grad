<?php

$Admin_ERR = new Admin_ERR();

class Admin_ERR {
    public function UserDeletedByAdmin() {
        return [
            "success" => false,
            "message" => "User deleted by admin"
        ];
    }
    public function USER_MUST_ADMIN() {
        return [
            "success" => false,
            "message" => "User Must Be Admin To Do This"
        ];
    }
}
