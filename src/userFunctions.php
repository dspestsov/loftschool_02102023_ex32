<?php

function userFirstOrCreate(array $userData): array
{
    $user = getUserByEmail($userData['email']);
    if (count($user) === 0) {
        $user = getUserById(createUser($userData));
    }

    return $user;
}

function getUserByEmail(string $email): array
{
    $db = Db::getInstance();
    $result = $db->fetchOne(
        'SELECT * FROM user WHERE email = :email',
        ['email' => $email]
    );
    if (!$result) {
        $result = [];
    }
    return $result;
}

function createUser(array $userData): int
{
    $db = Db::getInstance();
    $db->fetchOne(
        'INSERT INTO user (`name`, `phone`, `email`) VALUES (:name, :phone, :email)',
        $userData
    );
    return $db->lastInsertId();
}

function getUserById($id): array
{
    $db = Db::getInstance();
    $result = $db->fetchOne(
        'SELECT * FROM user WHERE id = :id',
        ['id' => $id]
    );
    if (!$result) {
        $result = [];
    }
    return $result;
}