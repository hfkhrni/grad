<?php

function loadEnv($file) {
    $lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos($line, '#') === 0) continue;
        list($key, $value) = explode('=', $line, 2);
        $key = trim($key);
        $value = trim($value);
        putenv("$key=$value");
        $_ENV[$key] = $value;
    }
}
loadEnv(__DIR__ . '\.env');
define('DATA_BASE', getenv('DATA_BASE'));
define('HOST', getenv('HOST'));
define('USER', getenv('USER'));
define('PASSWORD', getenv('PASSWORD'));
