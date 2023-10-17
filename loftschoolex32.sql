-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 17 2023 г., 22:26
-- Версия сервера: 5.7.23
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `loftschoolex32`
--

-- --------------------------------------------------------

--
-- Структура таблицы `'order'`
--

CREATE TABLE `'order'` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `street` varchar(50) NOT NULL,
  `home` smallint(6) NOT NULL,
  `part` tinyint(4) DEFAULT NULL,
  `appt` smallint(6) DEFAULT NULL,
  `floor` smallint(6) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `payment` enum('0','1','2','') NOT NULL,
  `callback` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `'order'`
--

INSERT INTO `'order'` (`id`, `user_id`, `street`, `home`, `part`, `appt`, `floor`, `comment`, `payment`, `callback`, `created_at`) VALUES
(1, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 21:10:00'),
(2, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 21:10:15'),
(3, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 21:10:17'),
(4, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 21:10:19'),
(5, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 22:10:04'),
(6, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 22:10:05'),
(7, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 22:10:11'),
(8, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 22:10:21'),
(9, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 22:10:47'),
(10, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 22:10:23'),
(11, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 22:10:49'),
(12, 10, 'street', 55, 1, 1, 1, '', '0', 0, '2023-10-17 22:10:22'),
(13, 10, 'street', 5, 1, 1, 1, '', '0', 0, '2023-10-17 22:10:25'),
(14, 10, 'street', 5, 5, 4, 2, '', '0', 0, '2023-10-17 22:10:22'),
(15, 10, 'street', 5, 0, 0, 0, '', '0', 0, '2023-10-17 22:10:29'),
(16, 10, 'street', 5, 0, 0, 0, '', '0', 0, '2023-10-17 22:10:47'),
(17, 11, 'street', 5, 0, 0, 0, '', '0', 0, '2023-10-17 22:10:57');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `email`) VALUES
(10, 'username', '+7 (444) 444 44 44', 'email@email.com'),
(11, 'name', '+7 (555) 555 55 55', 'email2@email.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `'order'`
--
ALTER TABLE `'order'`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `'order'`
--
ALTER TABLE `'order'`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
