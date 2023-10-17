<?php
require_once('./class.Db.php');
require_once('./functions.php');
include('./statusResponse.php');

$data = post([
    'name',
    'phone',
    'email',
    'street',
    'home',
    'part',
    'appt',
    'floor',
    'comment',
    'payment',
    'callback'
]);

$required = checkRequiredFields($data, [
    'name',
    'phone',
    'email',
    'street',
    'home',
]);
if (count($required) > 0) {
    response(STATUS_FIELDS_REQUIRED, $required);
}

$validated = validateLenght($data, [
    'name' => 50,
    'phone' => 18,
    'email' => 50,
    'street' => 50,
    'comment' => 500

]);
if (count($validated) > 0) {
    response(STATUS_FIELDS_VALIDATE, $validated);
}

$userData = [
    'name' => $data['name'],
    'phone' => $data['phone'],
    'email' => $data['email']
];

$user = userFirstOrCreate($userData);

$orderData = [
    'street' => $data['street'],
    'home' => $data['home'],
    'part' => $data['part'],
    'appt' => $data['appt'],
    'floor' => $data['floor'],
    'comment' => $data['comment'],
    'payment' => $data['payment'],
    'callback' => $data['callback']
];

$order = registerOrger($user, $orderData);

response(STATUS_SUCCESS, $order);