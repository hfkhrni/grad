<?php


function GetIdsFromCommasText($ids) {
    return array_filter(explode(',', trim($ids, ',')));
}

function GetIdsFromCommasTextWithSort($ids) {
    $idsArray = array_filter(explode(',', trim($ids, ',')));
    sort($idsArray);
    return $idsArray;
}

function transformCommaDelimitedObject($object) {
    if (!is_array($object)) {
        return [];
    }
    $maxCount = 0;
    $processedObject = [];
    foreach ($object as $key => $value) {
        $processedObject[$key] = explode(',', trim($value, ','));
        $maxCount = max($maxCount, count($processedObject[$key]));
    }
    $result = [];
    for ($i = 0; $i < $maxCount; $i++) {
        $item = [];
        foreach ($processedObject as $key => $values) {
            $item[$key] = array_key_exists($i, $values) ?
                ($values[$i] === 'NULL' ? 'NULL' : $values[$i]) :
                null;
        }
        $result[] = $item;
    }
    return $result;
}

function arrayToCommaString($array) {
    return ',' . implode(',', $array) . ',';
}
function commaStringToArray($string) {
    return array_filter(explode(',', trim($string, ',')));
}
