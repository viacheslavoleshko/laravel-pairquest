-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 27 2021 г., 15:02
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
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `accessories`
--

INSERT INTO `accessories` (`id`, `name`, `description`, `image`, `url`) VALUES
(9, 'Вино', 'Як правильно вибрати вино – ми навчимо', 'accessories\\July2021\\75IifsPRru9n1ELu9gep.png', 'https://rozetka.com.ua/vino/c4594285/'),
(10, 'Сукня', NULL, NULL, NULL),
(13, 'Фотоапарат', NULL, NULL, NULL),
(22, 'Панамка', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'voluptas'),
(2, 'consequuntur'),
(3, 'assumenda'),
(4, 'dolore'),
(5, 'nam');

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
(30, 1, 'user_hasone_user_level_relationship', 'relationship', 'User Level', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\UserLevel\",\"table\":\"user_levels\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(47, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(49, 8, 'gender_id', 'text', 'Gender Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(50, 8, 'partner_task_belongsto_gender_relationship', 'relationship', 'Gender', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Gender\",\"table\":\"genders\",\"type\":\"belongsTo\",\"column\":\"gender_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(51, 8, 'partner_task_belongstomany_task_relationship', 'relationship', 'Main task', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\DetailedTask\",\"table\":\"detailed_tasks\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"task_combinations\",\"pivot\":\"1\",\"taggable\":\"on\"}', 5),
(54, 8, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 4),
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
(117, 14, 'partner_description', 'text', 'Partner Description', 1, 1, 1, 1, 1, 1, '{}', 5),
(118, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(119, 23, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(120, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(121, 24, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(122, 24, 'content', 'text', 'Content', 1, 1, 1, 1, 1, 1, '{}', 4),
(123, 24, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 5),
(124, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(125, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(126, 24, 'category_id', 'text', 'Category Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(127, 24, 'post_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(128, 23, 'category_hasmany_post_relationship', 'relationship', 'posts', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Post\",\"table\":\"posts\",\"type\":\"hasMany\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(129, 14, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 6),
(130, 18, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 9),
(131, 8, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 7),
(132, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(133, 26, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(134, 26, 'feedback_type_hasmany_feedback_relationship', 'relationship', 'feedback', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Feedback\",\"table\":\"feedback\",\"type\":\"hasMany\",\"column\":\"type_id\",\"key\":\"id\",\"label\":\"feedback\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":null}', 3),
(135, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(136, 27, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(137, 27, 'type_id', 'text', 'Type Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(138, 27, 'feedback', 'text', 'Feedback', 1, 1, 1, 1, 1, 1, '{}', 4),
(139, 27, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(140, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(141, 27, 'feedback_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(142, 27, 'feedback_belongsto_feedback_type_relationship', 'relationship', 'feedback_types', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\FeedbackType\",\"table\":\"feedback_types\",\"type\":\"belongsTo\",\"column\":\"type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accessories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(143, 10, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(144, 10, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
(145, 10, 'url', 'text', 'Url', 0, 1, 1, 1, 1, 1, '{}', 5),
(146, 1, 'telegram_user_id', 'text', 'Telegram User Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(147, 1, 'duration_id', 'text', 'Duration Id', 0, 1, 1, 1, 1, 1, '{}', 4);

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
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-07-06 08:28:42', '2021-07-27 08:24:29'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-07-06 08:28:42', '2021-07-06 08:28:42'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-07-06 08:28:42', '2021-07-06 08:28:42'),
(4, 'genders', 'genders', 'Gender', 'Genders', NULL, 'App\\Models\\Gender', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-06 09:15:55', '2021-07-07 05:36:12'),
(6, 'user_levels', 'user-levels', 'User Level', 'User Levels', NULL, 'App\\Models\\UserLevel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-06 13:01:18', '2021-07-06 13:01:18'),
(8, 'partner_tasks', 'partner-tasks', 'Partner Task', 'Partner Tasks', NULL, 'App\\Models\\PartnerTask', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-06 13:27:51', '2021-07-26 10:03:23'),
(10, 'accessories', 'accessories', 'Accessory', 'Accessories', NULL, 'App\\Models\\Accessory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-16 11:59:29', '2021-07-26 15:43:05'),
(11, 'location_types', 'location-types', 'Location Type', 'Location Types', NULL, 'App\\Models\\LocationType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-16 14:33:02', '2021-07-16 14:42:10'),
(12, 'locations', 'locations', 'Location', 'Locations', NULL, 'App\\Models\\Location', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-16 14:35:43', '2021-07-19 10:06:02'),
(13, 'locations_description', 'locations-description', 'Locations Description', 'Locations Descriptions', NULL, 'App\\Models\\LocationDescription', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 09:56:23', '2021-07-19 09:57:27'),
(14, 'location_descriptions', 'location-descriptions', 'Location Description', 'Location Descriptions', NULL, 'App\\Models\\LocationDescription', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 10:04:06', '2021-07-26 10:02:39'),
(15, 'preferences', 'preferences', 'Preference', 'Preferences', NULL, 'App\\Models\\Preference', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 13:10:12', '2021-07-19 14:18:55'),
(16, 'detailed_tasks', 'detailed-tasks', 'Detailed Task', 'Detailed Tasks', NULL, 'App\\Models\\DetailedTask', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 13:40:33', '2021-07-21 07:54:32'),
(18, 'tasks', 'tasks', 'Task', 'Tasks', NULL, 'App\\Models\\Task', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-19 15:27:51', '2021-07-26 10:03:04'),
(19, 'rules', 'rules', 'Rule', 'Rules', NULL, 'App\\Models\\Rule', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-20 12:15:10', '2021-07-20 12:15:10'),
(20, 'notions', 'notions', 'Notion', 'Notions', NULL, 'App\\Models\\Notion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-20 12:16:00', '2021-07-20 12:16:00'),
(22, 'partner_rules', 'partner-rules', 'Partner Rule', 'Partner Rules', NULL, 'App\\Models\\PartnerRule', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-20 13:23:40', '2021-07-20 13:23:40'),
(23, 'categories', 'categories', 'Category', 'Categories', NULL, 'App\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-22 09:44:30', '2021-07-22 09:46:39'),
(24, 'posts', 'posts', 'Post', 'Posts', NULL, 'App\\Models\\Post', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-22 09:44:47', '2021-07-22 09:45:49'),
(26, 'feedback_types', 'feedback-types', 'Feedback Type', 'Feedback Types', NULL, 'App\\Models\\FeedbackType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-26 13:43:59', '2021-07-26 13:43:59'),
(27, 'feedback', 'feedback', 'Feedback', 'Feedback', NULL, 'App\\Models\\Feedback', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-26 13:45:00', '2021-07-26 13:45:54');

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
(20, 'Берете два яйця і смажите яєшню. До яєшні можна додати бекончику.', NULL, 1, 13, 1, 1, 2, 'detailed-tasks\\July2021\\v8g3b3eAbHW9G4a2K3LP.png'),
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
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `type_id`, `feedback`, `created_at`, `updated_at`) VALUES
(1, 14, 2, 'test', '2021-07-26 13:31:28', '2021-07-26 13:31:28'),
(2, 32, 1, 'fwreagfawe', '2021-07-26 14:16:47', '2021-07-26 14:16:47');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback_types`
--

CREATE TABLE `feedback_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `feedback_types`
--

INSERT INTO `feedback_types` (`id`, `name`) VALUES
(1, 'Ідея'),
(2, 'Побажання'),
(3, 'Технічна проблема'),
(4, 'Зауваження'),
(5, 'Проблема з оплатою');

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
(51, 14, 3, 3, '2021-07-22 14:43:00', 1, 18, 32, 1, '2021-07-21 14:43:16', '2021-07-23 10:03:55'),
(52, 19, 14, 3, NULL, 1, 18, 32, 1, '2021-07-21 15:18:04', '2021-07-21 15:18:24'),
(53, 19, 14, 4, NULL, 1, 18, 32, 1, '2021-07-21 15:18:30', '2021-07-21 15:19:05'),
(54, 19, 14, 1, NULL, 2, 20, 34, 1, '2021-07-21 15:19:32', '2021-07-21 15:19:40'),
(55, 19, 14, 4, NULL, 1, 18, 36, 1, '2021-07-21 15:25:38', '2021-07-21 15:25:54'),
(56, 19, 14, 4, NULL, 1, 18, 36, 1, '2021-07-21 15:26:18', '2021-07-21 15:26:30'),
(57, 19, 14, 4, NULL, 1, 18, 36, 1, '2021-07-21 15:26:56', '2021-07-21 15:27:02'),
(58, 14, 3, 3, '2021-07-24 13:03:00', 1, 18, 32, 1, '2021-07-23 13:04:03', '2021-07-23 13:06:23'),
(59, 14, 3, 1, NULL, 3, 20, 34, 1, '2021-07-23 13:09:31', '2021-07-23 13:10:56'),
(60, 14, 3, 2, NULL, 3, 20, 37, 1, '2021-07-23 13:11:13', '2021-07-23 13:21:51'),
(61, 14, 3, 3, NULL, 1, 18, 32, 1, '2021-07-23 13:22:00', '2021-07-23 13:52:02'),
(62, 14, 3, 1, NULL, 3, 20, 37, 1, '2021-07-23 13:52:29', '2021-07-23 13:54:30'),
(63, 14, 3, 3, '2021-07-24 13:54:00', 1, 18, 32, 1, '2021-07-23 13:54:39', '2021-07-23 13:55:15'),
(64, 14, 3, 3, '2021-07-24 13:55:00', 1, 18, 32, 1, '2021-07-23 13:55:25', '2021-07-23 13:57:13'),
(65, 14, 3, 3, '2021-07-24 13:57:00', 1, 18, 36, 1, '2021-07-23 13:57:23', '2021-07-23 14:13:57'),
(66, 14, 3, 4, '2021-07-25 14:15:00', 1, 18, 36, 1, '2021-07-23 14:15:16', '2021-07-23 14:16:03'),
(67, 3, 14, 1, NULL, 3, 20, 34, 1, '2021-07-23 14:16:14', '2021-07-23 14:23:25'),
(68, 3, 14, 3, '2021-07-24 14:23:00', 1, 18, 32, 1, '2021-07-23 14:23:49', '2021-07-23 14:27:36'),
(69, 3, 14, 3, '2021-07-24 15:51:00', 1, 18, 32, 1, '2021-07-23 15:51:55', '2021-07-23 15:54:34'),
(70, 3, 14, 4, '2021-07-24 07:19:00', 1, 18, 36, 0, '2021-07-26 07:19:24', '2021-07-26 07:24:09'),
(71, 14, 3, 2, NULL, 3, 20, 37, 0, '2021-07-26 07:25:46', '2021-07-26 07:26:51'),
(72, 14, 3, 4, NULL, 1, 18, 36, 0, '2021-07-26 07:27:30', '2021-07-26 07:27:38'),
(73, 14, 3, 4, NULL, 1, 18, 32, 0, '2021-07-26 07:30:34', '2021-07-26 07:30:41'),
(74, 3, 14, 3, NULL, 1, 18, 36, 0, '2021-07-26 07:31:17', '2021-07-26 07:31:51'),
(75, 14, 3, 3, NULL, 1, 18, 36, 0, '2021-07-26 07:32:09', '2021-07-26 07:32:16'),
(76, 14, 3, 4, NULL, 1, 18, 32, 0, '2021-07-26 07:34:25', '2021-07-26 07:34:32'),
(77, 14, 3, 2, NULL, 3, 20, 37, 0, '2021-07-26 07:36:08', '2021-07-26 07:36:12'),
(78, 14, 3, 3, NULL, 1, 18, 36, 0, '2021-07-26 07:38:58', '2021-07-26 07:44:12'),
(79, 3, 14, 4, NULL, 1, 18, 36, 0, '2021-07-26 07:51:56', '2021-07-26 07:52:02'),
(80, 3, 14, 2, NULL, 2, 20, 37, 0, '2021-07-26 07:52:23', '2021-07-26 07:52:30'),
(81, 14, 3, 1, NULL, 3, 20, 34, 1, '2021-07-26 09:28:23', '2021-07-26 10:42:03'),
(82, 14, 3, 2, NULL, 2, 20, 34, NULL, '2021-07-26 10:42:15', '2021-07-26 10:42:15'),
(83, 32, 14, 2, '2021-07-27 14:31:00', 3, 20, 34, 1, '2021-07-26 14:32:01', '2021-07-26 14:33:50'),
(84, 32, 14, 1, '2021-07-27 14:31:00', 3, 20, 34, 1, '2021-07-26 14:32:25', '2021-07-26 14:33:54'),
(85, 32, 14, 1, '2021-07-27 14:34:00', 2, 20, 37, 0, '2021-07-26 14:34:19', '2021-07-26 14:42:48'),
(86, 32, 14, 1, NULL, 3, 20, 34, NULL, '2021-07-26 15:15:44', '2021-07-26 15:15:44');

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
(10, 18, 14, 1),
(11, 20, 14, 1),
(12, 20, 32, 1);

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
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `location_descriptions`
--

INSERT INTO `location_descriptions` (`id`, `description`, `partner_description`, `location_id`, `image`) VALUES
(1, 'Cтвори затишну атмосферу у себе вдома, зроби тьмяне світло ароматичні свічки.', 'Сьогоді все відбудеться вдома.', 2, 'location-descriptions\\July2021\\FebMSUi8ZkdC8JwWsXUF.png'),
(2, 'Зроби у невеличку перестановку у своєму домі, включи романтичну музику. Приготуйся гарно провести час.', 'Зручно влаштовуйся на своєму улюбленому кріслі.', 2, 'location-descriptions\\July2021\\ZAl92QzTWUqA4ZjDKlpL.png'),
(3, 'Знайди затишне місце у парку, де можна провести час.', 'Зустрінься зі своєю парою у парку.', 3, 'location-descriptions\\July2021\\ECDNs8LHKbF3YFj82YAf.png'),
(4, 'Знайди місце в парку звідки відкривається гарний вид на місто.', 'Приходь у ваш улюблений парк у місті.', 3, 'location-descriptions\\July2021\\USbNAKsSoOZWjauxycFQ.png'),
(5, 'Зніми номер у затишному готелі.  Приготуйся гарно провести час.', 'Сьогодні романтична зустріч в готелі.', 15, NULL),
(6, 'Арендуй кучу сіна у фермера.', 'Приходть на ферму, буде цікаво :)', 8, NULL);

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
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 9, '2021-07-06 08:28:43', '2021-07-26 13:47:14', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 16, 1, '2021-07-06 08:28:43', '2021-07-06 15:05:41', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 16, 2, '2021-07-06 08:28:44', '2021-07-06 15:05:42', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2021-07-06 08:28:44', '2021-07-26 13:47:14', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2021-07-06 08:28:44', '2021-07-06 09:18:28', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2021-07-06 08:28:44', '2021-07-26 13:47:14', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2021-07-06 08:28:48', '2021-07-06 09:18:28', 'voyager.hooks', NULL),
(12, 1, 'Genders', '', '_self', 'voyager-paw', '#000000', 16, 3, '2021-07-06 09:15:55', '2021-07-06 15:05:42', 'voyager.genders.index', 'null'),
(13, 1, 'User Levels', '', '_self', 'voyager-double-up', '#000000', 16, 4, '2021-07-06 13:01:18', '2021-07-06 15:05:43', 'voyager.user-levels.index', 'null'),
(15, 1, 'Partner Tasks', '', '_self', 'voyager-list-add', '#000000', 32, 2, '2021-07-06 13:27:51', '2021-07-22 09:43:00', 'voyager.partner-tasks.index', 'null'),
(16, 1, 'User Info', '', '_self', 'voyager-people', '#000000', NULL, 2, '2021-07-06 15:05:32', '2021-07-06 15:05:40', NULL, ''),
(18, 1, 'Accessories', '', '_self', 'voyager-trophy', '#000000', 32, 4, '2021-07-16 11:59:29', '2021-07-26 13:47:14', 'voyager.accessories.index', 'null'),
(19, 1, 'Location Types', '', '_self', 'voyager-location', '#000000', 21, 3, '2021-07-16 14:33:02', '2021-07-22 09:52:26', 'voyager.location-types.index', 'null'),
(20, 1, 'Locations', '', '_self', 'voyager-location', '#000000', 21, 1, '2021-07-16 14:35:43', '2021-07-22 09:52:11', 'voyager.locations.index', 'null'),
(21, 1, 'Locations Info', '', '_self', 'voyager-location', '#000000', NULL, 5, '2021-07-16 14:43:45', '2021-07-22 09:42:42', NULL, ''),
(23, 1, 'Location Descriptions', '', '_self', 'voyager-location', '#000000', 21, 2, '2021-07-19 10:04:06', '2021-07-22 09:52:19', 'voyager.location-descriptions.index', 'null'),
(24, 1, 'Preferences', '', '_self', 'voyager-params', '#000000', 16, 5, '2021-07-19 13:10:12', '2021-07-19 15:32:17', 'voyager.preferences.index', 'null'),
(25, 1, 'Detailed Tasks', '', '_self', 'voyager-list', '#000000', 32, 1, '2021-07-19 13:40:34', '2021-07-22 09:42:49', 'voyager.detailed-tasks.index', 'null'),
(26, 1, 'Tasks Info', '', '_blank', 'voyager-window-list', '#000000', NULL, 3, '2021-07-19 13:48:23', '2021-07-22 09:41:20', NULL, ''),
(27, 1, 'Tasks', '', '_self', 'voyager-star', '#000000', 26, 1, '2021-07-19 15:27:51', '2021-07-22 09:41:58', 'voyager.tasks.index', 'null'),
(28, 1, 'Rules', '', '_self', 'voyager-info-circled', '#000000', 26, 2, '2021-07-20 12:15:11', '2021-07-22 09:41:59', 'voyager.rules.index', 'null'),
(29, 1, 'Notions', '', '_self', 'voyager-lightbulb', '#000000', 32, 3, '2021-07-20 12:16:00', '2021-07-22 09:43:00', 'voyager.notions.index', 'null'),
(30, 1, 'Partner Rules', '', '_self', 'voyager-info-circled', '#000000', 26, 3, '2021-07-20 13:23:40', '2021-07-22 09:42:00', 'voyager.partner-rules.index', 'null'),
(32, 1, 'Detailed Tasks Info', '', '_self', 'voyager-documentation', '#000000', NULL, 4, '2021-07-22 09:42:35', '2021-07-22 09:44:10', NULL, ''),
(33, 1, 'Categories', '', '_self', 'voyager-categories', '#000000', 35, 2, '2021-07-22 09:44:30', '2021-07-22 09:50:21', 'voyager.categories.index', 'null'),
(34, 1, 'Posts', '', '_self', 'voyager-news', '#000000', 35, 1, '2021-07-22 09:44:48', '2021-07-22 09:50:19', 'voyager.posts.index', 'null'),
(35, 1, 'News Info', '', '_self', 'voyager-documentation', '#000000', NULL, 6, '2021-07-22 09:50:14', '2021-07-22 09:51:16', NULL, ''),
(36, 1, 'Feedback Types', '', '_self', NULL, NULL, 38, 2, '2021-07-26 13:44:00', '2021-07-26 13:46:50', 'voyager.feedback-types.index', NULL),
(37, 1, 'Feedback', '', '_self', NULL, NULL, 38, 1, '2021-07-26 13:45:01', '2021-07-26 13:46:47', 'voyager.feedback.index', NULL),
(38, 1, 'Feedback Info', '', '_self', 'voyager-group', '#000000', NULL, 7, '2021-07-26 13:46:41', '2021-07-26 13:46:56', NULL, '');

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
(57, '2021_07_20_155645_create_partner_task_rule_table', 15),
(58, '2021_07_22_113828_create_categories_table', 16),
(59, '2021_07_22_114905_create_posts_table', 16),
(60, '2021_07_26_152154_create_feedback_types_table', 17),
(61, '2021_07_26_152943_create_feedback_table', 17);

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
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `partner_tasks`
--

INSERT INTO `partner_tasks` (`id`, `description`, `gender_id`, `image`) VALUES
(32, 'Допоможіть сходити до біса.', 2, NULL),
(33, 'Допоможіть зав\'язати очі партнеру, а потім стріляйте з великокаліберного кулемету по ньому під час його прохождення по канату.', 2, NULL),
(34, 'Купіть два яйца і м\'ясо у магазині.', 1, 'partner-tasks\\July2021\\xmdb2EHxFT1QbHSdDsSu.png'),
(35, 'Вам потрібно звозити свою кохану на ферму алігаторів. Буде цікаво!', 2, NULL),
(36, 'Допоможіть партнеру зрозуміти сенс його задачі.', 2, NULL),
(37, 'Замаринуйте м\'ясо, та приготуйтеся смачно попоїсти.', 1, NULL),
(38, 'Сходіть на задній двір, там вас чекає сюрприз.', 2, NULL);

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
(4, 37, 1),
(5, 32, 1),
(6, 36, 1);

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
(101, 'delete_partner_rules', 'partner_rules', '2021-07-20 13:23:40', '2021-07-20 13:23:40'),
(102, 'browse_categories', 'categories', '2021-07-22 09:44:30', '2021-07-22 09:44:30'),
(103, 'read_categories', 'categories', '2021-07-22 09:44:30', '2021-07-22 09:44:30'),
(104, 'edit_categories', 'categories', '2021-07-22 09:44:30', '2021-07-22 09:44:30'),
(105, 'add_categories', 'categories', '2021-07-22 09:44:30', '2021-07-22 09:44:30'),
(106, 'delete_categories', 'categories', '2021-07-22 09:44:30', '2021-07-22 09:44:30'),
(107, 'browse_posts', 'posts', '2021-07-22 09:44:47', '2021-07-22 09:44:47'),
(108, 'read_posts', 'posts', '2021-07-22 09:44:47', '2021-07-22 09:44:47'),
(109, 'edit_posts', 'posts', '2021-07-22 09:44:47', '2021-07-22 09:44:47'),
(110, 'add_posts', 'posts', '2021-07-22 09:44:47', '2021-07-22 09:44:47'),
(111, 'delete_posts', 'posts', '2021-07-22 09:44:47', '2021-07-22 09:44:47'),
(112, 'browse_feedback_types', 'feedback_types', '2021-07-26 13:43:59', '2021-07-26 13:43:59'),
(113, 'read_feedback_types', 'feedback_types', '2021-07-26 13:43:59', '2021-07-26 13:43:59'),
(114, 'edit_feedback_types', 'feedback_types', '2021-07-26 13:43:59', '2021-07-26 13:43:59'),
(115, 'add_feedback_types', 'feedback_types', '2021-07-26 13:43:59', '2021-07-26 13:43:59'),
(116, 'delete_feedback_types', 'feedback_types', '2021-07-26 13:43:59', '2021-07-26 13:43:59'),
(117, 'browse_feedback', 'feedback', '2021-07-26 13:45:00', '2021-07-26 13:45:00'),
(118, 'read_feedback', 'feedback', '2021-07-26 13:45:01', '2021-07-26 13:45:01'),
(119, 'edit_feedback', 'feedback', '2021-07-26 13:45:01', '2021-07-26 13:45:01'),
(120, 'add_feedback', 'feedback', '2021-07-26 13:45:01', '2021-07-26 13:45:01'),
(121, 'delete_feedback', 'feedback', '2021-07-26 13:45:01', '2021-07-26 13:45:01');

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
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `image`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Omnis beatae mollitia quo excepturi aut est doloribus.', 'Tempore enim deleniti quam earum. Aliquam porro nemo tempore quae laudantium totam. Distinctio atque eum quia qui excepturi. Provident neque adipisci sint impedit similique aliquid. Sunt sunt accusantium esse occaecati labore cupiditate dicta.\n\nAccusamus corporis quaerat aperiam iste. Deserunt dignissimos sit eaque fuga architecto. Sed sed animi aut. Ea quis totam odit expedita sit.\n\nSed at quo quas. At optio repudiandae ducimus ratione eos.\n\nQuos facere facere consequatur necessitatibus enim aperiam. Nihil animi ipsam et ab non voluptatum. Magnam qui occaecati repellat atque aut asperiores voluptatem. Tempora praesentium temporibus quisquam consequatur fuga beatae.\n\nConsectetur quod cumque ipsa assumenda. Corrupti rem dolores magni qui ullam et nesciunt. Ipsa voluptatem voluptatibus modi fugiat itaque corporis est. Iure voluptatum necessitatibus quaerat in quas quia maxime. Quia blanditiis aut repudiandae adipisci minus aut.\n\nAssumenda possimus aut eveniet placeat et est. Dolor excepturi aut nam eos. Aliquid voluptatem quos illo autem atque voluptas atque ut. Reiciendis rerum dicta voluptas molestiae blanditiis rerum.\n\nAut vero maxime sit adipisci. Delectus itaque totam sunt reprehenderit eligendi nisi. Aliquam voluptas nisi optio corrupti voluptates maxime aspernatur. Expedita error ratione voluptatem.\n\nNeque consequatur fuga voluptas voluptatibus reprehenderit sint debitis. Et voluptatem eum rerum distinctio est repudiandae. Dolorem placeat sit quia eos labore.\n\nRepellendus dolor saepe mollitia voluptatem. Vel enim dolores quo eos molestiae quidem amet. Et eum et voluptatum quis maiores.\n\nAut quia voluptas et vitae est quos voluptatem. Nobis optio tempore cupiditate sunt blanditiis. Sit sit facere nesciunt ad sint aspernatur. Nam dicta veritatis velit possimus natus.', NULL, '2021-05-11 19:45:37', '2021-07-22 09:26:42', 2),
(2, 'Sunt voluptates qui earum minima.', 'Provident unde magni vel praesentium adipisci natus velit. Fuga saepe ut beatae suscipit quas saepe sunt. Optio dolores soluta voluptate laboriosam ab. Reiciendis dolorem tempore perferendis quia numquam enim quae.\n\nOmnis itaque itaque natus amet sequi sed. Et earum tenetur commodi dolor nobis. Sunt est recusandae ad eos dignissimos et. Magnam qui et ad nisi illo necessitatibus. Et ipsam id praesentium dolor et.\n\nSint labore est suscipit molestiae qui eum. Consequatur occaecati atque mollitia tempore aut aut. Rerum nostrum tempore repudiandae sit minus nobis similique.\n\nConsequatur aut consequatur rem dolorem et earum aspernatur. Reprehenderit possimus perspiciatis rem. Facilis enim pariatur est ipsa deserunt necessitatibus.\n\nEt inventore animi veritatis aperiam molestias autem quod omnis. Vel iure dolor quisquam iste occaecati placeat. Atque qui voluptas dignissimos iste ipsa sapiente distinctio.\n\nDoloremque sed laudantium voluptate vero aut. Excepturi iusto itaque magni in. Eligendi tempore voluptatem iste corrupti saepe consequatur asperiores illo.\n\nExcepturi necessitatibus facilis laudantium voluptas aliquid. Nulla at sed adipisci non. Consequatur qui nihil tempora. Voluptas aut voluptas voluptatem quia in ea placeat. Suscipit deleniti est reprehenderit non.\n\nQui iure expedita expedita soluta soluta rerum eaque. Ut nihil reprehenderit id officiis non ad. A quos voluptatibus dolores quaerat velit sit molestiae sed. Sit ipsa qui qui labore. Modi provident vel optio fugit cumque laborum laboriosam et.\n\nAutem suscipit unde expedita explicabo ut nisi. Est tempora doloremque odit fuga sequi consectetur sapiente. Ut fugit exercitationem et quis.\n\nEsse vel asperiores ipsa totam aut dolorem. Distinctio accusamus natus illum aut esse et. Voluptatem a quaerat quos aliquam quasi doloribus. Error architecto ullam voluptatem et rem et aliquid.', NULL, '2021-05-15 22:16:30', '2021-07-22 09:26:42', 1),
(3, 'Et rerum aspernatur officiis architecto repellendus suscipit tenetur rerum.', 'Vitae et eaque praesentium veritatis vitae molestias quasi aut. Esse totam impedit est saepe qui et. Enim quia accusantium hic praesentium. Harum et numquam sint nobis doloribus nostrum.\n\nAsperiores quasi harum quis quis. Quidem eius sed harum. Iste voluptas delectus amet eius.\n\nQuaerat aut reprehenderit accusantium ea adipisci. Temporibus nihil quibusdam non ut. Quo assumenda veritatis possimus aut. Voluptatum inventore quam dolore illum.\n\nSoluta aut eveniet est rerum qui modi ut. Eveniet totam exercitationem consequatur optio. Magnam sed ut omnis autem voluptas sint et. Architecto nostrum labore ut aliquam dignissimos.\n\nEt labore qui est amet qui dolor. Eum dolor illo eaque necessitatibus numquam ut. Commodi velit exercitationem nemo eligendi cumque debitis aut.\n\nUt aliquid aut ratione et. Aliquam expedita velit hic aspernatur occaecati porro. Nihil consequatur rerum dolor delectus suscipit iusto quia.\n\nCommodi inventore aperiam reiciendis laboriosam tempora fugiat. Autem ipsum repellat rerum. Suscipit maiores sed tempora nesciunt.\n\nSed animi ut id doloremque qui assumenda cum. Porro sit officiis libero harum praesentium tenetur. Et accusamus vitae sint in minima et.\n\nSit sit consequatur repellat hic voluptatem autem quia. Consequatur suscipit qui ducimus praesentium. Voluptas in minus minus consequuntur voluptas necessitatibus.\n\nOptio officiis fuga soluta quos. Ipsam dolor aut aperiam numquam consequatur impedit veniam. Qui natus et tenetur delectus aut porro reprehenderit. Iure pariatur quaerat dolore et totam. Aliquid non qui et et dolorem.', NULL, '2021-05-31 13:22:40', '2021-07-22 09:26:42', 2),
(4, 'Qui minus autem harum sunt.', 'Itaque consequatur cum aut. Dolores quia laudantium laudantium qui eum quo. Quae molestiae non molestiae maiores reprehenderit.\n\nRerum dolorem beatae cum est. Dignissimos sapiente architecto eos sapiente. Animi quia voluptatem distinctio unde voluptas. Ipsam consequatur optio perspiciatis sed aspernatur voluptas.\n\nNulla incidunt qui doloribus soluta sed magnam asperiores adipisci. Est voluptatum natus accusamus magni. Iste eum iste voluptatum deserunt qui mollitia voluptatem.\n\nQui exercitationem ut natus aut doloribus ad. Adipisci sit maxime in rerum optio id fugit ut. Corrupti consequatur accusantium temporibus laborum quam culpa. Omnis ea molestias modi veritatis.\n\nIn veritatis quibusdam mollitia nostrum qui architecto et tenetur. Consectetur repudiandae odit porro pariatur.\n\nNon labore corrupti ut doloremque magni. Sequi beatae vero doloremque. Aut nam nostrum et id et. Quisquam consequuntur nulla in labore aliquid.\n\nOmnis id modi quia accusantium. Qui pariatur sit aliquam possimus quia inventore voluptate. Provident repudiandae et cum sit.\n\nUt vel quo officia labore velit. Atque amet error iste consequatur debitis ducimus nam. Quia quibusdam dolor molestias nisi tenetur quis laborum. Accusantium libero omnis vitae aut numquam quos placeat.\n\nHarum dolores sit eligendi occaecati voluptatem. Nam mollitia ut ut voluptas doloremque cumque expedita. Mollitia maiores minima magnam consequuntur.\n\nIn nobis dolor amet magnam quis molestiae. Harum alias corporis debitis perferendis nostrum impedit recusandae. Repellat qui omnis exercitationem omnis quia. Sed optio voluptas autem nobis recusandae excepturi pariatur. Dolor accusantium tenetur mollitia quam ut laborum sit.', NULL, '2021-05-20 08:50:52', '2021-07-22 09:26:42', 1),
(5, 'Alias rerum voluptatem et optio.', 'Ut quae harum labore consectetur laboriosam autem eligendi. Consectetur voluptatibus molestias qui iusto labore eum excepturi repudiandae. Nihil et corrupti ut ex. Consequatur omnis est enim optio.\n\nNatus perferendis qui autem. Sequi nobis dolores earum consequatur impedit perferendis. Soluta error non error qui dignissimos cum aut. Quisquam fuga alias placeat distinctio.\n\nNon ducimus illo perferendis voluptatibus id a doloremque eligendi. Eaque unde et id quasi maiores et natus. Quis quis ullam vel rerum.\n\nOfficiis sunt eius aut dolore. Commodi magni ullam et. Ut est error eius omnis accusamus.\n\nQuia repudiandae provident aut voluptatem tenetur. Eum ea nihil dolor aut. Dolore eos qui qui asperiores necessitatibus. Laborum est veritatis ut id ut recusandae.\n\nDolorem omnis rem quo velit itaque est nemo. Eveniet quaerat nostrum nihil et beatae temporibus iste. Culpa error deserunt sequi dolores laboriosam qui. Consequatur corrupti et illo quos.\n\nEt vel sed repellat et eum ullam. Amet repellendus voluptas deleniti corporis dolores beatae. Voluptatem dolor minus culpa quia voluptatem omnis. Iure laudantium odio magni quibusdam non iste. Deserunt id tempore odio corporis fuga assumenda.\n\nEt et et non in eos totam. Sint soluta molestias officiis a harum debitis nihil. Harum voluptatem et dolores. Officia rem numquam tenetur asperiores. Dolor laboriosam accusantium labore officiis nulla.\n\nIncidunt suscipit ipsa repellendus soluta. Iure et et et tempore neque rem incidunt. Quos dolorum facere architecto cum aut voluptatibus.\n\nEnim adipisci facilis sint numquam doloribus voluptatem. Quo explicabo soluta illo magni dolor incidunt dolores fugit. Est nisi inventore velit similique nesciunt architecto illo. Commodi ad quam deserunt vitae iusto doloremque.', NULL, '2021-06-19 23:28:19', '2021-07-22 09:26:42', 2),
(6, 'Sunt sed architecto a impedit quis et.', 'Eum voluptates quisquam expedita dolorem quis. Optio qui iure amet blanditiis nulla aut odit. Et minus occaecati tempore possimus repudiandae aut in. Nesciunt vel voluptates adipisci fugiat saepe.\n\nVoluptatum aliquid corrupti vel qui minus animi. Sed ut recusandae ratione autem autem vel recusandae. Voluptas cumque illum ipsum et excepturi possimus aut ullam. Alias delectus aut optio et.\n\nConsequatur enim quasi aut qui et. Est inventore non repellendus saepe. Ut vel molestiae et veritatis voluptas qui.\n\nVeritatis repellendus assumenda sed numquam maxime in. Corrupti dolor cum mollitia dolorem rerum neque quo. Est voluptatem ipsam eligendi distinctio amet et ea voluptas. Sint pariatur quos et ut sed. Consequatur eveniet nisi aut nam suscipit.\n\nNon debitis numquam quos odit quia natus corporis hic. Velit ducimus nostrum ea quod. Saepe nam nulla tempore sed praesentium. Dolore aliquid adipisci quia voluptates tempora enim aliquam.\n\nDucimus vel laborum qui minima suscipit. Repudiandae aut mollitia fuga. Et sunt hic numquam ipsum recusandae officia ut.\n\nVoluptatem enim sunt repudiandae similique nostrum cum unde et. Sint et saepe enim veniam accusantium itaque consequuntur. Sapiente quia doloremque sint.\n\nAperiam non dolore dolorem perspiciatis. Impedit sint quos et. Ab laborum expedita architecto ullam temporibus.\n\nQuaerat fugiat possimus eos architecto. Vitae ducimus voluptates eum. Quia rerum nostrum vel quia expedita.\n\nHarum qui maiores officia suscipit odit illum. Accusamus laudantium ut et temporibus. Autem sit vel assumenda. Optio delectus officia enim non iure aperiam.', NULL, '2021-07-10 04:12:20', '2021-07-22 09:26:42', 2),
(7, 'Sit debitis similique sint expedita nihil tempore.', 'Aliquid dicta ipsam ut libero quis eum. Aut ex soluta quas aut. Molestiae non similique dicta distinctio suscipit inventore atque.\n\nQuia nisi cum ea qui animi. Debitis id quaerat ipsa consectetur asperiores. Dolor natus numquam earum sint sequi.\n\nUt earum nihil et ut praesentium totam. Officia numquam animi aut soluta. Ut expedita illo magnam quo consequatur est ut. Aut nulla quisquam quos delectus excepturi quae.\n\nAut sed nulla non omnis reiciendis et sed. Ut sit cumque consequatur qui in quia. Dolorem quo labore consequatur sed quia. Facilis ea expedita et ea dolorum.\n\nDolores qui numquam doloribus nihil tempora ipsa. Perspiciatis eligendi ea exercitationem maxime aut aspernatur aspernatur. Sit nemo ad qui pariatur aut.\n\nEius et numquam aliquam laboriosam labore ut praesentium eum. Numquam eum accusantium facere autem commodi sapiente enim. Ducimus id quia est velit. Porro quis cumque exercitationem quae et laudantium rem.\n\nPlaceat qui aperiam ipsa eveniet voluptatem laborum. Maxime vel numquam non doloribus aut id qui. Dignissimos repellat distinctio rerum quas sint dolores nisi. Praesentium beatae mollitia officia quod iusto.\n\nEt quisquam esse ut qui reiciendis quo. Dolorem et exercitationem voluptate fuga. Minima eum ipsa voluptatem enim maxime et molestias.\n\nPossimus et enim incidunt voluptatem quis quia. Et eveniet harum magni cum ullam.\n\nEt deleniti voluptatem voluptatem porro fuga dolor est. Quia illum quis voluptate quia aut qui quae. Aut assumenda earum ab saepe repellendus. Omnis unde qui reiciendis corporis omnis optio.', NULL, '2021-05-11 09:05:02', '2021-07-22 09:26:43', 2),
(8, 'Et ipsa id quam eligendi quia dolore.', 'Quisquam beatae vel molestiae repellendus facilis. Iste aperiam velit explicabo repudiandae. Et quo quisquam quia ullam neque maxime eveniet.\n\nQuidem quasi laudantium laborum autem totam assumenda. Blanditiis et animi aut eos. Aut labore et molestiae qui accusamus tempore. Modi quos voluptatum aut laborum voluptatibus eum.\n\nQuas iure cumque molestiae omnis harum aut. Incidunt porro necessitatibus consequatur dolorem totam. Mollitia enim corrupti quibusdam sed.\n\nMollitia aliquam ratione vel perferendis sit eius. Magnam ex consequatur perferendis quas sint dolorem aut natus. Delectus mollitia voluptas quisquam.\n\nSit praesentium repellat qui voluptas dolore. Perspiciatis possimus dignissimos sit eos. Explicabo fugit tenetur enim facilis et quaerat est.\n\nQuaerat repudiandae quasi aut ratione qui tempore. Ut voluptas quo qui est provident. Rerum ut suscipit necessitatibus sit ratione blanditiis.\n\nAutem qui dolorem qui et dolorem consequatur. Nobis doloribus repudiandae esse ut fugit aut. Dolores odit doloribus nemo animi.\n\nOfficia recusandae alias tempora molestiae necessitatibus quas quia fugit. Sequi qui totam voluptatem harum minus natus. Ut tenetur quos soluta error. Explicabo nesciunt quam minima tempora architecto iure quia.\n\nSint odio illo pariatur iste. Rerum quos voluptatem quisquam et praesentium libero. Veritatis ad est recusandae aut est aliquid. Repellendus et beatae quis ducimus.\n\nSunt qui ut dolor reiciendis magni. Ea sunt nesciunt quisquam. Necessitatibus quis aperiam ipsam ea quia aut blanditiis suscipit.', NULL, '2021-05-03 23:15:17', '2021-07-22 09:26:43', 2),
(9, 'Nemo aperiam dignissimos itaque quod commodi.', 'Commodi id omnis sunt. Quibusdam ullam non ipsa est distinctio esse quia iure. Nihil et ducimus occaecati qui ratione ipsa.\n\nAlias quisquam aliquam amet molestiae ut placeat. Rerum quibusdam dignissimos voluptas libero et voluptatem odit.\n\nAdipisci sint voluptatum voluptatum nemo tempora. Et molestias dignissimos non voluptas esse. Nulla voluptatem et rerum.\n\nNecessitatibus nihil incidunt reiciendis. Ut et ea voluptas sed nemo iusto et. Ipsum ex quos ut iusto voluptates. Fuga dolorum voluptatem vero adipisci qui explicabo accusantium.\n\nEt ipsum possimus sequi eaque praesentium ut cumque. Et aut aliquam dolorem nihil est dolores quis. Possimus architecto doloremque eos ut in voluptatem libero. Adipisci fuga non voluptas blanditiis quaerat. Debitis asperiores quam minima voluptatem incidunt perspiciatis.\n\nQui fugiat totam quis iusto hic accusantium. A eum voluptas facere error molestiae. Magni sit qui sit et quas libero. Iure ipsam reiciendis nam pariatur dolor eligendi.\n\nQui dolores nihil voluptas dolor. Impedit eum qui saepe et ad voluptate dicta suscipit. Hic consequatur sunt rerum et.\n\nRepellendus quo id praesentium nisi voluptas. Et aperiam culpa sed eaque voluptatum voluptas voluptatem. Quis distinctio cupiditate quis qui perspiciatis fuga perspiciatis. Enim ut autem et quasi necessitatibus.\n\nMaiores velit consectetur perferendis explicabo aut aut. Suscipit facilis quia qui placeat sequi harum. Sed numquam qui ipsa incidunt quis. Esse non unde exercitationem possimus iste magnam.\n\nEsse iusto voluptas voluptatibus corrupti. Perferendis praesentium aut ut maiores quo beatae. Expedita modi omnis quas dolor.', NULL, '2021-05-25 09:29:51', '2021-07-22 09:26:43', 5),
(10, 'Ea est voluptas fugit voluptates sit voluptatum.', 'Eveniet enim porro qui et exercitationem ratione omnis. Et tempore et error sint officia. Incidunt enim libero asperiores. A et qui nihil quaerat quia quidem. Impedit earum cum quis alias excepturi iste quia.\n\nEa aliquam laudantium quia quisquam mollitia quo. Doloribus esse neque nisi facere quis impedit omnis qui. Et ipsa eaque sapiente exercitationem quasi est.\n\nDelectus aut minus in ipsum nulla quae minima. Est voluptas similique aut molestias.\n\nRecusandae ullam nihil eum architecto dolor nobis. Possimus qui quia qui tenetur aut qui. Dolorum quia enim in laudantium nam odit. Ducimus nobis dignissimos quia.\n\nSit occaecati suscipit cum enim vero sunt. Repudiandae rem aut id maxime. Consequatur sapiente blanditiis vel vel sint odit labore.\n\nSuscipit sed laboriosam ea quidem sint eveniet eos. Ipsam dignissimos aut iure placeat consequatur quia sint debitis. Reiciendis est sed quae et quia rerum.\n\nMagni sit dolores mollitia sint nemo. Sed qui id blanditiis ipsum. Aut sit asperiores nihil culpa.\n\nUt voluptatum magni rerum sint in voluptatem quisquam tempora. Omnis culpa aut facere aspernatur quod sit sit.\n\nLaboriosam quo deleniti aut sed voluptatibus eligendi. Quidem sapiente vel vel nisi animi quae fugit. Reprehenderit maxime voluptas laborum non vel aut voluptatem. At dolor modi deleniti quas qui. Ipsum omnis porro ea amet dolorum.\n\nQui ipsa accusantium consequatur veritatis rerum. Rerum doloremque fugit odit omnis repellendus molestiae aut. Eveniet cupiditate aut iusto dolores atque minima necessitatibus.', NULL, '2021-06-24 08:55:45', '2021-07-22 09:26:43', 4),
(11, 'Id iure voluptatum nesciunt nihil qui sint laboriosam.', 'Ab exercitationem eius in sed rerum rerum. Quo aperiam assumenda voluptas dignissimos laboriosam dolores. Id provident maiores ab aut dicta. Debitis cum enim aut alias nam.\n\nMaxime expedita facilis ipsum. Nostrum dolor dolor sed necessitatibus. Vel assumenda hic et quos eos ad.\n\nOptio reprehenderit quo recusandae eligendi est. Et dolorem commodi architecto qui placeat id distinctio. Nam aliquid exercitationem aliquam eveniet. Tempore et aut voluptates ut et accusamus.\n\nPraesentium ab velit tenetur quidem corrupti et similique quo. Nisi molestiae fugit facilis eligendi mollitia nobis et. Aliquid nam ullam et eum. Corporis ut doloremque id qui amet.\n\nSint facere saepe recusandae enim aut alias nobis. Expedita sapiente cupiditate qui minus eveniet rerum odit.\n\nDignissimos ratione adipisci neque qui sit animi voluptatum. Ipsa cupiditate modi laboriosam facere et veritatis. Ullam similique eum occaecati pariatur.\n\nNon natus aut quia quia voluptatem eveniet voluptas. Quia numquam nihil odit nisi. Esse perferendis sequi molestias dicta aut debitis veritatis.\n\nSint dolorem quia consequatur et. Quia repellendus dolore quae unde fugiat. Ut at ducimus repellendus nam cupiditate.\n\nLibero dicta dolorum tempore est eius animi omnis. Saepe id tenetur sint ut consequatur. Minima temporibus occaecati sit reprehenderit. Aliquam molestias temporibus occaecati.\n\nConsequatur omnis temporibus fugit et vitae. Voluptas doloremque laboriosam ut nihil. Minima quam sed libero maxime nam.', NULL, '2021-05-13 22:05:47', '2021-07-22 09:26:43', 5),
(12, 'Tenetur aut blanditiis reprehenderit pariatur harum ducimus.', 'Dicta ut rerum inventore. Animi ipsum pariatur aliquid et repellendus unde similique non. Asperiores corrupti praesentium velit consectetur ratione. Eum sed reiciendis dolorum ullam.\n\nSimilique est quia qui voluptas debitis dolores. Sed ex voluptatem tenetur in dignissimos incidunt culpa.\n\nQuis fugiat id reprehenderit nam ut. Ipsum et qui dolor saepe temporibus dolores illo nihil. Sit aut quasi est vel explicabo necessitatibus perferendis.\n\nIn dolorem minima quaerat provident voluptatibus autem. Eligendi voluptatem accusantium iste nisi consequatur cum. Consequatur rerum libero molestiae nihil id aut expedita. A dolorem et quis provident ut vero. Expedita enim et velit non voluptas.\n\nEum cumque dicta a dolorem eveniet. Consequatur explicabo quidem quidem consequatur corrupti vel sunt.\n\nQui enim et earum. Quo fuga incidunt quidem quo. Facere et magnam fuga quaerat earum aut.\n\nLaudantium inventore eum sunt praesentium facere ullam laborum. Debitis sequi voluptas rerum et aperiam quos. Omnis doloribus doloribus sit omnis et corporis.\n\nAdipisci qui incidunt sed distinctio dolore et. Magnam amet quos ratione quisquam dolor quae. Quis ea sed qui eos architecto voluptas est perspiciatis.\n\nOdit vel necessitatibus illo et aut est consequuntur. Iure est voluptas explicabo officiis ipsa est earum quia. Possimus doloremque adipisci nam quisquam pariatur cumque est. Voluptatibus magnam harum voluptatem at voluptatibus. Nisi minus sapiente sint odit ex.\n\nQui voluptatem perferendis dignissimos et non autem. Dicta vel ratione vitae eos vitae. Amet quam voluptas eos atque. Repellendus esse nemo quidem ipsum vel aut a.', NULL, '2021-07-15 21:55:17', '2021-07-22 09:26:43', 2),
(13, 'Unde ut eaque sequi accusamus quos sequi.', 'Autem vitae explicabo quia non blanditiis iusto nemo. Dolores est delectus sit odio laborum. Ea dolores voluptatum rerum quasi consequatur incidunt. Asperiores ad vel deserunt consequuntur et tenetur.\n\nDolor harum repudiandae et reprehenderit sequi possimus. Vel provident est consequatur consequatur. Ipsa exercitationem ratione et mollitia aliquid molestiae.\n\nRerum fugiat hic voluptatem. Quo ut autem assumenda. Enim qui debitis ea sed. Necessitatibus omnis similique quaerat qui deserunt rerum quidem.\n\nExplicabo mollitia exercitationem omnis in necessitatibus accusantium aut. Nihil harum deserunt qui. Voluptatem et eaque voluptate corporis perspiciatis tempore.\n\nUnde quo nulla adipisci recusandae nihil sed. Explicabo voluptas minus nesciunt est pariatur. Illum ratione aliquam hic ipsum minima necessitatibus saepe.\n\nOmnis inventore autem recusandae mollitia in impedit qui dolorem. Possimus saepe reprehenderit illum numquam quasi corporis. Atque et qui blanditiis quod quia doloremque.\n\nInventore aut perferendis inventore dolores maiores. Et facere inventore omnis fuga voluptatem. Quasi reiciendis atque commodi optio. Ut expedita cum aut ipsa mollitia esse quia.\n\nArchitecto rerum eaque maxime blanditiis. Cum occaecati aliquid aut maiores unde inventore. Molestias aut amet atque ea incidunt eum. Error ea officiis eum.\n\nQui doloribus nihil et. Dolorum harum deserunt praesentium. Eum ut quae cum vitae architecto magni. Corporis dolor maxime aspernatur. Aut sunt quo ea.\n\nVoluptas tempora in perspiciatis sapiente. Iste voluptas sit sed aut. Aut qui natus assumenda aut.', NULL, '2021-06-21 17:41:19', '2021-07-22 09:26:43', 4),
(14, 'Minima aut laudantium est iure nemo sit natus.', 'Aut quae est praesentium blanditiis alias consequuntur. Quia sunt quia hic quisquam. Et similique sed totam sapiente veniam. Voluptas et illo dolorem.\n\nDolore quis fuga et cupiditate. Aperiam sed ipsum dolores corrupti eos animi maxime. Repellendus delectus consequatur qui omnis cupiditate assumenda et.\n\nAut ea laboriosam sapiente aut commodi sit delectus. Sequi ex quis qui alias et. Iste non dolorem iure beatae.\n\nEst aut in et rerum. Sed sapiente corrupti quia quia dolorem. Aut eveniet facilis eius mollitia voluptatem qui.\n\nAccusamus debitis ut esse laboriosam. Sint inventore quia voluptatem et similique minus. Qui saepe voluptas sint ea. Blanditiis vel dicta quia et aut. Qui velit voluptate et qui omnis id praesentium.\n\nVelit possimus quo est tenetur. Facilis iure ab reiciendis iste ipsa deleniti. Ipsa maxime suscipit molestias debitis quia natus nisi. Ducimus quia eum ea.\n\nQui fuga eum praesentium ex et quia. Eum voluptatem quia qui et dolores consectetur officiis eveniet. Sit perferendis non et perspiciatis tempora exercitationem itaque recusandae. Consequuntur ab possimus officiis ut commodi enim.\n\nIpsa debitis eveniet similique voluptas hic cumque libero. Totam perspiciatis dignissimos dignissimos ut omnis quo nesciunt. Quaerat voluptates corporis omnis quo fugit architecto. Placeat rerum qui pariatur.\n\nMinima nihil facere consequatur temporibus animi. Ratione quo neque alias quia dolor dolores et. Voluptatibus non et inventore ad eos qui. Ea et est et asperiores officiis.\n\nQuibusdam culpa sed ut praesentium. Consequuntur temporibus et perspiciatis eveniet distinctio est quos quia. Facilis est earum repellendus quasi non. Animi quaerat totam unde est aut magnam qui.', NULL, '2021-04-27 17:49:29', '2021-07-22 09:26:43', 3),
(15, 'Magni molestias adipisci suscipit eum.', 'Sint illum occaecati natus ut dolores tenetur numquam. Velit mollitia corporis est beatae necessitatibus consequatur. Cupiditate aperiam voluptas doloribus minima porro debitis.\n\nVoluptatem nam qui doloremque qui provident est consequatur magnam. Dignissimos pariatur culpa sunt quas blanditiis et.\n\nNostrum quia accusantium beatae beatae eaque. Amet a unde eveniet sed suscipit ut. Qui officia voluptas et aut. Autem qui ea corporis vel.\n\nSed qui temporibus rerum ut. Saepe natus corrupti aut dolorum modi. Consequuntur consectetur repudiandae enim. Similique nisi voluptates odio quaerat.\n\nNeque officiis sint rerum maxime. Doloribus ut dolorum qui aliquam rerum et delectus eum. Id ratione id sit quo.\n\nQuam cumque minima vel et eaque. Iste et soluta ex molestias dolorem.\n\nPlaceat quaerat tempore recusandae fugiat rerum. Qui et illo officiis et et dolorum. Asperiores odio quia asperiores qui.\n\nQuaerat quos placeat harum natus nihil suscipit est. Et et architecto itaque id deserunt quam. Ut culpa eligendi nostrum tenetur cumque.\n\nCorrupti dolore temporibus amet deserunt. Accusantium sint qui corporis fugit dolore.\n\nEst enim quod ea non et. Expedita maiores et ut eius iure mollitia. Placeat et dolorum architecto quos quia a et. Natus voluptatem id aut.', NULL, '2021-06-08 14:38:04', '2021-07-22 09:26:43', 4),
(16, 'Omnis qui temporibus aut aut dolore quaerat ut.', 'Est ab facere magni. Magni id iste placeat est unde tempora ab. Sed ullam tempora inventore amet aut.\n\nVoluptatum consectetur et et. Nobis quibusdam ducimus aut. Quia dolorem et voluptas in.\n\nFuga placeat perferendis earum inventore accusantium quos consequatur quo. Maiores est adipisci dignissimos voluptate fuga debitis deserunt. Aut aperiam praesentium autem et quo expedita sed.\n\nSunt illo consequuntur rem sed. Voluptas provident fugit nihil ut. Placeat mollitia harum qui consequatur dolores.\n\nAt possimus ea expedita accusamus consequatur. Voluptas eveniet inventore quo eum sunt animi. Incidunt et vero labore aliquam sapiente aliquid est. Libero suscipit eos soluta et assumenda.\n\nUt tenetur pariatur ipsam voluptatem. Id incidunt a rem quod consequatur amet.\n\nNeque in qui est maxime ipsum. Molestiae est rem aut et omnis omnis.\n\nCumque nesciunt esse et voluptatibus iure. Repellendus blanditiis minus quidem sit qui aperiam corporis eum. Iusto optio sapiente ducimus ut voluptatem eos aut. At similique saepe sit iure minus.\n\nReprehenderit nihil atque sit perspiciatis quas aperiam. Molestiae illum aperiam quas doloribus recusandae et voluptates. Et aut qui a quia et.\n\nNulla dolor officia dolorem voluptas assumenda consequuntur neque iure. Quis non illum dicta qui. Sit sapiente maiores eum.', NULL, '2021-05-25 12:48:32', '2021-07-22 09:26:43', 1),
(17, 'Asperiores quaerat in at id.', 'Nam enim et placeat non vero. Vero molestiae saepe aut in. Et laborum ratione ea facere ex autem eveniet officia. Earum dolores tempore at ut.\n\nOptio excepturi qui possimus quos esse hic enim et. Quidem perferendis doloribus aut qui non quas.\n\nEt deleniti vel mollitia quis ut. Eum cupiditate enim illum voluptatem inventore quia et.\n\nCumque sit vel libero ea. Autem adipisci explicabo doloremque et temporibus. Incidunt vero qui accusamus.\n\nNulla ut inventore ut unde distinctio repellat reiciendis ut. A quo odio voluptatibus et. Aut nemo suscipit sit quia ut recusandae.\n\nExpedita quia qui optio amet. Nostrum qui possimus neque ab voluptatem est est laborum. Qui sed quaerat et fugit eaque vero sed. Odio aliquid quae natus at rerum eum.\n\nNostrum necessitatibus dolore molestias et velit sit. Sunt non quidem culpa omnis. Cumque quod praesentium repellendus amet doloremque rem blanditiis.\n\nAliquam accusantium excepturi eum voluptatum architecto laudantium. Reprehenderit dolores a autem fugiat. Eos molestiae laborum aliquam quod saepe eum dignissimos. Sed nesciunt optio aut cum voluptatem eius eligendi.\n\nQuasi voluptatem sit maiores impedit ullam saepe quae totam. Quo ut natus repellat ducimus quisquam quam. Ratione pariatur laborum iste et.\n\nAmet corporis atque assumenda cupiditate est est sequi qui. Atque quia suscipit explicabo debitis commodi rem. Qui eum delectus dolore. Earum odio fugit numquam.', NULL, '2021-07-01 00:43:15', '2021-07-22 09:26:43', 2),
(18, 'Nesciunt nostrum voluptas velit temporibus sunt.', 'Qui inventore dolore aliquam impedit laboriosam neque corporis. Sint impedit officia recusandae molestiae sint omnis. Illum quia omnis ipsam sunt fugit aut. Deleniti quo accusantium qui tempore laudantium id.\n\nAccusantium aspernatur non et fuga ut mollitia. Adipisci doloribus velit rerum deserunt. Debitis id reiciendis necessitatibus vitae tempora in consequatur.\n\nEa eveniet doloremque repudiandae in minus et. Cumque et qui eum ut quis dolorem ut. Error omnis quo voluptatem totam nisi sequi excepturi.\n\nSimilique architecto autem dignissimos. Sint velit exercitationem repudiandae. Est cupiditate non consequuntur suscipit et ut. Adipisci optio aspernatur est vel qui reprehenderit vel.\n\nVoluptates quisquam earum et et et. Qui fuga officiis repudiandae corrupti ut sed minima. Dolorem soluta vitae et recusandae aspernatur dolores dolorum. Quae ratione qui officia quia aut vel non. Repellat rerum cumque molestiae sed magni quibusdam quia quo.\n\nAut sit quo aspernatur tenetur voluptatum inventore. Eum et et ut pariatur optio recusandae. Et totam qui eaque. Dolores voluptatem corporis libero sed velit autem.\n\nFuga soluta quia veniam placeat et. Voluptas cumque atque voluptatem fuga. Et non iusto asperiores repellendus est eos.\n\nId reprehenderit ea eius commodi et officia. Voluptatibus laboriosam fuga enim molestiae ea et odio ipsum. Porro corporis totam sed et. Hic alias est ut saepe ad debitis.\n\nPerferendis nemo consectetur quia eius quis sint quidem et. Et aut sit in placeat nostrum amet voluptatem. Velit dicta qui autem. Reiciendis nemo dolores consectetur facilis hic in.\n\nMollitia qui quo quibusdam est qui et veritatis eaque. Doloremque quo in aut soluta. Voluptates at itaque et accusamus qui aut. Deserunt officiis nulla qui voluptas.', NULL, '2021-05-08 00:52:58', '2021-07-22 09:26:43', 3),
(19, 'Assumenda nostrum nobis architecto reprehenderit.', 'Sit ducimus vel dolores tempora delectus alias corrupti et. Omnis reiciendis nulla nulla repudiandae. Possimus et doloribus voluptatibus ad qui alias. Consequuntur error magni quod blanditiis atque dicta aut id.\n\nEt illo quia aut officia optio voluptas magni et. Deserunt quae ut et dolorum aut perspiciatis. Reprehenderit mollitia aut tenetur harum. Officiis aperiam tenetur amet.\n\nArchitecto sint iusto quasi voluptatem aperiam cumque natus officiis. In consequatur voluptas quam repudiandae mollitia. At eius aliquid optio vel.\n\nQuia voluptatem a quis eaque. At eaque quia quaerat delectus sunt quia qui voluptatibus. Nostrum ad aut reprehenderit consequatur non eligendi praesentium dolores. Voluptatem iste voluptates eaque vel accusamus autem quae et.\n\nAliquid dolores rerum dignissimos qui. Consequatur et temporibus qui blanditiis exercitationem veritatis molestias. Modi dolorem quasi voluptate sed quo illo.\n\nAb repudiandae est magni aperiam. Dolores occaecati voluptas unde est maiores. Nisi aut unde qui enim qui.\n\nDelectus quia velit consequuntur aut nihil nihil voluptas architecto. Sint perspiciatis sit molestiae et impedit. Ut id voluptates corrupti aut laborum vitae. Nulla et laboriosam et incidunt laborum voluptatem nisi.\n\nQuia aspernatur aut voluptate et eaque voluptatum ad. Debitis rerum aperiam minima repellendus assumenda est autem.\n\nAliquam dolor sapiente dolor. Amet laudantium mollitia rerum harum.\n\nIpsum esse dolore vel voluptas quia ea. Voluptatem ipsa libero ut et rem natus suscipit. Quidem in quaerat numquam cupiditate sit accusantium similique. Quas optio error qui aut reiciendis.', NULL, '2021-07-18 05:26:05', '2021-07-22 09:26:43', 3),
(20, 'Ea aut vero rem unde.', 'Et sed soluta rem id possimus nemo eos. Sed porro placeat illum inventore a nostrum quia. Nemo ex accusamus ut quisquam consectetur atque.\n\nAccusamus eos corrupti hic nihil iure. Quasi iure et aut quidem sed fugit voluptas nulla. Suscipit iusto et consectetur veritatis. Odit excepturi possimus eveniet unde ea ipsum itaque.\n\nSint amet quisquam esse et laboriosam voluptatem sunt. Deleniti debitis consequatur qui odio soluta deserunt nam. Nihil in praesentium suscipit rerum eveniet minus dolor odio. Odit aut architecto perspiciatis sed asperiores.\n\nAlias voluptatem fugiat qui facilis quis asperiores. Minus ut sunt quis aut. Magni at sapiente sequi quaerat eum nihil deleniti.\n\nOfficia enim vel animi pariatur. Consequatur velit voluptatem voluptas facere quidem sed non. Debitis aut placeat ut. Quo enim ut recusandae omnis rerum.\n\nEa repellendus quisquam soluta culpa sint. Quia molestiae et rerum delectus.\n\nMinima consequuntur provident velit. Quidem non nam consequatur consequuntur recusandae recusandae maxime et. Tempore voluptatem perspiciatis perferendis molestiae et facilis eligendi.\n\nNecessitatibus illo delectus quia minima saepe. Voluptas sit saepe recusandae unde itaque. Et laborum ad eos est inventore voluptatum harum. Atque similique vel reiciendis similique aut.\n\nQuo esse consequuntur ipsum quaerat nesciunt. Dolor amet sit accusantium qui omnis ratione voluptatibus. Esse dolorum laboriosam dolores nulla nihil asperiores tenetur.\n\nIn in repudiandae quidem. Inventore molestiae sed ipsa neque rem totam excepturi. Quod fuga quibusdam eveniet reiciendis dicta quia dolorem. Autem hic culpa cumque voluptate dicta odit qui.', NULL, '2021-05-16 02:24:05', '2021-07-22 09:26:43', 4);

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
  `preference_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `description`, `partner_description`, `location_type_id`, `preference_id`, `image`) VALUES
(1, 'Сьогодні ви будете займатися хотьбою на руках, перший раз в житті спробуєте цей дивовижний пересування, відомий людству з давніх давен.', 'Сьогодні буде дуже весело.', 3, 1, 'tasks\\July2021\\VEzIkEXFcsULPVNsKuhF.png'),
(2, 'Сьогодні ви будете готувати яєшню.', 'Сьогодні ви смачно поїсте.', 1, 13, 'tasks\\July2021\\CyNM4nNlbRWXGMhRLboN.png'),
(3, 'Сьогодні ви будете готувати торт.', 'Сьогодні ви скуштуєте щось солоденьке.', 1, 13, 'tasks\\July2021\\QLblRiCNF1EwpjkjbIa7.png');

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
(2, 1, 1),
(3, 3, 1);

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
  `telegram_user_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `telegram_user_id`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `partner_email`, `gender_id`, `duration_id`) VALUES
(1, 1, 'admin', 'admin@admin.com', NULL, 'users/default.png', NULL, '$2y$10$vALnBdtdRR7MYVorxGGEi.NwolxJ3R3/vqYPV1xdq2SyFdeBHjDre', NULL, '{\"locale\":\"en\"}', '2021-07-06 08:30:05', '2021-07-12 11:52:52', NULL, NULL, NULL),
(3, 2, 'John', 'john@laravel.test', '378686094', 'users/default.png', NULL, '$2y$10$Vh0l/JzwtwBnCDcquRcOr.zfMsVUA57ebiHe2zL6X90e9CzPdjATO', NULL, NULL, '2021-07-07 05:56:24', '2021-07-16 13:18:17', 'vyacheslav.oleshko.work@gmail.com', 1, 2),
(14, 2, 'Viacheslav', 'vyacheslav.oleshko.work@gmail.com', '378686094', 'users/ZP3ogKXFVm2PxsWiSy00XgpJTkuJqC12Gkj6TWta.png', NULL, '$2y$10$McRMdlbXwnsrCQseuaM8yuck9Sa6kARczRgd/prCEi2QG9Z3RigC.', NULL, NULL, '2021-07-07 11:46:32', '2021-07-27 08:57:14', 'john@laravel.test', 1, 1),
(19, 2, 'Girl', 'girl@laravel.test', NULL, 'users/4aVbZFOMCtCPrH546gDbtlgamLtps9AbvycpSM0M.jpg', NULL, '$2y$10$XOW2AkhBgL2DEoFDo1zyeun6PYSkXPqkBU0ahWJiBFFEuGgkkhxmO', NULL, NULL, '2021-07-21 15:16:20', '2021-07-27 09:33:43', NULL, 2, 1),
(32, 2, 'BigBoy', 'boy@laravel.test', '168384665', 'users/default.png', NULL, '$2y$10$cTvrhgtontC1Dzu4D8kbh.Ai0pesS9csk31NiI6IJblCrJw1OxvEe', NULL, NULL, '2021-07-26 14:12:24', '2021-07-26 14:31:42', 'vyacheslav.oleshko.work@gmail.com', 1, 1),
(37, 2, 'test', 'test@laravel.test', NULL, NULL, NULL, '$2y$10$r1J0pNFuutTGBtqzueOs7exbCseccfZm95GbAM/sTO1020DghE8Ra', NULL, NULL, '2021-07-27 13:00:58', '2021-07-27 13:00:58', NULL, 1, NULL);

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
(29, 32, 1),
(30, 32, 3);

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
(17, 32, 2),
(18, 32, 3);

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
(106, 32, 1),
(107, 32, 13);

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
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
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
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_user_id_index` (`user_id`),
  ADD KEY `feedback_type_id_index` (`type_id`);

--
-- Индексы таблицы `feedback_types`
--
ALTER TABLE `feedback_types`
  ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_index` (`category_id`);

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
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `feedback_types`
--
ALTER TABLE `feedback_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `generated_tasks`
--
ALTER TABLE `generated_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user_level_stack`
--
ALTER TABLE `user_level_stack`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `user_location`
--
ALTER TABLE `user_location`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `user_preference`
--
ALTER TABLE `user_preference`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

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
-- Ограничения внешнего ключа таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `feedback_types` (`id`),
  ADD CONSTRAINT `feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

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
