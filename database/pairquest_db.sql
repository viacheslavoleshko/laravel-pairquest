-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 14 2021 г., 16:56
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pairquest_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accessories`
--

CREATE TABLE `accessories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `preference_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `accessories`
--

INSERT INTO `accessories` (`id`, `name`, `user_id`, `preference_id`) VALUES
(9, 'Вино', 14, 1),
(10, 'Сукня', 14, 1),
(11, 'Відеокамера', 14, 2),
(13, 'Фотоапарат', 3, 1),
(21, 'Відеокамера', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 8),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 9),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 13),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 16),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 17),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 14),
(22, 1, 'user_hasone_gender_relationship', 'relationship', 'Gender', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Gender\",\"table\":\"genders\",\"type\":\"belongsTo\",\"column\":\"gender_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(23, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 12),
(24, 1, 'partner_email', 'text', 'Partner Email', 0, 1, 1, 1, 1, 1, '{}', 18),
(25, 1, 'gender_id', 'text', 'Gender Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(26, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(27, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(28, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(29, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(30, 1, 'user_hasone_user_level_relationship', 'relationship', 'User Level', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\UserLevel\",\"table\":\"user_levels\",\"type\":\"belongsTo\",\"column\":\"user_level_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(31, 1, 'user_level_id', 'text', 'User Level Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(32, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(33, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 10),
(34, 7, 'preference_id', 'text', 'Preference Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(35, 7, 'duration_id', 'text', 'Duration Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(36, 7, 'user_level_id', 'text', 'User Level Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(37, 7, 'is_partner_task', 'select_dropdown', 'Is Partner Task', 1, 1, 1, 1, 1, 1, '{\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}', 11),
(38, 7, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 12),
(39, 7, 'is_accessories', 'select_dropdown', 'Is Accessories', 1, 1, 1, 1, 1, 1, '{\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}', 14),
(40, 7, 'gender_id', 'text', 'Gender Id', 1, 1, 1, 1, 1, 1, '{}', 8),
(41, 7, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 15),
(42, 7, 'task_hasmany_preference_relationship', 'relationship', 'Preference', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Preference\",\"table\":\"preferences\",\"type\":\"belongsTo\",\"column\":\"preference_id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(43, 7, 'task_belongsto_duration_relationship', 'relationship', 'Duration', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Duration\",\"table\":\"durations\",\"type\":\"belongsTo\",\"column\":\"duration_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(44, 7, 'task_belongsto_user_level_relationship', 'relationship', 'User Level', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\UserLevel\",\"table\":\"user_levels\",\"type\":\"belongsTo\",\"column\":\"user_level_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(46, 7, 'task_belongsto_gender_relationship', 'relationship', 'Gender', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Gender\",\"table\":\"genders\",\"type\":\"belongsTo\",\"column\":\"gender_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(47, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(49, 8, 'gender_id', 'text', 'Gender Id', 1, 0, 0, 0, 0, 0, '{}', 2),
(50, 8, 'partner_task_belongsto_gender_relationship', 'relationship', 'Gender', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Gender\",\"table\":\"genders\",\"type\":\"belongsTo\",\"column\":\"gender_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(51, 8, 'partner_task_belongstomany_task_relationship', 'relationship', 'Partner task', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Task\",\"table\":\"tasks\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"task_combinations\",\"pivot\":\"1\",\"taggable\":\"0\"}', 5),
(52, 7, 'task_belongstomany_partner_task_relationship', 'relationship', 'Partner task', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\PartnerTask\",\"table\":\"partner_tasks\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"task_combinations\",\"pivot\":\"1\",\"taggable\":\"on\"}', 13),
(54, 8, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-07-06 08:28:42', '2021-07-07 05:59:35'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-07-06 08:28:42', '2021-07-06 08:28:42'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-07-06 08:28:42', '2021-07-06 08:28:42'),
(4, 'genders', 'genders', 'Gender', 'Genders', NULL, 'App\\Models\\Gender', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-06 09:15:55', '2021-07-07 05:36:12'),
(6, 'user_levels', 'user-levels', 'User Level', 'User Levels', NULL, 'App\\Models\\UserLevel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-06 13:01:18', '2021-07-06 13:01:18'),
(7, 'tasks', 'tasks', 'Task', 'Tasks', NULL, 'App\\Models\\Task', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-06 13:07:15', '2021-07-13 10:55:44'),
(8, 'partner_tasks', 'partner-tasks', 'Partner Task', 'Partner Tasks', NULL, 'App\\Models\\PartnerTask', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-06 13:27:51', '2021-07-13 10:39:24');

-- --------------------------------------------------------

--
-- Структура таблицы `durations`
--

CREATE TABLE `durations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `durations`
--

INSERT INTO `durations` (`id`, `name`) VALUES
(1, 'Короткий'),
(2, 'На вечір'),
(3, 'Великий квест');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `genders`
--

INSERT INTO `genders` (`id`, `name`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Структура таблицы `generated_tasks`
--

CREATE TABLE `generated_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `partner_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `partner_task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `accessory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_rejected` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `generated_tasks`
--

INSERT INTO `generated_tasks` (`id`, `user_id`, `partner_id`, `location_id`, `started_at`, `task_id`, `partner_task_id`, `accessory_id`, `is_rejected`, `created_at`, `updated_at`) VALUES
(1, 14, 3, 11, '2021-07-09 09:54:45', 6, 21, 6, 0, '2021-07-08 12:31:09', '2021-07-09 10:26:29'),
(2, 3, 14, 2, '2021-07-12 14:00:00', 4, 17, NULL, 0, '2021-07-09 13:16:45', '2021-07-09 14:14:02'),
(3, 3, 14, 1, '2021-07-14 19:00:00', 4, 17, NULL, 0, '2021-07-09 14:47:10', '2021-07-09 15:00:23'),
(4, 14, 3, 10, '2021-07-11 15:00:00', 7, 17, 9, 0, '2021-07-09 15:27:24', '2021-07-09 15:28:08'),
(5, 14, 3, 10, '2021-07-23 12:42:00', 7, 17, 9, 0, '2021-07-12 07:37:11', '2021-07-12 07:37:18'),
(6, 14, 3, 11, '2021-07-10 14:57:00', 4, 18, 11, 0, '2021-07-12 14:58:17', '2021-07-12 14:58:21'),
(7, 14, 3, 11, '2021-07-10 14:58:00', 7, 17, 9, 1, '2021-07-12 14:58:36', '2021-07-12 14:58:38'),
(8, 14, 3, 11, '2021-07-22 14:58:00', 7, 17, 9, 1, '2021-07-12 14:58:56', '2021-07-12 14:59:10'),
(9, 14, 3, 10, '2021-07-15 14:59:00', 4, 17, 11, 1, '2021-07-12 14:59:20', '2021-07-12 14:59:24'),
(10, 14, 3, 11, '2021-07-08 15:07:00', 7, 17, 9, 1, '2021-07-12 15:10:54', '2021-07-13 07:46:20'),
(11, 3, 14, 10, '2021-07-08 08:56:00', 5, 19, NULL, 1, '2021-07-13 08:56:48', '2021-07-13 08:56:52'),
(12, 14, 3, 10, '2021-07-20 12:09:00', 2, 14, 9, 1, '2021-07-13 12:09:17', '2021-07-13 12:09:21'),
(13, 14, 3, 14, '2021-07-09 12:28:00', 2, 13, 9, 1, '2021-07-13 12:36:44', '2021-07-13 12:36:49'),
(14, 14, 3, 10, '2021-07-14 12:36:00', 5, 20, NULL, 1, '2021-07-13 12:36:54', '2021-07-13 12:36:57'),
(15, 14, 3, 14, '2021-07-03 12:37:00', 2, 13, 9, 1, '2021-07-13 12:37:02', '2021-07-13 12:37:05'),
(16, 14, 3, 13, '2021-07-09 12:37:00', 5, 20, NULL, 1, '2021-07-13 12:37:10', '2021-07-13 12:37:14'),
(17, 14, 3, 10, '2021-07-17 12:37:00', 2, 13, 9, 1, '2021-07-13 12:37:18', '2021-07-13 12:37:21'),
(18, 14, 3, 10, '2021-07-24 12:37:00', 2, 14, 9, 1, '2021-07-13 12:37:25', '2021-07-13 12:37:46'),
(19, 14, 3, 14, '2021-07-10 12:37:00', 5, 19, NULL, 1, '2021-07-13 12:37:51', '2021-07-13 12:37:54'),
(20, 14, 3, 11, '2021-07-22 12:37:00', 2, 13, 9, 1, '2021-07-13 12:37:59', '2021-07-13 12:38:01'),
(21, 14, 3, 10, '2021-07-10 12:38:00', 5, 19, NULL, 1, '2021-07-13 12:38:05', '2021-07-13 12:38:07'),
(22, 14, 3, 10, '2021-07-23 12:38:00', 2, 14, 9, 1, '2021-07-13 12:38:11', '2021-07-13 12:38:13'),
(23, 14, 3, 11, '2021-07-31 12:38:00', 5, 19, NULL, 1, '2021-07-13 12:38:18', '2021-07-13 12:38:32'),
(24, 14, 3, 10, '2021-07-03 12:38:00', 5, 20, NULL, 1, '2021-07-13 12:38:36', '2021-07-13 12:38:43'),
(25, 14, 3, 10, '2021-07-10 16:42:00', 5, 19, NULL, 1, '2021-07-13 12:40:13', '2021-07-13 12:40:47'),
(26, 14, 3, 14, '2021-07-15 14:40:00', 5, 20, NULL, 1, '2021-07-13 12:40:53', '2021-07-13 12:40:56'),
(27, 14, 3, 14, '2021-07-25 12:46:00', 5, 19, NULL, 1, '2021-07-13 12:41:02', '2021-07-13 12:41:04'),
(28, 14, 3, 13, '2021-08-06 12:41:00', 8, NULL, 9, 1, '2021-07-13 12:41:09', '2021-07-13 12:48:44'),
(29, 14, 3, 11, '2021-07-13 14:48:00', 8, NULL, 9, 1, '2021-07-13 12:48:51', '2021-07-13 12:49:10'),
(30, 14, 3, 10, '2021-07-11 12:49:00', 8, NULL, 9, 1, '2021-07-13 12:49:14', '2021-07-13 12:49:16'),
(31, 14, 3, 11, '2021-07-15 12:49:00', 8, NULL, 9, 1, '2021-07-13 12:49:20', '2021-07-13 12:49:22'),
(32, 14, 3, 13, '2021-07-03 12:49:00', 2, 13, 9, 1, '2021-07-13 12:49:26', '2021-07-13 12:50:02'),
(33, 3, 14, 11, '2021-07-04 12:50:00', 8, NULL, 9, 1, '2021-07-13 12:50:11', '2021-07-13 12:50:17'),
(34, 14, 3, 10, '2021-07-10 12:50:00', 2, 14, 9, 1, '2021-07-13 12:50:22', '2021-07-13 12:50:41'),
(35, 3, 14, 14, '2021-07-18 16:54:00', 5, 20, NULL, 1, '2021-07-13 12:50:53', '2021-07-13 12:51:02'),
(36, 14, 3, 14, '2021-07-19 12:52:00', 8, NULL, 9, 1, '2021-07-13 12:52:18', '2021-07-13 12:52:25');

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_like` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `task_id`, `user_id`, `is_like`) VALUES
(5, 3, 3, 1),
(6, 3, 14, 1),
(7, 7, 14, 1),
(8, 7, 3, 0),
(9, 4, 14, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `locations`
--

INSERT INTO `locations` (`id`, `name`, `user_id`) VALUES
(1, 'Ресторан', 3),
(2, 'Дім', 3),
(3, 'Парк', 3),
(8, 'Сіновал', 3),
(10, 'Дім', 14),
(11, 'Ресторан', 14),
(13, 'Ліс', 14),
(14, 'Міст', 14);

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-07-06 08:28:43', '2021-07-06 08:28:43');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-07-06 08:28:43', '2021-07-06 08:28:43', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-07-06 08:28:43', '2021-07-06 15:05:43', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 16, 1, '2021-07-06 08:28:43', '2021-07-06 15:05:41', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 16, 2, '2021-07-06 08:28:44', '2021-07-06 15:05:42', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2021-07-06 08:28:44', '2021-07-06 15:05:44', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2021-07-06 08:28:44', '2021-07-06 15:05:44', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2021-07-06 08:28:48', '2021-07-06 09:18:28', 'voyager.hooks', NULL),
(12, 1, 'Genders', '', '_self', 'voyager-paw', '#000000', 16, 3, '2021-07-06 09:15:55', '2021-07-06 15:05:42', 'voyager.genders.index', 'null'),
(13, 1, 'User Levels', '', '_self', 'voyager-double-up', '#000000', 16, 4, '2021-07-06 13:01:18', '2021-07-06 15:05:43', 'voyager.user-levels.index', 'null'),
(14, 1, 'Tasks', '', '_self', 'voyager-documentation', '#000000', NULL, 3, '2021-07-06 13:07:15', '2021-07-06 15:05:43', 'voyager.tasks.index', 'null'),
(15, 1, 'Partner Tasks', '', '_self', 'voyager-documentation', '#000000', NULL, 4, '2021-07-06 13:27:51', '2021-07-06 15:05:43', 'voyager.partner-tasks.index', 'null'),
(16, 1, 'User Info', '', '_self', 'voyager-people', '#000000', NULL, 2, '2021-07-06 15:05:32', '2021-07-06 15:05:40', NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2021_07_06_090715_create_genders_table', 2),
(33, '2021_07_06_101435_create_user_levels_table', 3),
(34, '2021_07_06_114852_add_gender_to_users_table', 3),
(35, '2021_07_06_122123_create_preferences_table', 3),
(36, '2021_07_06_122632_create_user_preference_table', 3),
(37, '2021_07_06_123811_create_locations_table', 3),
(38, '2021_07_06_123851_create_accessories_table', 3),
(39, '2021_07_06_125122_create_durations_table', 3),
(41, '2021_07_06_134848_create_tasks_table', 4),
(42, '2021_07_06_142445_create_partner_tasks_table', 4),
(43, '2021_07_06_143408_create_task_combinations_table', 5),
(44, '2021_07_06_144123_create_generated_tasks_table', 6),
(45, '2021_07_06_154841_create_likes_table', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `partner_tasks`
--

CREATE TABLE `partner_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `partner_tasks`
--

INSERT INTO `partner_tasks` (`id`, `description`, `gender_id`) VALUES
(11, 'Збери валізу, для кількаденної подорожі.', 2),
(12, 'Візьми саме необхідне подорожі чекають.', 2),
(13, 'Візьми рюкзак і перекусити. Буде цікаво.', 2),
(14, 'Візьми фотоапарат.', 2),
(15, 'Приходь в гості, буде цікаво.', 2),
(16, 'Бери пивко.', 2),
(17, 'Виділи 3-4 свого часу, буде цікаво.', 2),
(18, 'Вдягни вечірню сукню, для тебе сюрприз.', 2),
(19, 'Виділи 3-4 свого часу, буде цікаво.', 1),
(20, 'Чекай, завтра я за тобою заїду.', 1),
(21, 'Купи пивка і чіпсів.', 1),
(22, 'Виділи 3 години свого часу.', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-07-06 08:28:44', '2021-07-06 08:28:44'),
(2, 'browse_bread', NULL, '2021-07-06 08:28:44', '2021-07-06 08:28:44'),
(3, 'browse_database', NULL, '2021-07-06 08:28:44', '2021-07-06 08:28:44'),
(4, 'browse_media', NULL, '2021-07-06 08:28:44', '2021-07-06 08:28:44'),
(5, 'browse_compass', NULL, '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(6, 'browse_menus', 'menus', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(7, 'read_menus', 'menus', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(8, 'edit_menus', 'menus', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(9, 'add_menus', 'menus', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(10, 'delete_menus', 'menus', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(11, 'browse_roles', 'roles', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(12, 'read_roles', 'roles', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(13, 'edit_roles', 'roles', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(14, 'add_roles', 'roles', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(15, 'delete_roles', 'roles', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(16, 'browse_users', 'users', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(17, 'read_users', 'users', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(18, 'edit_users', 'users', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(19, 'add_users', 'users', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(20, 'delete_users', 'users', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(21, 'browse_settings', 'settings', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(22, 'read_settings', 'settings', '2021-07-06 08:28:45', '2021-07-06 08:28:45'),
(23, 'edit_settings', 'settings', '2021-07-06 08:28:46', '2021-07-06 08:28:46'),
(24, 'add_settings', 'settings', '2021-07-06 08:28:46', '2021-07-06 08:28:46'),
(25, 'delete_settings', 'settings', '2021-07-06 08:28:46', '2021-07-06 08:28:46'),
(26, 'browse_hooks', NULL, '2021-07-06 08:28:48', '2021-07-06 08:28:48'),
(27, 'browse_genders', 'genders', '2021-07-06 09:15:55', '2021-07-06 09:15:55'),
(28, 'read_genders', 'genders', '2021-07-06 09:15:55', '2021-07-06 09:15:55'),
(29, 'edit_genders', 'genders', '2021-07-06 09:15:55', '2021-07-06 09:15:55'),
(30, 'add_genders', 'genders', '2021-07-06 09:15:55', '2021-07-06 09:15:55'),
(31, 'delete_genders', 'genders', '2021-07-06 09:15:55', '2021-07-06 09:15:55'),
(32, 'browse_user_levels', 'user_levels', '2021-07-06 13:01:18', '2021-07-06 13:01:18'),
(33, 'read_user_levels', 'user_levels', '2021-07-06 13:01:18', '2021-07-06 13:01:18'),
(34, 'edit_user_levels', 'user_levels', '2021-07-06 13:01:18', '2021-07-06 13:01:18'),
(35, 'add_user_levels', 'user_levels', '2021-07-06 13:01:18', '2021-07-06 13:01:18'),
(36, 'delete_user_levels', 'user_levels', '2021-07-06 13:01:18', '2021-07-06 13:01:18'),
(37, 'browse_tasks', 'tasks', '2021-07-06 13:07:15', '2021-07-06 13:07:15'),
(38, 'read_tasks', 'tasks', '2021-07-06 13:07:15', '2021-07-06 13:07:15'),
(39, 'edit_tasks', 'tasks', '2021-07-06 13:07:15', '2021-07-06 13:07:15'),
(40, 'add_tasks', 'tasks', '2021-07-06 13:07:15', '2021-07-06 13:07:15'),
(41, 'delete_tasks', 'tasks', '2021-07-06 13:07:15', '2021-07-06 13:07:15'),
(42, 'browse_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51'),
(43, 'read_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51'),
(44, 'edit_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51'),
(45, 'add_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51'),
(46, 'delete_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `preferences`
--

CREATE TABLE `preferences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `preferences`
--

INSERT INTO `preferences` (`id`, `description`) VALUES
(1, 'Подорожі'),
(2, 'Кіно'),
(3, 'Концерти');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-07-06 08:28:44', '2021-07-06 08:28:44'),
(2, 'user', 'Normal User', '2021-07-06 08:28:44', '2021-07-06 08:28:44');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preference_id` bigint(20) UNSIGNED NOT NULL,
  `duration_id` bigint(20) UNSIGNED NOT NULL,
  `user_level_id` bigint(20) UNSIGNED NOT NULL,
  `is_partner_task` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_accessories` tinyint(1) NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `preference_id`, `duration_id`, `user_level_id`, `is_partner_task`, `description`, `is_accessories`, `gender_id`, `image`) VALUES
(1, 'Романтична подорож', 1, 3, 3, 1, 'Купи квитки для подорожі в місто, яке твоє кохання обожнює.', 0, 1, NULL),
(2, 'Незабутня подорож', 1, 2, 3, 1, 'Організуй подорож по незвичним місцям твого міста.', 0, 1, NULL),
(3, 'Домашній вечір', 2, 2, 1, 1, 'Зберіться вдома для перегляду улюблених фільмів.', 0, 1, NULL),
(4, 'Кіношка', 2, 2, 2, 1, 'Купи квитки у кінотеатр.', 0, 1, NULL),
(5, 'Концертній двіж', 3, 2, 3, 1, 'Купи квитки на концерт улюбленого гурту твого коханого.', 0, 2, NULL),
(6, 'Домашня дискотека', 3, 2, 1, 1, 'Зроби перегляд концерту улюбленого гурту вдома.', 0, 2, NULL),
(7, 'Пробіжка', 1, 2, 2, 1, 'Зроби вечірню пробіжку за ручку.', 0, 1, NULL),
(8, 'Історична подорож', 1, 2, 3, 0, 'Сходи у музей зі своєю парою.', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `task_combinations`
--

CREATE TABLE `task_combinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `partner_task_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_combinations`
--

INSERT INTO `task_combinations` (`id`, `task_id`, `partner_task_id`) VALUES
(1, 1, 11),
(2, 1, 12),
(3, 2, 13),
(4, 2, 14),
(5, 3, 15),
(6, 3, 16),
(7, 4, 17),
(8, 4, 18),
(9, 5, 19),
(10, 5, 20),
(11, 6, 21),
(12, 6, 22),
(13, 7, 17);

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `partner_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duration_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `partner_email`, `gender_id`, `user_level_id`, `duration_id`) VALUES
(1, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$vALnBdtdRR7MYVorxGGEi.NwolxJ3R3/vqYPV1xdq2SyFdeBHjDre', NULL, '{\"locale\":\"en\"}', '2021-07-06 08:30:05', '2021-07-12 11:52:52', NULL, NULL, NULL, NULL),
(3, 2, 'John', 'john@laravel.test', 'users/default.png', NULL, '$2y$10$Vh0l/JzwtwBnCDcquRcOr.zfMsVUA57ebiHe2zL6X90e9CzPdjATO', NULL, NULL, '2021-07-07 05:56:24', '2021-07-12 14:56:46', 'vyacheslav.oleshko.work@gmail.com', 1, 3, 2),
(14, 2, 'Viacheslav', 'vyacheslav.oleshko.work@gmail.com', 'users/default.png', NULL, '$2y$10$McRMdlbXwnsrCQseuaM8yuck9Sa6kARczRgd/prCEi2QG9Z3RigC.', NULL, NULL, '2021-07-07 11:46:32', '2021-07-13 12:28:12', 'john@laravel.test', 1, 3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `user_levels`
--

CREATE TABLE `user_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_levels`
--

INSERT INTO `user_levels` (`id`, `name`) VALUES
(1, 'Лінивий'),
(2, 'Середній'),
(3, 'Готовий двіжувати');

-- --------------------------------------------------------

--
-- Структура таблицы `user_preference`
--

CREATE TABLE `user_preference` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `preference_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_preference`
--

INSERT INTO `user_preference` (`id`, `user_id`, `preference_id`) VALUES
(72, 3, 2),
(73, 3, 3),
(74, 3, 1),
(75, 14, 1),
(76, 14, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accessories_user_id_index` (`user_id`),
  ADD KEY `accessories_preference_id_index` (`preference_id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `durations`
--
ALTER TABLE `durations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `generated_tasks`
--
ALTER TABLE `generated_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `generated_tasks_user_id_index` (`user_id`),
  ADD KEY `generated_tasks_location_id_index` (`location_id`),
  ADD KEY `generated_tasks_task_id_index` (`task_id`),
  ADD KEY `generated_tasks_partner_task_id_index` (`partner_task_id`),
  ADD KEY `generated_tasks_accessory_id_index` (`accessory_id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_index` (`user_id`),
  ADD KEY `likes_task_id_index` (`task_id`) USING BTREE;

--
-- Индексы таблицы `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_user_id_index` (`user_id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_tasks`
--
ALTER TABLE `partner_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_tasks_gender_id_index` (`gender_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_preference_id_index` (`preference_id`),
  ADD KEY `tasks_duration_id_index` (`duration_id`),
  ADD KEY `tasks_user_level_id_index` (`user_level_id`),
  ADD KEY `tasks_gender_id_index` (`gender_id`);

--
-- Индексы таблицы `task_combinations`
--
ALTER TABLE `task_combinations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_combinations_task_id_index` (`task_id`),
  ADD KEY `task_combinations_partner_task_id_index` (`partner_task_id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_gender_id_index` (`gender_id`),
  ADD KEY `users_user_level_id_index` (`user_level_id`),
  ADD KEY `users_duration_id_index` (`duration_id`) USING BTREE;

--
-- Индексы таблицы `user_levels`
--
ALTER TABLE `user_levels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_preference`
--
ALTER TABLE `user_preference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_preference_user_id_index` (`user_id`),
  ADD KEY `user_preference_preference_id_index` (`preference_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `durations`
--
ALTER TABLE `durations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `generated_tasks`
--
ALTER TABLE `generated_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `partner_tasks`
--
ALTER TABLE `partner_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `task_combinations`
--
ALTER TABLE `task_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user_preference`
--
ALTER TABLE `user_preference`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `accessories`
--
ALTER TABLE `accessories`
  ADD CONSTRAINT `accessories_preference_id_foreign` FOREIGN KEY (`preference_id`) REFERENCES `preferences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accessories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `generated_tasks`
--
ALTER TABLE `generated_tasks`
  ADD CONSTRAINT `generated_tasks_accessory_id_foreign` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`),
  ADD CONSTRAINT `generated_tasks_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `generated_tasks_partner_task_id_foreign` FOREIGN KEY (`partner_task_id`) REFERENCES `task_combinations` (`partner_task_id`),
  ADD CONSTRAINT `generated_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `generated_tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `partner_tasks`
--
ALTER TABLE `partner_tasks`
  ADD CONSTRAINT `partner_tasks_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_duration_id_foreign` FOREIGN KEY (`duration_id`) REFERENCES `durations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_preference_id_foreign` FOREIGN KEY (`preference_id`) REFERENCES `preferences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_user_level_id_foreign` FOREIGN KEY (`user_level_id`) REFERENCES `user_levels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_combinations`
--
ALTER TABLE `task_combinations`
  ADD CONSTRAINT `task_combinations_partner_task_id_foreign` FOREIGN KEY (`partner_task_id`) REFERENCES `partner_tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_combinations_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`duration_id`) REFERENCES `durations` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_user_level_id_foreign` FOREIGN KEY (`user_level_id`) REFERENCES `user_levels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_preference`
--
ALTER TABLE `user_preference`
  ADD CONSTRAINT `user_preference_preference_id_foreign` FOREIGN KEY (`preference_id`) REFERENCES `preferences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_preference_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
