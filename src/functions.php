<?php

include('./statusResponse.php');
include('./fieldNames.php');
include('./userFunctions.php');
include('./orderFunctions.php');

function post(array $fields): array
{
    $data = [];

    foreach ($fields as $field) {
        if (isset($_POST[$field])) {
            $data[$field] = $_POST[$field];
        }
    }

    return $data;
}

function checkRequiredFields(array $data, array $require): array
{
    $required = [];

    foreach ($require as $field) {
        if (
            array_key_exists($field, $data)
            && ($data[$field] != null)
        ) {
            continue;
        }

        $required[] = "Поле " . FIELD_NAMES[$field] . " должно быть заполнено.";
    }

    return $required;
}

function validateLenght(array $data, array $rules): array
{
    $validated = [];

    foreach ($rules as $key => $rule) {
        if (
            array_key_exists($key, $data)
            && (mb_strlen($data[$key]) <= $rule)
        ) {
            continue;
        }

        $validated[] = "Длина поля " . FIELD_NAMES[$key] . " не должна превышать " . $rule . "символов.";
    }

    return $validated;
}

function response(string $status, array $data)
{
    if (!in_array(
            $status, 
            [
                STATUS_SUCCESS,
                STATUS_FIELDS_REQUIRED,
                STATUS_FIELDS_VALIDATE,
                STATUS_UNDEFINED
            ]
        )) {
        $status = STATUS_UNDEFINED;
    }

    header('Content-type: application-json');
    echo json_encode([
        'status' => $status,
        'data' => $data
    ]);

    exit(0);
}