-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2023 at 01:09 PM
-- Server version: 8.0.33-0ubuntu0.20.04.2
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mock_translation_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `messages_id` int NOT NULL,
  `thumb_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int NOT NULL,
  `channel_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `title`, `creator_id`, `channel_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Customer# 123', 1, 0, '2010-01-03 04:30:43', '2010-01-03 04:30:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deleted_conversations`
--

CREATE TABLE `deleted_conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `conversation_id` int NOT NULL,
  `users_id` int NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_messages`
--

CREATE TABLE `deleted_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `messages_id` int NOT NULL,
  `users_id` int NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_type` int NOT NULL,
  `conversation_id` int NOT NULL,
  `sender_id` int NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `translated_message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `guid`, `message_type`, `conversation_id`, `sender_id`, `message`, `translated_message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '9972544e-2ffb-4a6e-a977-1c95fbb81df2', 0, 2, 2, 'Consequatur quaerat neque nulla non. Illum iste ad magni rerum amet ipsum ratione nisi. Odit dolorem maxime dignissimos ut praesentium deserunt.', NULL, '2023-06-11 00:00:00', '2016-07-19 13:47:10', NULL),
(2, '9972544e-3dd0-482b-95c6-88b47248963e', 1, 1, 1, 'Quibusdam ab atque voluptatem voluptatem. Iste voluptates ullam praesentium qui nemo excepturi.', NULL, '2023-05-31 00:00:00', '1993-05-19 13:28:41', NULL),
(3, '9972544e-3f47-4f11-8227-708e62d6b90d', 0, 1, 1, 'Provident tempore deleniti nam quia fugiat aperiam. Harum sapiente nulla sed saepe repudiandae. Sint mollitia inventore et consectetur doloremque voluptatem harum consequatur.', NULL, '2023-06-12 00:00:00', '2003-02-13 13:15:32', NULL),
(4, '9972544e-406f-48f1-9854-b8615d329d3d', 0, 1, 2, 'Neque corrupti et quo rerum. Voluptates ex impedit nisi corporis eum reprehenderit enim placeat. Modi consequatur minus aliquam facilis. A quia aut molestiae iure pariatur porro aut.', NULL, '2023-06-10 00:00:00', '1987-02-25 04:27:37', NULL),
(5, '9972544e-4188-42bd-aab4-92d29be7878f', 0, 2, 1, 'Sunt sed ut nihil inventore voluptatem consectetur. Rerum alias ipsum voluptas consectetur corporis. Libero consectetur labore atque ex delectus. In qui ab sunt ut.', NULL, '2023-06-16 00:00:00', '2007-03-25 01:19:45', NULL),
(6, '9972544e-42c6-4769-8dc7-95f9f6c6a94e', 0, 1, 1, 'Recusandae rerum sapiente vel. Modi ducimus repellat nam sed voluptate iure. Sunt excepturi sequi doloribus minima. Porro nostrum placeat laudantium.', NULL, '2023-06-15 00:00:00', '1970-11-27 11:24:29', NULL),
(7, '9972544e-440d-49ba-aa70-7a1dda1c5a32', 0, 2, 1, 'Laudantium quia in odit esse. Expedita maiores autem sequi dolores sit id. Nemo qui maiores veritatis sit velit. Maiores accusantium sint nisi quia. Aut ex quia nesciunt accusamus.', NULL, '2023-05-21 00:00:00', '1976-01-05 11:53:03', NULL),
(8, '9972544e-452d-43d7-a137-800c7f22618b', 0, 2, 1, 'Amet autem in aut eos. Autem velit repellat suscipit sunt vero a eveniet. Reprehenderit nesciunt at iste at qui est reprehenderit.', NULL, '2023-05-24 00:00:00', '2016-12-03 10:21:21', NULL),
(9, '9972544e-463a-48a8-8a15-d886e7ff8087', 1, 2, 2, 'Incidunt perspiciatis dolorum est quam velit aut inventore. Incidunt placeat officia inventore non ea commodi autem. Consequatur et consequatur veritatis delectus. Eius maxime porro libero id.', NULL, '2023-06-09 00:00:00', '1977-04-18 09:58:21', NULL),
(10, '9972544e-476f-40ae-bbb7-9601b49033de', 0, 2, 2, 'Est explicabo sed ullam veritatis et. Eos consequatur autem voluptas mollitia est doloremque ut. Sed unde officiis ex rerum asperiores. Maxime ad exercitationem reiciendis occaecati qui assumenda distinctio. Reprehenderit cupiditate minus optio fugit a.', NULL, '2023-06-14 00:00:00', '2013-02-15 01:20:06', NULL),
(11, '9972544e-48e5-461a-9a60-4fa03751ffed', 0, 2, 1, 'Delectus autem eos facilis veniam doloremque. Soluta reprehenderit et eum repudiandae. Omnis veritatis et est aperiam aliquid quibusdam. At et aut ipsa. Culpa quod dolorem aut ratione laboriosam.', NULL, '2023-05-30 00:00:00', '2009-03-24 11:18:57', NULL),
(12, '9972544e-4a3d-4e8f-bbb2-cadb6fb9d67a', 0, 1, 1, 'Quasi dolorum nemo voluptate ea. Aut ipsam quia vitae voluptatibus. Magni illo qui sunt nesciunt nisi quas eaque qui. Voluptatum vero non ut recusandae ex quo.', NULL, '2023-05-26 00:00:00', '1986-11-06 01:26:05', NULL),
(13, '9972544e-4b7e-45d3-80d2-08d82d379286', 1, 1, 1, 'Maxime sapiente excepturi veniam est culpa. Aliquam dolore molestias illum est. Repellat adipisci eum est aspernatur ut consequuntur enim. Ut quisquam aut sapiente quam aliquid qui.', NULL, '2023-05-20 00:00:00', '2016-04-16 14:41:57', NULL),
(14, '9972544e-4c9d-42e9-9632-41bb1678d9f6', 1, 2, 2, 'Id omnis odio laboriosam distinctio qui. Eos quae odit sit illo ad adipisci. Vitae quis iure blanditiis error consequuntur.', NULL, '2023-06-18 00:00:00', '2021-01-22 23:42:21', NULL),
(15, '9972544e-4dc4-4084-83dd-1caf125ece92', 0, 2, 2, 'Et qui suscipit debitis expedita sed earum voluptatem. Sunt alias vitae qui temporibus et nam soluta. Aut excepturi a debitis a. Dolor labore earum consequatur animi magni non. Voluptatum voluptas vero quas vero quas.', NULL, '2023-05-28 00:00:00', '1978-07-03 14:35:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(137, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(138, '2023_06_13_000001_create_attachments_table', 1),
(139, '2023_06_13_000001_create_conversations_table', 1),
(140, '2023_06_13_000001_create_deleted_conversations_table', 1),
(141, '2023_06_13_000001_create_deleted_messages_table', 1),
(142, '2023_06_13_000001_create_messages_table', 1),
(143, '2023_06_13_000001_create_participants_table', 1),
(144, '2023_06_13_000001_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` bigint UNSIGNED NOT NULL,
  `conversation_id` int NOT NULL,
  `users_id` int NOT NULL,
  `type` int NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', '4121f5abdd024d31f79df41918189cc879feb7a0b72526d3598392372923c308', '[\"*\"]', NULL, NULL, '2023-06-19 00:27:01', '2023-06-19 00:27:01'),
(2, 'App\\Models\\User', 1, 'authToken', '3472087b8a29f69474f3ef20f397d5f9db243c7924bfa9f878cb8b2473f1b86e', '[\"*\"]', NULL, NULL, '2023-06-19 00:43:53', '2023-06-19 00:43:53'),
(3, 'App\\Models\\User', 1, 'authToken', 'd7944996fe7abc4bcdb28df67f5fc21e0128feca048e4ae983189b9510f2354d', '[\"*\"]', NULL, NULL, '2023-06-19 01:31:53', '2023-06-19 01:31:53'),
(4, 'App\\Models\\User', 1, 'authToken', 'a128056d207efb15bfaf6989007533a0b13e7352cdbdd82d5dc46136cb32f4ed', '[\"*\"]', NULL, NULL, '2023-06-19 01:40:56', '2023-06-19 01:40:56'),
(5, 'App\\Models\\User', 1, 'authToken', '3ab72218af7ca9ca419fae2788e1fc57bb127fea2f6850b86665dc0f178b8fc0', '[\"*\"]', NULL, NULL, '2023-06-19 01:41:24', '2023-06-19 01:41:24'),
(6, 'App\\Models\\User', 1, 'main', 'f98b7067508c8c7b3a4863cdeb3ea812c72b2f3696607115794271e9a0ee05ce', '[\"*\"]', NULL, NULL, '2023-06-19 18:31:41', '2023-06-19 18:31:41'),
(7, 'App\\Models\\User', 1, 'main', 'a29bad8bdc340a42c48456d22dc95f4b76d5011f1157c903ee58d1aad164ee23', '[\"*\"]', NULL, NULL, '2023-06-19 18:33:33', '2023-06-19 18:33:33'),
(8, 'App\\Models\\User', 1, 'main', '3e308fe17235c8582048d7816bf44a5361f471734e8ad6dc1258c61be1c688af', '[\"*\"]', NULL, NULL, '2023-06-19 18:33:37', '2023-06-19 18:33:37'),
(9, 'App\\Models\\User', 1, 'main', '1a29b00017266422a257a332520d32a51c94fac892c0f40da3884e83bdf34c5e', '[\"*\"]', NULL, NULL, '2023-06-19 18:34:01', '2023-06-19 18:34:01'),
(10, 'App\\Models\\User', 1, 'main', '52ebc53ec1b5064023bf8a03c0d36b320a4ac82ebb2bed8b59262705308dbe86', '[\"*\"]', NULL, NULL, '2023-06-19 18:34:03', '2023-06-19 18:34:03'),
(11, 'App\\Models\\User', 1, 'main', '7972e75715fb00cd9ffd8861d946f29ae0f679b305933200bafaf95f942bf1c2', '[\"*\"]', NULL, NULL, '2023-06-19 18:37:15', '2023-06-19 18:37:15'),
(12, 'App\\Models\\User', 1, 'main', '7a22af211c28a1fa9062209ecd670b5e996720bc7e7e1b4fbc5cabd00cc4b664', '[\"*\"]', NULL, NULL, '2023-06-19 18:37:23', '2023-06-19 18:37:23'),
(13, 'App\\Models\\User', 1, 'main', 'a96ecec11ead3bd24cc10c27acbeadd3d9493e5c8c4ef769ac462916cdf3f6c6', '[\"*\"]', NULL, NULL, '2023-06-19 18:56:16', '2023-06-19 18:56:16'),
(14, 'App\\Models\\User', 1, 'main', 'ee6db36f3c9d2262330ebbe6f9031dc06cb9b5cb1808d6ca8934e417240f42c5', '[\"*\"]', '2023-06-19 19:08:40', NULL, '2023-06-19 18:56:20', '2023-06-19 19:08:40'),
(15, 'App\\Models\\User', 1, 'main', 'b853762e2e9e6c1a74e4ef12fe25d590bf43b6cffe58880a817a07e810ecfe5e', '[\"*\"]', NULL, NULL, '2023-06-19 19:10:45', '2023-06-19 19:10:45'),
(16, 'App\\Models\\User', 1, 'main', 'c07c18293c5969f28f6351df6a4a4eaeec4158274cf94e7611027f21fd97467b', '[\"*\"]', '2023-06-19 19:14:26', NULL, '2023-06-19 19:10:58', '2023-06-19 19:14:26'),
(17, 'App\\Models\\User', 1, 'main', 'f71a684e8deb37c7a9da035206a53cf151e30c77a2493ed4fc1aaea31e8685ec', '[\"*\"]', '2023-06-19 19:16:11', NULL, '2023-06-19 19:14:56', '2023-06-19 19:16:11'),
(18, 'App\\Models\\User', 1, 'main', '81c841103ffbe197b9ce1471d6658fa687ae645c825420d8e7e66375d7125158', '[\"*\"]', '2023-06-19 19:20:26', NULL, '2023-06-19 19:16:59', '2023-06-19 19:20:26'),
(19, 'App\\Models\\User', 2, 'main', '107b21cef76b58f8398d9d724194c61deaf37104134d994f5fc9fa4bd30ad455', '[\"*\"]', '2023-06-19 19:25:06', NULL, '2023-06-19 19:24:52', '2023-06-19 19:25:06'),
(20, 'App\\Models\\User', 1, 'main', 'b95e41e94fc9f943dcc0d053ce1a5bea1a24e05695794510387b8391eba22ffc', '[\"*\"]', '2023-06-19 19:37:59', NULL, '2023-06-19 19:33:55', '2023-06-19 19:37:59'),
(21, 'App\\Models\\User', 2, 'main', '870685b86b0f0e3d0309595960ec4866a426e863cdbe6fe958ab799fc6a32317', '[\"*\"]', NULL, NULL, '2023-06-19 19:38:30', '2023-06-19 19:38:30'),
(22, 'App\\Models\\User', 2, 'main', '2a5590493ff3c945a63593fecf8ac8bedf34d813dd3f5deab6d94d345e0543fb', '[\"*\"]', '2023-06-19 19:43:21', NULL, '2023-06-19 19:40:03', '2023-06-19 19:43:21'),
(23, 'App\\Models\\User', 2, 'main', 'b110bff0ab77ee62ab3c6d5ecdfeaf6d432609f73634e189c7b3e601580a852d', '[\"*\"]', NULL, NULL, '2023-06-19 19:40:28', '2023-06-19 19:40:28'),
(24, 'App\\Models\\User', 2, 'main', '225d8588aa0b9cb7c9da6d114086b60e086ff71020ece45f246563bccade927b', '[\"*\"]', '2023-06-19 20:05:13', NULL, '2023-06-19 19:47:18', '2023-06-19 20:05:13'),
(25, 'App\\Models\\User', 1, 'main', 'b74b07a3f9e8785b38fc1e8de30169bb4e6951b12190dc2d82b2800305df78c3', '[\"*\"]', '2023-06-19 20:42:35', NULL, '2023-06-19 20:20:00', '2023-06-19 20:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `middle_name`, `type`, `is_active`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'abc@xyz.com', '$2y$10$nWCnc.GQLcS1qiX78Ra4qOUVjWHZrGnr.UwzsA9/Fv9trifryTmrW', 'John', 'Smith', 'Aster', 0, 0, '2010-01-02 20:30:43', '2010-01-02 20:30:43', NULL),
(2, 'def@xyz.com', '$2y$10$erqFbeDxJHKlBq37HG0tZenDGaMndRNAyGasqoV3xItMZ0ppDXYli', 'Jane', 'Williams', 'Foster', 1, 0, '2010-01-02 20:30:43', '2010-01-02 20:30:43', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_conversations`
--
ALTER TABLE `deleted_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_messages`
--
ALTER TABLE `deleted_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `messages_guid_unique` (`guid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deleted_conversations`
--
ALTER TABLE `deleted_conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deleted_messages`
--
ALTER TABLE `deleted_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
