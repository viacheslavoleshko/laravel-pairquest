-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 21 2021 г., 17:44
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `accessories`
--

INSERT INTO `accessories` (`id`, `name`) VALUES
(9, 'Вино'),
(10, 'Сукня'),
(13, 'Фотоапарат'),
(22, 'Панамка');

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
(47, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(49, 8, 'gender_id', 'text', 'Gender Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(50, 8, 'partner_task_belongsto_gender_relationship', 'relationship', 'Gender', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Gender\",\"table\":\"genders\",\"type\":\"belongsTo\",\"column\":\"gender_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(51, 8, 'partner_task_belongstomany_task_relationship', 'relationship', 'Main task', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DetailedTask\",\"table\":\"detailed_tasks\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"task_combinations\",\"pivot\":\"1\",\"taggable\":\"on\"}', 5),
(54, 8, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 3),
(55, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(56, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(59, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(60, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(61, 11, 'location_type_hasmany_location_relationship', 'relationship', 'locations', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\Models\\\\Location\",\"table\":\"locations\",\"type\":\"hasMany\",\"column\":\"location_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(62, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 12, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(64, 12, 'location_type_id', 'text', 'Location Type Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(65, 12, 'location_belongsto_location_type_relationship', 'relationship', 'location_types', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\LocationType\",\"table\":\"location_types\",\"type\":\"belongsTo\",\"column\":\"location_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(66, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(67, 14, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 4),
(68, 14, 'location_id', 'text', 'Location Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(69, 14, 'location_description_belongsto_location_relationship', 'relationship', 'locations', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Location\",\"table\":\"locations\",\"type\":\"belongsTo\",\"column\":\"location_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(70, 12, 'location_hasmany_location_description_relationship', 'relationship', 'location_descriptions', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\LocationDescription\",\"table\":\"location_descriptions\",\"type\":\"hasMany\",\"column\":\"location_id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(73, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(74, 15, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(76, 15, 'preference_belongstomany_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"user_preference\",\"pivot\":\"1\",\"taggable\":\"on\"}', 4),
(77, 1, 'user_belongstomany_preference_relationship', 'relationship', 'preferences', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Preference\",\"table\":\"preferences\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"user_preference\",\"pivot\":\"1\",\"taggable\":\"on\"}', 19),
(78, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(79, 16, 'location_type_id', 'text', 'Location Type Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(80, 16, 'preference_id', 'text', 'Preference Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(81, 16, 'duration_id', 'text', 'Duration Id', 1, 1, 1, 1, 1, 1, '{}', 8),
(82, 16, 'user_level_id', 'text', 'User Level Id', 1, 1, 1, 1, 1, 1, '{}', 10),
(84, 16, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(85, 16, 'gender_id', 'text', 'Gender Id', 1, 1, 1, 1, 1, 1, '{}', 12),
(86, 16, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 14),
(87, 16, 'detailed_task_belongsto_user_level_relationship', 'relationship', 'user_levels', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\UserLevel\",\"table\":\"user_levels\",\"type\":\"belongsTo\",\"column\":\"user_level_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(88, 16, 'detailed_task_belongsto_location_type_relationship', 'relationship', 'location_types', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\LocationType\",\"table\":\"location_types\",\"type\":\"belongsTo\",\"column\":\"location_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(89, 16, 'detailed_task_belongsto_preference_relationship', 'relationship', 'preferences', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Preference\",\"table\":\"preferences\",\"type\":\"belongsTo\",\"column\":\"preference_id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(90, 16, 'detailed_task_belongsto_duration_relationship', 'relationship', 'durations', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Duration\",\"table\":\"durations\",\"type\":\"belongsTo\",\"column\":\"duration_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(91, 16, 'detailed_task_belongsto_gender_relationship', 'relationship', 'genders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Gender\",\"table\":\"genders\",\"type\":\"belongsTo\",\"column\":\"gender_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(93, 15, 'preference_hasmany_detailed_task_relationship', 'relationship', 'detailed_tasks', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DetailedTask\",\"table\":\"detailed_tasks\",\"type\":\"hasMany\",\"column\":\"preference_id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":null}', 5),
(94, 10, 'accessory_belongstomany_detailed_task_relationship', 'relationship', 'detailed_tasks', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DetailedTask\",\"table\":\"detailed_tasks\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"task_accessory\",\"pivot\":\"1\",\"taggable\":\"on\"}', 3),
(95, 16, 'detailed_task_belongstomany_partner_task_relationship', 'relationship', 'partner_tasks', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\PartnerTask\",\"table\":\"partner_tasks\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"task_combinations\",\"pivot\":\"1\",\"taggable\":\"on\"}', 15),
(96, 16, 'detailed_task_belongstomany_accessory_relationship', 'relationship', 'accessories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Accessory\",\"table\":\"accessories\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"task_accessory\",\"pivot\":\"1\",\"taggable\":\"on\"}', 16),
(97, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(98, 18, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(99, 18, 'location_type_id', 'text', 'Location Type Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(100, 18, 'preference_id', 'text', 'Preference Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(101, 18, 'task_belongsto_location_type_relationship', 'relationship', 'location_types', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\LocationType\",\"table\":\"location_types\",\"type\":\"belongsTo\",\"column\":\"location_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(102, 18, 'task_belongsto_preference_relationship', 'relationship', 'preferences', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Preference\",\"table\":\"preferences\",\"type\":\"belongsTo\",\"column\":\"preference_id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(103, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(104, 19, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(105, 19, 'rule_belongstomany_task_relationship', 'relationship', 'tasks', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Task\",\"table\":\"tasks\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"task_rule\",\"pivot\":\"1\",\"taggable\":\"on\"}', 3),
(106, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(107, 20, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(108, 20, 'notion_belongstomany_detailed_task_relationship', 'relationship', 'detailed_tasks', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DetailedTask\",\"table\":\"detailed_tasks\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"detailed_task_notion\",\"pivot\":\"1\",\"taggable\":\"on\"}', 3),
(109, 16, 'detailed_task_belongstomany_notion_relationship', 'relationship', 'notions', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Notion\",\"table\":\"notions\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"detailed_task_notion\",\"pivot\":\"1\",\"taggable\":\"on\"}', 17),
(110, 18, 'task_belongstomany_rule_relationship', 'relationship', 'rules', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Rule\",\"table\":\"rules\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"task_rule\",\"pivot\":\"1\",\"taggable\":\"on\"}', 8),
(111, 18, 'partner_description', 'text', 'Partner Description', 1, 1, 1, 1, 1, 1, '{}', 3),
(112, 8, 'partner_task_belongstomany_partner_rule_relationship', 'relationship', 'partner_rules', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\PartnerRule\",\"table\":\"partner_rules\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"partner_task_rule\",\"pivot\":\"1\",\"taggable\":\"on\"}', 6),
(113, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(114, 22, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 2),
(115, 22, 'partner_rule_belongstomany_partner_task_relationship', 'relationship', 'partner_tasks', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\PartnerTask\",\"table\":\"partner_tasks\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"partner_task_rule\",\"pivot\":\"1\",\"taggable\":\"on\"}', 3),
(116, 16, 'custom_partner_task', 'text', 'Custom Partner Task', 0, 1, 1, 1, 1, 1, '{}', 3),
(117, 14, 'partner_description', 'text', 'Partner Description', 1, 1, 1, 1, 1, 1, '{}', 5);

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
(8, 'partner_tasks', 'partner-tasks', 'Partner Task', 'Partner Tasks', NULL, 'App\\Models\\PartnerTask', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-06 13:27:51', '2021-07-20 13:21:06'),
(10, 'accessories', 'accessories', 'Accessory', 'Accessories', NULL, 'App\\Models\\Accessory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-16 11:59:29', '2021-07-16 12:01:22'),
(11, 'location_types', 'location-types', 'Location Type', 'Location Types', NULL, 'App\\Models\\LocationType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-16 14:33:02', '2021-07-16 14:42:10'),
(12, 'locations', 'locations', 'Location', 'Locations', NULL, 'App\\Models\\Location', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-16 14:35:43', '2021-07-19 10:06:02'),
(13, 'locations_description', 'locations-description', 'Locations Description', 'Locations Descriptions', NULL, 'App\\Models\\LocationDescription', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 09:56:23', '2021-07-19 09:57:27'),
(14, 'location_descriptions', 'location-descriptions', 'Location Description', 'Location Descriptions', NULL, 'App\\Models\\LocationDescription', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 10:04:06', '2021-07-21 09:30:27'),
(15, 'preferences', 'preferences', 'Preference', 'Preferences', NULL, 'App\\Models\\Preference', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 13:10:12', '2021-07-19 14:18:55'),
(16, 'detailed_tasks', 'detailed-tasks', 'Detailed Task', 'Detailed Tasks', NULL, 'App\\Models\\DetailedTask', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 13:40:33', '2021-07-21 07:54:32'),
(18, 'tasks', 'tasks', 'Task', 'Tasks', NULL, 'App\\Models\\Task', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 15:27:51', '2021-07-21 07:35:38'),
(19, 'rules', 'rules', 'Rule', 'Rules', NULL, 'App\\Models\\Rule', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-20 12:15:10', '2021-07-20 12:15:10'),
(20, 'notions', 'notions', 'Notion', 'Notions', NULL, 'App\\Models\\Notion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-20 12:16:00', '2021-07-20 12:16:00'),
(22, 'partner_rules', 'partner-rules', 'Partner Rule', 'Partner Rules', NULL, 'App\\Models\\PartnerRule', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-20 13:23:40', '2021-07-20 13:23:40');

-- --------------------------------------------------------

--
-- Структура таблицы `detailed_tasks`
--

CREATE TABLE `detailed_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_partner_task` text COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `location_type_id` bigint(20) UNSIGNED NOT NULL,
  `preference_id` bigint(20) UNSIGNED NOT NULL,
  `duration_id` bigint(20) UNSIGNED NOT NULL,
  `user_level_id` bigint(20) UNSIGNED NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `detailed_tasks`
--

INSERT INTO `detailed_tasks` (`id`, `description`, `custom_partner_task`, `location_type_id`, `preference_id`, `duration_id`, `user_level_id`, `gender_id`, `image`) VALUES
(18, 'Ходити на рука ви будете найпростішим способом, просто беріть і йдіть на тих руках до біса.', NULL, 3, 1, 1, 1, 1, NULL),
(19, 'Завязуєте очі і йдете на руках по канату між двома багатоповерхівками жонглюючи ногами пушечними ядрами. А з землі у вас будуть стріляти великокалібреного кулемету.', NULL, 3, 1, 1, 3, 1, NULL),
(20, 'Берете два яйця і смажите яєшню. До яєшні можна додати бекончику.', NULL, 1, 13, 1, 1, 2, NULL),
(21, 'Їдете на ферму алігаторів, ниряєте в озеро відбираєте в алігатора яйця. Якщо вам не відкусили руки, ноги чи голову то частуєте свого коханого яєшнею. Смачного!', NULL, 1, 13, 1, 3, 2, NULL),
(22, 'Копаєте яму на задньому дворі і лягаєте туди, притворяєтесь мертвим.', 'Сходіть на задній двір, там вас чекає сюрприз.', 2, 1, 2, 3, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `detailed_task_notion`
--

CREATE TABLE `detailed_task_notion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `detailed_task_id` bigint(20) UNSIGNED NOT NULL,
  `notion_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `detailed_task_notion`
--

INSERT INTO `detailed_task_notion` (`id`, `detailed_task_id`, `notion_id`) VALUES
(1, 18, 1),
(2, 19, 1),
(3, 20, 2),
(4, 21, 2),
(5, 20, 3),
(6, 21, 3);

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
  `location_description_id` bigint(20) UNSIGNED DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `detailed_task_id` bigint(20) UNSIGNED NOT NULL,
  `partner_task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_rejected` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `generated_tasks`
--

INSERT INTO `generated_tasks` (`id`, `user_id`, `partner_id`, `location_description_id`, `started_at`, `task_id`, `detailed_task_id`, `partner_task_id`, `is_rejected`, `created_at`, `updated_at`) VALUES
(47, 14, 3, 4, NULL, 1, 18, NULL, 1, '2021-07-20 08:14:56', '2021-07-20 08:23:34'),
(48, 14, 3, 4, '2021-07-23 09:30:00', 1, 18, NULL, 1, '2021-07-20 08:23:53', '2021-07-20 09:23:09'),
(49, 14, 3, 2, '2021-07-22 09:23:00', 2, 20, 37, 1, '2021-07-20 09:23:20', '2021-07-21 14:40:28'),
(50, 14, 3, 4, '2021-07-22 14:41:00', 1, 18, 36, 1, '2021-07-21 14:41:25', '2021-07-21 14:42:48'),
(51, 14, 3, 3, '2021-07-22 14:43:00', 1, 18, 32, NULL, '2021-07-21 14:43:16', '2021-07-21 14:43:16'),
(52, 19, 14, 3, NULL, 1, 18, 32, 1, '2021-07-21 15:18:04', '2021-07-21 15:18:24'),
(53, 19, 14, 4, NULL, 1, 18, 32, 1, '2021-07-21 15:18:30', '2021-07-21 15:19:05'),
(54, 19, 14, 1, NULL, 2, 20, 34, 1, '2021-07-21 15:19:32', '2021-07-21 15:19:40'),
(55, 19, 14, 4, NULL, 1, 18, 36, 1, '2021-07-21 15:25:38', '2021-07-21 15:25:54'),
(56, 19, 14, 4, NULL, 1, 18, 36, 1, '2021-07-21 15:26:18', '2021-07-21 15:26:30'),
(57, 19, 14, 4, NULL, 1, 18, 36, 1, '2021-07-21 15:26:56', '2021-07-21 15:27:02');

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
(10, 18, 14, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `locations`
--

INSERT INTO `locations` (`id`, `name`, `location_type_id`) VALUES
(1, 'Ресторан', 1),
(2, 'Дім', 1),
(3, 'Парк', 3),
(8, 'Сіновал', 2),
(13, 'Ліс', 2),
(14, 'Міст', 3),
(15, 'Готель', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `location_descriptions`
--

CREATE TABLE `location_descriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `location_descriptions`
--

INSERT INTO `location_descriptions` (`id`, `description`, `partner_description`, `location_id`) VALUES
(1, 'Cтвори затишну атмосферу у себе вдома, зроби тьмяне світло ароматичні свічки.', 'Сьогоді все відбудеться вдома.', 2),
(2, 'Зроби у невеличку перестановку у своєму домі, включи романтичну музику. Приготуйся гарно провести час.', 'Зручно влаштовуйся на своєму улюбленому кріслі.', 2),
(3, 'Знайди затишне місце у парку, де можна провести час.', 'Зустрінься зі своєю парою у парку.', 3),
(4, 'Знайди місце в парку звідки відкривається гарний вид на місто.', 'Приходь у ваш улюблений парк у місті.', 3),
(5, 'Зніми номер у затишному готелі.  Приготуйся гарно провести час.', 'Сьогодні романтична зустріч в готелі.', 15),
(6, 'Арендуй кучу сіна у фермера.', 'Приходть на ферму, буде цікаво :)', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `location_types`
--

CREATE TABLE `location_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `location_types`
--

INSERT INTO `location_types` (`id`, `name`) VALUES
(1, 'В приміщенні'),
(2, 'На дворі'),
(3, 'В публічних місцях'),
(4, 'Дистанційно');

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
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 7, '2021-07-06 08:28:43', '2021-07-19 13:48:37', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 16, 1, '2021-07-06 08:28:43', '2021-07-06 15:05:41', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 16, 2, '2021-07-06 08:28:44', '2021-07-06 15:05:42', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2021-07-06 08:28:44', '2021-07-19 13:48:37', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 8, '2021-07-06 08:28:44', '2021-07-19 13:48:37', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2021-07-06 08:28:48', '2021-07-06 09:18:28', 'voyager.hooks', NULL),
(12, 1, 'Genders', '', '_self', 'voyager-paw', '#000000', 16, 3, '2021-07-06 09:15:55', '2021-07-06 15:05:42', 'voyager.genders.index', 'null'),
(13, 1, 'User Levels', '', '_self', 'voyager-double-up', '#000000', 16, 4, '2021-07-06 13:01:18', '2021-07-06 15:05:43', 'voyager.user-levels.index', 'null'),
(15, 1, 'Partner Tasks', '', '_self', 'voyager-list-add', '#000000', 26, 3, '2021-07-06 13:27:51', '2021-07-19 15:30:47', 'voyager.partner-tasks.index', 'null'),
(16, 1, 'User Info', '', '_self', 'voyager-people', '#000000', NULL, 2, '2021-07-06 15:05:32', '2021-07-06 15:05:40', NULL, ''),
(18, 1, 'Accessories', '', '_self', 'voyager-trophy', '#000000', NULL, 5, '2021-07-16 11:59:29', '2021-07-19 13:48:52', 'voyager.accessories.index', 'null'),
(19, 1, 'Location Types', '', '_self', NULL, NULL, 21, 3, '2021-07-16 14:33:02', '2021-07-19 10:06:16', 'voyager.location-types.index', NULL),
(20, 1, 'Locations', '', '_self', NULL, NULL, 21, 1, '2021-07-16 14:35:43', '2021-07-16 14:44:06', 'voyager.locations.index', NULL),
(21, 1, 'Locations Info', '', '_self', 'voyager-location', '#000000', NULL, 4, '2021-07-16 14:43:45', '2021-07-19 13:48:52', NULL, ''),
(23, 1, 'Location Descriptions', '', '_self', NULL, NULL, 21, 2, '2021-07-19 10:04:06', '2021-07-19 10:06:16', 'voyager.location-descriptions.index', NULL),
(24, 1, 'Preferences', '', '_self', 'voyager-params', '#000000', 16, 5, '2021-07-19 13:10:12', '2021-07-19 15:32:17', 'voyager.preferences.index', 'null'),
(25, 1, 'Detailed Tasks', '', '_self', 'voyager-list', '#000000', 26, 2, '2021-07-19 13:40:34', '2021-07-19 15:30:56', 'voyager.detailed-tasks.index', 'null'),
(26, 1, 'Tasks Info', '', '_self', 'voyager-window-list', '#000000', NULL, 3, '2021-07-19 13:48:23', '2021-07-19 13:48:52', NULL, ''),
(27, 1, 'Tasks', '', '_self', 'voyager-star', '#000000', 26, 1, '2021-07-19 15:27:51', '2021-07-19 15:32:06', 'voyager.tasks.index', 'null'),
(28, 1, 'Rules', '', '_self', NULL, NULL, NULL, 9, '2021-07-20 12:15:11', '2021-07-20 12:15:11', 'voyager.rules.index', NULL),
(29, 1, 'Notions', '', '_self', NULL, NULL, NULL, 10, '2021-07-20 12:16:00', '2021-07-20 12:16:00', 'voyager.notions.index', NULL),
(30, 1, 'Partner Rules', '', '_self', NULL, NULL, NULL, 11, '2021-07-20 13:23:40', '2021-07-20 13:23:40', 'voyager.partner-rules.index', NULL);

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
(41, '2021_07_06_134848_create_detailed_tasks_table', 4),
(42, '2021_07_06_142445_create_partner_tasks_table', 4),
(43, '2021_07_06_143408_create_task_combinations_table', 5),
(44, '2021_07_19_144123_create_generated_tasks_table', 6),
(45, '2021_07_06_154841_create_likes_table', 7),
(46, '2021_07_15_113644_create_user_level_stack_table', 8),
(47, '2021_07_16_143544_create_task_accessory_table', 9),
(48, '2021_07_16_171027_create_user_location_table', 10),
(49, '2021_07_06_122507_create_location_types_table', 11),
(50, '2021_07_19_110119_create_locations_description_table', 12),
(51, '2021_07_19_180606_create_tasks_table', 13),
(52, '2021_07_20_142250_create_rules_table', 14),
(53, '2021_07_20_142644_create_notions_table', 14),
(54, '2021_07_20_144635_create_task_rule_table', 14),
(55, '2021_07_20_144648_create_detailed_task_notion_table', 14),
(56, '2021_07_20_155545_create_partner_rules_table', 15),
(57, '2021_07_20_155645_create_partner_task_rule_table', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `notions`
--

CREATE TABLE `notions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `notions`
--

INSERT INTO `notions` (`id`, `description`) VALUES
(1, 'Одягніть незвичний костюм'),
(2, 'Дізнайтеся які улюблені страви вашої половинки'),
(3, 'Якщо не вмієте готувати замовте страви в ресторані');

-- --------------------------------------------------------

--
-- Структура таблицы `partner_rules`
--

CREATE TABLE `partner_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `partner_rules`
--

INSERT INTO `partner_rules` (`id`, `description`) VALUES
(1, 'Вам ніхто не заважає просто прийти і понасолоджуватися вечерею, але якщо ви зробите якийсь сюрприз для вашої половинки, то вечір стане набагато цікавіше. Подумайте що для вашого коханого могло би бути приємним сюрпризом.');

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
(32, 'Допоможіть сходити до біса.', 2),
(33, 'Допоможіть зав\'язати очі партнеру, а потім стріляйте з великокаліберного кулемету по ньому під час його прохождення по канату.', 2),
(34, 'Купіть два яйца і м\'ясо у магазині.', 1),
(35, 'Вам потрібно звозити свою кохану на ферму алігаторів. Буде цікаво!', 2),
(36, 'Допоможіть партнеру зрозуміти сенс його задачі.', 2),
(37, 'Замаринуйте м\'ясо, та приготуйтеся смачно попоїсти.', 1),
(38, 'Сходіть на задній двір, там вас чекає сюрприз.', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `partner_task_rule`
--

CREATE TABLE `partner_task_rule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `partner_task_id` bigint(20) UNSIGNED NOT NULL,
  `partner_rule_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `partner_task_rule`
--

INSERT INTO `partner_task_rule` (`id`, `partner_task_id`, `partner_rule_id`) VALUES
(1, 34, 1),
(3, 35, 1),
(4, 37, 1);

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
(42, 'browse_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51'),
(43, 'read_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51'),
(44, 'edit_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51'),
(45, 'add_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51'),
(46, 'delete_partner_tasks', 'partner_tasks', '2021-07-06 13:27:51', '2021-07-06 13:27:51'),
(47, 'browse_accessories', 'accessories', '2021-07-16 11:59:29', '2021-07-16 11:59:29'),
(48, 'read_accessories', 'accessories', '2021-07-16 11:59:29', '2021-07-16 11:59:29'),
(49, 'edit_accessories', 'accessories', '2021-07-16 11:59:29', '2021-07-16 11:59:29'),
(50, 'add_accessories', 'accessories', '2021-07-16 11:59:29', '2021-07-16 11:59:29'),
(51, 'delete_accessories', 'accessories', '2021-07-16 11:59:29', '2021-07-16 11:59:29'),
(52, 'browse_location_types', 'location_types', '2021-07-16 14:33:02', '2021-07-16 14:33:02'),
(53, 'read_location_types', 'location_types', '2021-07-16 14:33:02', '2021-07-16 14:33:02'),
(54, 'edit_location_types', 'location_types', '2021-07-16 14:33:02', '2021-07-16 14:33:02'),
(55, 'add_location_types', 'location_types', '2021-07-16 14:33:02', '2021-07-16 14:33:02'),
(56, 'delete_location_types', 'location_types', '2021-07-16 14:33:02', '2021-07-16 14:33:02'),
(57, 'browse_locations', 'locations', '2021-07-16 14:35:43', '2021-07-16 14:35:43'),
(58, 'read_locations', 'locations', '2021-07-16 14:35:43', '2021-07-16 14:35:43'),
(59, 'edit_locations', 'locations', '2021-07-16 14:35:43', '2021-07-16 14:35:43'),
(60, 'add_locations', 'locations', '2021-07-16 14:35:43', '2021-07-16 14:35:43'),
(61, 'delete_locations', 'locations', '2021-07-16 14:35:43', '2021-07-16 14:35:43'),
(62, 'browse_locations_description', 'locations_description', '2021-07-19 09:56:23', '2021-07-19 09:56:23'),
(63, 'read_locations_description', 'locations_description', '2021-07-19 09:56:23', '2021-07-19 09:56:23'),
(64, 'edit_locations_description', 'locations_description', '2021-07-19 09:56:23', '2021-07-19 09:56:23'),
(65, 'add_locations_description', 'locations_description', '2021-07-19 09:56:23', '2021-07-19 09:56:23'),
(66, 'delete_locations_description', 'locations_description', '2021-07-19 09:56:23', '2021-07-19 09:56:23'),
(67, 'browse_location_descriptions', 'location_descriptions', '2021-07-19 10:04:06', '2021-07-19 10:04:06'),
(68, 'read_location_descriptions', 'location_descriptions', '2021-07-19 10:04:06', '2021-07-19 10:04:06'),
(69, 'edit_location_descriptions', 'location_descriptions', '2021-07-19 10:04:06', '2021-07-19 10:04:06'),
(70, 'add_location_descriptions', 'location_descriptions', '2021-07-19 10:04:06', '2021-07-19 10:04:06'),
(71, 'delete_location_descriptions', 'location_descriptions', '2021-07-19 10:04:06', '2021-07-19 10:04:06'),
(72, 'browse_preferences', 'preferences', '2021-07-19 13:10:12', '2021-07-19 13:10:12'),
(73, 'read_preferences', 'preferences', '2021-07-19 13:10:12', '2021-07-19 13:10:12'),
(74, 'edit_preferences', 'preferences', '2021-07-19 13:10:12', '2021-07-19 13:10:12'),
(75, 'add_preferences', 'preferences', '2021-07-19 13:10:12', '2021-07-19 13:10:12'),
(76, 'delete_preferences', 'preferences', '2021-07-19 13:10:12', '2021-07-19 13:10:12'),
(77, 'browse_detailed_tasks', 'detailed_tasks', '2021-07-19 13:40:34', '2021-07-19 13:40:34'),
(78, 'read_detailed_tasks', 'detailed_tasks', '2021-07-19 13:40:34', '2021-07-19 13:40:34'),
(79, 'edit_detailed_tasks', 'detailed_tasks', '2021-07-19 13:40:34', '2021-07-19 13:40:34'),
(80, 'add_detailed_tasks', 'detailed_tasks', '2021-07-19 13:40:34', '2021-07-19 13:40:34'),
(81, 'delete_detailed_tasks', 'detailed_tasks', '2021-07-19 13:40:34', '2021-07-19 13:40:34'),
(82, 'browse_tasks', 'tasks', '2021-07-19 15:27:51', '2021-07-19 15:27:51'),
(83, 'read_tasks', 'tasks', '2021-07-19 15:27:51', '2021-07-19 15:27:51'),
(84, 'edit_tasks', 'tasks', '2021-07-19 15:27:51', '2021-07-19 15:27:51'),
(85, 'add_tasks', 'tasks', '2021-07-19 15:27:51', '2021-07-19 15:27:51'),
(86, 'delete_tasks', 'tasks', '2021-07-19 15:27:51', '2021-07-19 15:27:51'),
(87, 'browse_rules', 'rules', '2021-07-20 12:15:11', '2021-07-20 12:15:11'),
(88, 'read_rules', 'rules', '2021-07-20 12:15:11', '2021-07-20 12:15:11'),
(89, 'edit_rules', 'rules', '2021-07-20 12:15:11', '2021-07-20 12:15:11'),
(90, 'add_rules', 'rules', '2021-07-20 12:15:11', '2021-07-20 12:15:11'),
(91, 'delete_rules', 'rules', '2021-07-20 12:15:11', '2021-07-20 12:15:11'),
(92, 'browse_notions', 'notions', '2021-07-20 12:16:00', '2021-07-20 12:16:00'),
(93, 'read_notions', 'notions', '2021-07-20 12:16:00', '2021-07-20 12:16:00'),
(94, 'edit_notions', 'notions', '2021-07-20 12:16:00', '2021-07-20 12:16:00'),
(95, 'add_notions', 'notions', '2021-07-20 12:16:00', '2021-07-20 12:16:00'),
(96, 'delete_notions', 'notions', '2021-07-20 12:16:00', '2021-07-20 12:16:00'),
(97, 'browse_partner_rules', 'partner_rules', '2021-07-20 13:23:40', '2021-07-20 13:23:40'),
(98, 'read_partner_rules', 'partner_rules', '2021-07-20 13:23:40', '2021-07-20 13:23:40'),
(99, 'edit_partner_rules', 'partner_rules', '2021-07-20 13:23:40', '2021-07-20 13:23:40'),
(100, 'add_partner_rules', 'partner_rules', '2021-07-20 13:23:40', '2021-07-20 13:23:40'),
(101, 'delete_partner_rules', 'partner_rules', '2021-07-20 13:23:40', '2021-07-20 13:23:40');

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
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1);

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
(3, 'Концерти'),
(13, 'Домашня кухня');

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
-- Структура таблицы `rules`
--

CREATE TABLE `rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rules`
--

INSERT INTO `rules` (`id`, `description`) VALUES
(1, 'Побачення – незамінні для тривалих міцних стосунків! Такі маленькі паузи-втечі від реальності тільки вдвох дозволяють подивитись один на одного і на стосунки дещо по-іншому, свіжим поглядом і знову закохатись в партнера.');

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
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type_id` bigint(20) UNSIGNED NOT NULL,
  `preference_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `description`, `partner_description`, `location_type_id`, `preference_id`) VALUES
(1, 'Сьогодні ви будете займатися хотьбою на руках, перший раз в житті спробуєте цей дивовижний пересування, відомий людству з давніх давен.', 'Сьогодні буде дуже весело.', 3, 1),
(2, 'Сьогодні ви будете готувати яєшню.', 'Сьогодні ви смачно поїсте.', 1, 13),
(3, 'Сьогодні ви будете готувати торт.', 'Сьогодні ви скуштуєте щось солоденьке.', 1, 13);

-- --------------------------------------------------------

--
-- Структура таблицы `task_accessory`
--

CREATE TABLE `task_accessory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `detailed_task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `accessory_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_accessory`
--

INSERT INTO `task_accessory` (`id`, `detailed_task_id`, `accessory_id`) VALUES
(12, 20, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `task_combinations`
--

CREATE TABLE `task_combinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `detailed_task_id` bigint(20) UNSIGNED NOT NULL,
  `partner_task_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_combinations`
--

INSERT INTO `task_combinations` (`id`, `detailed_task_id`, `partner_task_id`) VALUES
(14, 18, 32),
(15, 19, 33),
(16, 20, 34),
(17, 21, 35),
(18, 18, 36),
(19, 20, 37),
(20, 22, 38);

-- --------------------------------------------------------

--
-- Структура таблицы `task_rule`
--

CREATE TABLE `task_rule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `rule_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_rule`
--

INSERT INTO `task_rule` (`id`, `task_id`, `rule_id`) VALUES
(1, 2, 1),
(2, 1, 1);

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
  `duration_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `partner_email`, `gender_id`, `duration_id`) VALUES
(1, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$vALnBdtdRR7MYVorxGGEi.NwolxJ3R3/vqYPV1xdq2SyFdeBHjDre', NULL, '{\"locale\":\"en\"}', '2021-07-06 08:30:05', '2021-07-12 11:52:52', NULL, NULL, NULL),
(3, 2, 'John', 'john@laravel.test', 'users/default.png', NULL, '$2y$10$Vh0l/JzwtwBnCDcquRcOr.zfMsVUA57ebiHe2zL6X90e9CzPdjATO', NULL, NULL, '2021-07-07 05:56:24', '2021-07-16 13:18:17', 'vyacheslav.oleshko.work@gmail.com', 1, 2),
(14, 2, 'Viacheslav', 'vyacheslav.oleshko.work@gmail.com', 'users/default.png', NULL, '$2y$10$McRMdlbXwnsrCQseuaM8yuck9Sa6kARczRgd/prCEi2QG9Z3RigC.', NULL, NULL, '2021-07-07 11:46:32', '2021-07-19 13:29:20', 'john@laravel.test', 1, 1),
(19, 2, 'Girl', 'girl@laravel.test', 'users/default.png', NULL, '$2y$10$XOW2AkhBgL2DEoFDo1zyeun6PYSkXPqkBU0ahWJiBFFEuGgkkhxmO', NULL, NULL, '2021-07-21 15:16:20', '2021-07-21 15:17:58', 'vyacheslav.oleshko.work@gmail.com', 2, 1);

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
-- Структура таблицы `user_level_stack`
--

CREATE TABLE `user_level_stack` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_level_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_level_stack`
--

INSERT INTO `user_level_stack` (`id`, `user_id`, `user_level_id`) VALUES
(22, 14, 1),
(23, 14, 2),
(24, 3, 1),
(25, 3, 2),
(26, 14, 3),
(27, 19, 1),
(28, 19, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user_location`
--

CREATE TABLE `user_location` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_location`
--

INSERT INTO `user_location` (`id`, `user_id`, `location_id`) VALUES
(1, 14, 2),
(6, 3, 2),
(7, 3, 3),
(8, 14, 1),
(11, 14, 3),
(13, 19, 2),
(14, 19, 3),
(15, 19, 8),
(16, 19, 15);

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
(101, 14, 1),
(102, 3, 13),
(103, 14, 13),
(104, 19, 1),
(105, 19, 13);

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
  ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `detailed_tasks`
--
ALTER TABLE `detailed_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detailed_tasks_preference_id_index` (`preference_id`) USING BTREE,
  ADD KEY `detailed_tasks_location_type_id_index` (`location_type_id`) USING BTREE,
  ADD KEY `detailed_tasks_gender_id_index` (`gender_id`) USING BTREE,
  ADD KEY `detailed_tasks_user_level_id_index` (`user_level_id`) USING BTREE,
  ADD KEY `detailed_tasks_duration_id_index` (`duration_id`) USING BTREE;

--
-- Индексы таблицы `detailed_task_notion`
--
ALTER TABLE `detailed_task_notion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detailed_task_notion_detailed_task_id_index` (`detailed_task_id`),
  ADD KEY `detailed_task_notion_notion_id_index` (`notion_id`);

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
  ADD KEY `generated_tasks_task_id_index` (`task_id`),
  ADD KEY `generated_tasks_partner_task_id_index` (`partner_task_id`),
  ADD KEY `generated_tasks_location_description_id_index` (`location_description_id`),
  ADD KEY `generated_tasks_detailed_task_id_index` (`detailed_task_id`);

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
  ADD KEY `locations_location_type_id_index` (`location_type_id`);

--
-- Индексы таблицы `location_descriptions`
--
ALTER TABLE `location_descriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_description_location_id_index` (`location_id`);

--
-- Индексы таблицы `location_types`
--
ALTER TABLE `location_types`
  ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `notions`
--
ALTER TABLE `notions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_rules`
--
ALTER TABLE `partner_rules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_tasks`
--
ALTER TABLE `partner_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_tasks_gender_id_index` (`gender_id`);

--
-- Индексы таблицы `partner_task_rule`
--
ALTER TABLE `partner_task_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_task_rule_partner_task_id_index` (`partner_task_id`),
  ADD KEY `partner_task_rule_partner_rule_id_index` (`partner_rule_id`);

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
-- Индексы таблицы `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `tasks_location_type_id_index` (`location_type_id`),
  ADD KEY `tasks_preference_id_index` (`preference_id`);

--
-- Индексы таблицы `task_accessory`
--
ALTER TABLE `task_accessory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_accessory_accessory_id_index` (`accessory_id`),
  ADD KEY `task_accessory_detailed_task_id_index` (`detailed_task_id`) USING BTREE;

--
-- Индексы таблицы `task_combinations`
--
ALTER TABLE `task_combinations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_combinations_partner_task_id_index` (`partner_task_id`),
  ADD KEY `task_combinations_detailed_task_id_index` (`detailed_task_id`) USING BTREE;

--
-- Индексы таблицы `task_rule`
--
ALTER TABLE `task_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_rule_task_id_index` (`task_id`),
  ADD KEY `task_rule_rule_id_index` (`rule_id`);

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
  ADD KEY `users_duration_id_index` (`duration_id`) USING BTREE,
  ADD KEY `gender_id` (`gender_id`);

--
-- Индексы таблицы `user_levels`
--
ALTER TABLE `user_levels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_level_stack`
--
ALTER TABLE `user_level_stack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level_stack_user_id_index` (`user_id`),
  ADD KEY `user_level_stack_user_level_id_index` (`user_level_id`);

--
-- Индексы таблицы `user_location`
--
ALTER TABLE `user_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_location_user_id_index` (`user_id`),
  ADD KEY `user_location_location_id_index` (`location_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `detailed_tasks`
--
ALTER TABLE `detailed_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `detailed_task_notion`
--
ALTER TABLE `detailed_task_notion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `location_descriptions`
--
ALTER TABLE `location_descriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `location_types`
--
ALTER TABLE `location_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT для таблицы `notions`
--
ALTER TABLE `notions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `partner_rules`
--
ALTER TABLE `partner_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `partner_tasks`
--
ALTER TABLE `partner_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `partner_task_rule`
--
ALTER TABLE `partner_task_rule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT для таблицы `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rules`
--
ALTER TABLE `rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `task_accessory`
--
ALTER TABLE `task_accessory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `task_combinations`
--
ALTER TABLE `task_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `task_rule`
--
ALTER TABLE `task_rule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user_level_stack`
--
ALTER TABLE `user_level_stack`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `user_location`
--
ALTER TABLE `user_location`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `user_preference`
--
ALTER TABLE `user_preference`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `detailed_tasks`
--
ALTER TABLE `detailed_tasks`
  ADD CONSTRAINT `detailed_tasks_duration_id_foreign` FOREIGN KEY (`duration_id`) REFERENCES `durations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detailed_tasks_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detailed_tasks_ibfk_1` FOREIGN KEY (`location_type_id`) REFERENCES `location_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detailed_tasks_preference_id_foreign` FOREIGN KEY (`preference_id`) REFERENCES `preferences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detailed_tasks_user_level_id_foreign` FOREIGN KEY (`user_level_id`) REFERENCES `user_levels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `detailed_task_notion`
--
ALTER TABLE `detailed_task_notion`
  ADD CONSTRAINT `detailed_task_notion_detailed_task_id_foreign` FOREIGN KEY (`detailed_task_id`) REFERENCES `detailed_tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detailed_task_notion_notion_id_foreign` FOREIGN KEY (`notion_id`) REFERENCES `notions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `generated_tasks`
--
ALTER TABLE `generated_tasks`
  ADD CONSTRAINT `generated_tasks_ibfk_1` FOREIGN KEY (`location_description_id`) REFERENCES `location_descriptions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `generated_tasks_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `generated_tasks_ibfk_3` FOREIGN KEY (`detailed_task_id`) REFERENCES `detailed_tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `generated_tasks_partner_task_id_foreign` FOREIGN KEY (`partner_task_id`) REFERENCES `task_combinations` (`partner_task_id`),
  ADD CONSTRAINT `generated_tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `detailed_tasks` (`id`),
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`location_type_id`) REFERENCES `location_types` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `location_descriptions`
--
ALTER TABLE `location_descriptions`
  ADD CONSTRAINT `locations_description_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

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
-- Ограничения внешнего ключа таблицы `partner_task_rule`
--
ALTER TABLE `partner_task_rule`
  ADD CONSTRAINT `partner_task_rule_partner_rule_id_foreign` FOREIGN KEY (`partner_rule_id`) REFERENCES `partner_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `partner_task_rule_partner_task_id_foreign` FOREIGN KEY (`partner_task_id`) REFERENCES `partner_tasks` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `tasks_location_type_id_foreign` FOREIGN KEY (`location_type_id`) REFERENCES `location_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_preference_id_foreign` FOREIGN KEY (`preference_id`) REFERENCES `preferences` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_accessory`
--
ALTER TABLE `task_accessory`
  ADD CONSTRAINT `task_accessory_accessory_id_foreign` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_accessory_task_id_foreign` FOREIGN KEY (`detailed_task_id`) REFERENCES `detailed_tasks` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_combinations`
--
ALTER TABLE `task_combinations`
  ADD CONSTRAINT `task_combinations_partner_task_id_foreign` FOREIGN KEY (`partner_task_id`) REFERENCES `partner_tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_combinations_task_id_foreign` FOREIGN KEY (`detailed_task_id`) REFERENCES `detailed_tasks` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_rule`
--
ALTER TABLE `task_rule`
  ADD CONSTRAINT `task_rule_rule_id_foreign` FOREIGN KEY (`rule_id`) REFERENCES `rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_rule_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`duration_id`) REFERENCES `durations` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_level_stack`
--
ALTER TABLE `user_level_stack`
  ADD CONSTRAINT `user_level_stack_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_level_stack_user_level_id_foreign` FOREIGN KEY (`user_level_id`) REFERENCES `user_levels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_location`
--
ALTER TABLE `user_location`
  ADD CONSTRAINT `user_location_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_location_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
