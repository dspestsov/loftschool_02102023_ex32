<?php

include('./paymentEnum.php');

function registerOrger(array $user, array $orderData): array
{
    $orderData = prepareOrderData($user, $orderData);
    $order = createOrder($orderData);
    $order['orders_num'] = getCountUserOrders($order['user_id']);

    return $order;
}

function prepareOrderData(array $user, array $orderData): array
{
    $orderData['payment'] = $orderData['payment'] ?? ENUM_NOTHING_SELECTED;
    $orderData['callback'] = $orderData['callback'] ?? '0';
    $orderData['user_id'] = $user['id'];
    $orderData['created_at'] = date('Y-m-d H:m:s');
    $orderData['part'] = (int)$orderData['part'];
    $orderData['appt'] = (int)$orderData['appt'];
    $orderData['floor'] = (int)$orderData['floor'];

    return $orderData;
}

function createOrder(array $orderData): array
{
    $db = Db::getInstance();
    $queryString = 'INSERT INTO `\'order\'`'
        . '(`user_id`, `street`, `home`, `part`, `appt`, `floor`, `comment`, `payment`, `callback`, `created_at`)'
        . ' VALUES (:user_id,:street,:home,:part,:appt,:floor,:comment,:payment,:callback,:created_at)';
    $db->fetchOne(
        $queryString,
        $orderData
    );
    return getOrderById($db->lastInsertId());
}

function getOrderById(int $id): array
{
    $db = Db::getInstance();
    $result = $db->fetchOne(
        'SELECT * FROM `\'order\'` WHERE id = :id',
        ['id' => $id]
    );
    if (!$result) {
        $result = [];
    }
    return $result;
}

function getCountUserOrders(string $userId): string
{
    $db = Db::getInstance();
    $result = $db->fetchOne(
        'SELECT COUNT(*) FROM `\'order\'` WHERE user_id = :user_id',
        ['user_id' => $userId]
    );

    return array_values($result)[0];
}