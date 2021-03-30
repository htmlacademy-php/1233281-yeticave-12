<?php
require_once 'helpers.php';

include_template('main.php');

$isAuth = rand(0, 1);

$userName = 'Alexandr';

$title = 'Главная';

$categories =  ['Доски и лыжи', 'Крепления', 'Ботинки', 'Одежда', 'Инструменты', 'Разное'];

$products = [
    [
        'name' => '2014 Rossignol District Snowboard',
        'category' => $categories[0],
        'price' => '10999',
        'img' => 'img/lot-1.jpg',
        'expirationDate' => '2021-03-31'
    ],
    [
        'name' => 'DC Ply Mens 2016/2017 Snowboard',
        'category' => $categories[0],
        'price' => '159999',
        'img' => 'img/lot-2.jpg',
        'expirationDate' => '2021-04-02'
    ],
    [
        'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'category' => $categories[1],
        'price' => '8000',
        'img' => 'img/lot-3.jpg',
        'expirationDate' => '2021-04-03'
    ],
    [
        'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'category' => $categories[2],
        'price' => '10999',
        'img' => 'img/lot-4.jpg',
        'expirationDate' => '2021-04-04'
    ],
    [
        'name' => 'Куртка для сноуборда DC Mutiny Charocal',
        'category' => $categories[3],
        'price' => '7500',
        'img' => 'img/lot-5.jpg',
        'expirationDate' => '2021-04-05'
    ],
    [
        'name' => 'Маска Oakley Canopy',
        'category' => $categories[5],
        'price' => '5400',
        'img' => 'img/lot-6.jpg',
        'expirationDate' => '2021-04-06'
    ],
];


function getFormattedPrice(int $price): string
{
    $formattedPrice = ceil($price);
    if ($formattedPrice >= 1000) {
        $formattedPrice = number_format($formattedPrice, 0, null, ' ');
    }

    $formattedPrice = strval($formattedPrice);

    $formattedPrice = sprintf('%s ₽', $formattedPrice);

    return $formattedPrice;
}


function getDateDif(string $date): array
{
    $currentDate = new DateTime("now");
    $expirationDate = new DateTime($date);

    $dateDif = date_diff($currentDate, $expirationDate);

    if (isset($dateDif->{"d"}) && $dateDif->{"h"} && $dateDif->{"i"}) {
        $hours = $dateDif->{"d"} * 24 + $dateDif->{"h"};

        $minutes = $dateDif->{"i"};

        return [$hours, $minutes];
    }

    return [0, 0];
}

$page_content = include_template('main.php', ['products' => $products]);

$layout_content = include_template('layout.php', ['isAuth' => $isAuth, 'title' => $title, 'userName' => $userName, 'categories' => $categories, 'content' => $page_content]);

print($layout_content);
