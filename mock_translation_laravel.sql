-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2023 at 05:23 PM
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
(1, 'Customer No. 1234', 1, 0, '2023-06-16 13:31:43', NULL, NULL);

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
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `guid`, `message_type`, `conversation_id`, `sender_id`, `message`, `translated_message`, `created_at`, `deleted_at`) VALUES
(1, 'Eum odit corporis ullam eligendi. Optio et aspernatur atque vel est ut dignissimos consectetur. Harum aut repellendus officiis fugit veniam voluptates.', 0, 1, 1, 'Quia sit quod culpa quia voluptas. Cum adipisci quia dignissimos enim. Accusantium mollitia et dolorem saepe aliquid voluptatem. Ad porro ipsum qui saepe adipisci mollitia.', NULL, '2023-06-02 00:00:00', NULL),
(2, 'Harum repudiandae rem voluptatem culpa commodi voluptates maxime. Incidunt nisi sunt iure error ipsa. Non ipsa facere eveniet quisquam et.', 2, 1, 2, 'Neque voluptatem provident molestiae et odio. Sint eligendi est inventore aut placeat quod libero. Alias voluptatum ut ipsam illo incidunt fugiat.', NULL, '2023-05-21 00:00:00', NULL),
(3, 'Quia necessitatibus rerum necessitatibus modi dignissimos quia ut. Sint est expedita excepturi quia possimus eos. Eaque cupiditate voluptas et assumenda cum ea iste.', 1, 1, 1, 'Culpa quis commodi est consequuntur alias velit vel. Exercitationem dolor earum sit voluptatem dolores. Reiciendis tempora voluptatum voluptas sunt et aut eum. Quas fugiat et quia debitis veniam. Quia voluptatem facere aut harum nobis.', NULL, '2023-05-27 00:00:00', NULL),
(4, 'Repudiandae ea placeat perspiciatis quisquam est architecto. Consequuntur deserunt ipsa quas. Et natus voluptas consequatur doloribus. Pariatur voluptas dignissimos adipisci voluptates possimus aut. Suscipit explicabo nesciunt voluptates ut.', 1, 1, 1, 'Ipsa magni praesentium et deserunt. Aliquam fugit sit tempore quis. Molestias quia maxime rerum doloremque.', NULL, '2023-05-26 00:00:00', NULL),
(5, 'Dolorem minus nam ut. Iusto voluptate assumenda placeat. Ratione mollitia natus libero incidunt ut iure asperiores velit. Nesciunt optio accusamus et doloremque ex doloribus. Excepturi et asperiores iure aliquid sed eligendi.', 0, 1, 2, 'Autem suscipit inventore dolorem ut repellat eveniet. Pariatur voluptas cum et nihil velit nihil. Consequuntur placeat dolores molestiae iure ipsum qui. Et voluptate aut ex eligendi sed necessitatibus.', NULL, '2023-05-22 00:00:00', NULL),
(6, 'Vel placeat molestiae quia excepturi. Quae similique cumque error vel ab. Dolore non corporis molestiae animi et nostrum assumenda.', 2, 1, 2, 'Quia quo magni provident veniam rerum. Ut nulla vero numquam provident numquam tenetur. Voluptatem consectetur modi et. Repudiandae et explicabo et adipisci saepe ut sed nemo.', NULL, '2023-06-15 00:00:00', NULL),
(7, 'Omnis nesciunt consequatur tempora sit sint quasi. Saepe voluptatem rerum reiciendis vitae quae. Voluptatem laborum quibusdam labore dolor praesentium quia reprehenderit. Accusantium et nihil qui deleniti quis et.', 2, 1, 1, 'Qui dolores nesciunt cumque quia. Ea aut omnis neque quasi. Occaecati hic rerum velit possimus perferendis sit accusantium enim. Non odio molestiae inventore officiis.', NULL, '2023-05-23 00:00:00', NULL),
(8, 'Suscipit quis rerum tempore quia animi. Qui aperiam non occaecati magni explicabo. Deleniti excepturi quas dolores et. Non eveniet aliquam est. Mollitia occaecati hic perferendis dignissimos eveniet.', 2, 1, 1, 'Hic laborum error voluptas facilis dignissimos qui neque eos. Optio sint exercitationem dolorem repudiandae. Molestias quisquam cum dolorem aut magnam. Explicabo eum aliquid sapiente minima provident aut.', NULL, '2023-05-30 00:00:00', NULL),
(9, 'Neque ea doloremque aut adipisci. Animi placeat et inventore a. Atque omnis totam dolores distinctio ipsa et et qui. Debitis veniam ea tempore voluptate omnis quis. Itaque natus pariatur fugit delectus.', 0, 1, 2, 'Consequuntur temporibus similique et est expedita quia officia. Earum animi laudantium voluptatem dicta laboriosam harum voluptas. Cumque voluptatum pariatur reprehenderit mollitia nihil. Et dolores facilis ad eligendi ea. Dolore ea ipsam facilis qui.', NULL, '2023-05-17 00:00:00', NULL),
(10, 'Minus dignissimos vitae ut a facere. Vel perspiciatis cupiditate voluptatibus. Ad saepe et dolores enim et in. Modi fuga sequi minus sunt dolore sequi qui.', 1, 1, 2, 'Est facere rem enim facere sunt recusandae repellendus beatae. Excepturi voluptatibus aut illum non sint nesciunt sunt. Et eos quo optio minima dignissimos est mollitia aliquid. Dolores fugit ipsam similique numquam ut placeat.', NULL, '2023-06-01 00:00:00', NULL),
(11, 'Cumque a velit sed omnis et quo dignissimos. Unde autem amet doloribus dolor. Officiis rerum harum voluptatem in minima. Officiis laboriosam ad sit quaerat dolor culpa. Maiores numquam eius porro occaecati nam totam.', 2, 1, 2, 'Qui voluptates quos unde quia occaecati voluptatem. Blanditiis quibusdam ipsam aspernatur nesciunt cumque ut deleniti. Perspiciatis nihil consectetur ut minus qui. Architecto sapiente repellat ad eligendi.', NULL, '2023-05-29 00:00:00', NULL),
(12, 'Quis et et quod nisi architecto itaque asperiores. Aut sint corporis doloremque voluptatem delectus qui. Dignissimos omnis consequatur aut fugiat aut laborum sunt. Nihil modi dolores vitae iusto sint nihil inventore. Soluta ea sapiente provident.', 1, 1, 2, 'Fugit error alias delectus quasi et et. Officiis debitis dicta ipsum quia aspernatur. Voluptas laudantium aperiam vel officiis. Expedita adipisci praesentium error neque a qui.', NULL, '2023-06-10 00:00:00', NULL),
(13, 'Dolores et molestiae inventore voluptas omnis et dolores accusamus. Asperiores et ut eos ut nostrum magnam natus.', 0, 1, 1, 'Commodi id tempora quis odit atque omnis. Facere dolores veritatis veritatis voluptatibus occaecati. Sit ut adipisci praesentium dolor culpa repellat.', NULL, '2023-05-18 00:00:00', NULL),
(14, 'Ad doloribus quo voluptatem cumque sed adipisci. Laboriosam qui deleniti harum doloribus ipsum laboriosam. Culpa ipsum officia rem illum non dolor. Sapiente reiciendis fugiat maxime nam qui veniam nostrum.', 1, 1, 2, 'Enim natus aperiam repellat reiciendis. Aliquam quaerat quia aut ut consequuntur delectus labore id. Et aut nemo et quia inventore. Hic architecto sed dolor mollitia atque. Consequatur illum aut velit voluptatem. Itaque quibusdam id sed quod.', NULL, '2023-05-16 00:00:00', NULL),
(15, 'Corrupti quo fugit ullam ipsum quidem est. Aperiam doloremque aperiam corporis dignissimos illum et. Illum culpa eius qui ea. Optio aliquam vero nam necessitatibus officiis.', 2, 1, 1, 'Ut minus cumque voluptatem quo. Beatae molestiae eum asperiores vero. Ipsam vero sapiente fugiat doloremque.', NULL, '2023-06-06 00:00:00', NULL);

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
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_06_13_000001_create_attachments_table', 1),
(3, '2023_06_13_000001_create_conversations_table', 1),
(4, '2023_06_13_000001_create_deleted_conversations_table', 1),
(5, '2023_06_13_000001_create_deleted_messages_table', 1),
(6, '2023_06_13_000001_create_messages_table', 1),
(7, '2023_06_13_000001_create_participants_table', 1),
(8, '2023_06_13_000001_create_users_table', 1);

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

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `conversation_id`, `users_id`, `type`, `created_at`, `deleted_at`) VALUES
(1, 1, 1, 0, '2023-06-16 13:34:02', NULL),
(2, 1, 2, 0, '2023-06-16 13:34:22', NULL);

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
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `middle_name`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'abc@xyz.com', '123', 'John', 'Smith', 'Aster', 0, 0, '2010-01-02 20:30:43', '2010-01-02 20:30:43'),
(2, 'def@xyz.com', '123', 'Jane', 'Williams', 'Foster', 1, 0, '2010-01-02 20:30:43', '2010-01-02 20:30:43'),
(3, 'asdas@sasdas.com', '$2y$10$oAssWEHEToa3dBvTtIu5j.LR2Yc8JI1lgS/GkUJ0/2CHchkcRQcdC', 'asdasd', 'asdasdd', 'asdasd', 0, 0, '2023-06-16 00:52:02', '2023-06-16 00:52:02'),
(5, 'user4@gmail', '$2y$10$KWl00uhCa3ka1yDAtmQwbuYCllZYXE1WvFEV.LbMxzdXnJCQgmW7.', 'User', 'Four', NULL, 0, 0, '2023-06-16 01:12:11', '2023-06-16 01:12:11'),
(6, 'user5@gmail', '$2y$10$3pk.HfMwQLItqyg4X3JHV.z6Z9bWrjfBQZD5SBBQ3ZHtMIGtcB0Re', 'User', 'Five', NULL, 0, 0, '2023-06-16 01:12:41', '2023-06-16 01:12:41'),
(7, 'user6@gmail', '$2y$10$nSepknQKMBaCx11m/Wq9z.rQVH1R3V2IhGoRQ.f0Qg5ftom/8WvGi', 'User', 'Six', NULL, 0, 0, '2023-06-16 01:13:12', '2023-06-16 01:13:12'),
(8, 'user7@gmail', '$2y$10$dBacD8dysfeZhBngBYkXrOLsr5k66524rynRGMEY9m17lXL7/MjFe', 'User', 'Seven', NULL, 0, 0, '2023-06-16 01:13:34', '2023-06-16 01:13:34'),
(9, 'user8@gmail', '$2y$10$5R9o5eQeBABtX6AI9ZeeDOhDHWt64XkDnpzQ6ecVJyTa67bS7RQJu', 'User', 'Eight', NULL, 0, 0, '2023-06-16 01:16:58', '2023-06-16 01:16:58'),
(10, 'user9@gmail', '$2y$10$1t1PNzgjoIQUdX9rsCeVFOYuRiI65QZ6uuSQTDZjrtwA9EoGxqfiS', 'User', 'Nine', NULL, 0, 0, '2023-06-16 01:17:52', '2023-06-16 01:17:52');

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
