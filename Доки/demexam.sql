-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 23 2024 г., 01:56
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demexam`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `order_id` int NOT NULL,
  `worker_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `component`
--

CREATE TABLE `component` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `component`
--

INSERT INTO `component` (`id`, `name`, `price`) VALUES
(1, 'Гайки', '500.00'),
(2, 'Винты', '1500.00'),
(3, 'Пластины', '2000.00'),
(4, 'Припой', '3500.00');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `tech_type` varchar(255) NOT NULL,
  `tech_model` varchar(255) NOT NULL,
  `problem_description` varchar(255) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `client_id` int NOT NULL,
  `status_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `tech_type`, `tech_model`, `problem_description`, `date_start`, `date_end`, `client_id`, `status_id`) VALUES
(1, 'Фен', 'Ладомир ТА112 белый', 'Перестал работать', '2023-06-06', NULL, 7, 2),
(2, 'Тостер', 'Redmond RT-437 черный', 'Перестал работать', '2023-05-05', NULL, 7, 2),
(3, 'Холодильник', 'Indesit DS 316 W белый', 'Не морозит одна из камер холодильника', '2022-07-07', NULL, 8, 3),
(4, 'Стиральная машина', 'DEXP WM-F610NTMA/WW белый', 'Перестали работать многие режимы стирки', '2023-08-02', NULL, 8, 1),
(5, 'Мультиварка', 'Redmond RMC-M95 черный', 'Перестала включаться', '2023-08-02', NULL, 9, 1),
(6, 'Фен', 'Ладомир ТА113 чёрный', 'Перестал работать', '2023-08-02', NULL, 7, 3),
(7, 'Холодильник', 'Indesit DS 314 W серый', 'Гудит, но не замораживает', '2023-07-09', NULL, 8, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `order_component`
--

CREATE TABLE `order_component` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `component_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `order_component`
--

INSERT INTO `order_component` (`id`, `order_id`, `component_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE `order_status` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Новая заявка'),
(2, 'В процессе ремонта'),
(3, 'Готова к выдаче'),
(4, 'Ожидание запчастей');

-- --------------------------------------------------------

--
-- Структура таблицы `order_worker`
--

CREATE TABLE `order_worker` (
  `id` int NOT NULL,
  `is_executor` tinyint(1) NOT NULL,
  `order_id` int NOT NULL,
  `worker_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `order_worker`
--

INSERT INTO `order_worker` (`id`, `is_executor`, `order_id`, `worker_id`) VALUES
(1, 1, 1, 7),
(2, 1, 2, 8),
(3, 1, 3, 9),
(4, 1, 4, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `name`, `code`) VALUES
(1, 'client', 'Заказчик'),
(2, 'admin', 'Оператор'),
(3, 'master', 'Мастер'),
(4, 'manager', 'Менеджер');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `surname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `surname`, `name`, `patronymic`, `phone`, `login`, `password`, `role_id`) VALUES
(1, 'Трубин', 'Никита', 'Юрьевич', '89210563128', 'kasoo', 'root', 4),
(2, 'Мурашов', 'Андрей', 'Юрьевич', '89535078985', 'murashov123', 'qwerty', 3),
(3, 'Степанов', 'Андрей', 'Викторович', '89210673849', 'test1', 'test1', 3),
(4, 'Перина', 'Анастасия', 'Денисова', '89990563748', 'perinaAD', '250519', 2),
(5, 'Мажитова', 'Ксения', 'Сергеевна', '89994563847', 'krutiha1234567', '1234567890', 2),
(6, 'Семенова', 'Ясмина', 'Марковна', '89994563847', 'login1', 'pass1', 3),
(7, 'Баранова', 'Эмилия', 'Марковна', '89994563841', 'login2', 'pass2', 1),
(8, 'Егорова', 'Алиса', 'Платоновна', '89994563842', 'login3', 'pass3', 1),
(9, 'Титов', 'Максим', 'Иванович', '89994563843', 'login4', 'pass4', 1),
(10, 'Иванов', 'Марк', 'Максимович', '89994563844', 'login5', 'pass5', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Индексы таблицы `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `order_component`
--
ALTER TABLE `order_component`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `component_id` (`component_id`);

--
-- Индексы таблицы `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_worker`
--
ALTER TABLE `order_worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `component`
--
ALTER TABLE `component`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `order_component`
--
ALTER TABLE `order_component`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `order_worker`
--
ALTER TABLE `order_worker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_component`
--
ALTER TABLE `order_component`
  ADD CONSTRAINT `order_component_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_component_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_worker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_worker`
--
ALTER TABLE `order_worker`
  ADD CONSTRAINT `order_worker_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_worker_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
