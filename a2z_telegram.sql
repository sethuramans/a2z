-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2025 at 12:56 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `a2z_telegram`
--

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` int(11) DEFAULT 0,
  `reason` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `user_id`, `points`, `reason`, `updated_at`) VALUES
(1, 1, 5, 'mining', '2025-04-05 03:16:17'),
(2, 1, 20, 'mining', '2025-04-05 03:17:35'),
(3, 1, 5, 'mining', '2025-04-05 05:40:58'),
(4, 1, 10, 'mining', '2025-04-05 05:42:04'),
(5, 1, 5, 'mining', '2025-04-10 16:01:44'),
(6, 1, 25, 'mining', '2025-04-10 16:52:18'),
(7, 1, 25, 'mining', '2025-04-10 16:53:19'),
(8, 1, 25, 'mining', '2025-04-10 16:58:12'),
(9, 1, 25, 'mining', '2025-04-10 17:01:28'),
(10, 1, 25, 'mining', '2025-04-10 17:03:15'),
(11, 1, 5, 'mining', '2025-04-10 17:03:29'),
(12, 1, 25, 'mining', '2025-04-10 17:07:45'),
(13, 1, 5, 'mining', '2025-04-10 17:09:02'),
(14, 1, 25, 'mining', '2025-04-10 17:10:23'),
(15, 1, 5, 'mining', '2025-04-10 17:11:44'),
(16, 1, 25, 'mining', '2025-04-10 17:17:09'),
(17, 1, 5, 'mining', '2025-04-10 17:18:31'),
(18, 1, 5, 'mining', '2025-04-10 17:21:29'),
(19, 1, 5, 'mining', '2025-04-10 17:22:04'),
(20, 1, 5, 'mining', '2025-04-10 17:22:28'),
(21, 1, 10, 'mining', '2025-04-21 11:32:13'),
(22, 1, 5, 'mining', '2025-04-21 12:21:32'),
(23, 1, 5, 'mining', '2025-04-21 12:34:21'),
(24, 1, 5, 'mining', '2025-04-21 12:45:31'),
(25, 1, 5, 'mining', '2025-04-21 13:01:25'),
(26, 1, 5, 'mining', '2025-04-21 13:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `action_text` varchar(255) NOT NULL DEFAULT 'Subscribe',
  `is_disabled` char(1) NOT NULL DEFAULT 'N',
  `seq` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `url`, `action_text`, `is_disabled`, `seq`) VALUES
(1, 'Facebook', 'https://facebook.com', 'Follow', 'N', 1),
(2, 'Youtube', 'https://youtube.com', 'Subscribe', 'N', 2),
(3, 'Instagram', 'https://instagram.com', 'Subscribe', 'N', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tasks_actions`
--

CREATE TABLE `tasks_actions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks_links`
--

CREATE TABLE `tasks_links` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `is_disabled` char(1) NOT NULL DEFAULT 'N',
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks_links`
--

INSERT INTO `tasks_links` (`id`, `task_id`, `link`, `is_disabled`, `created_on`) VALUES
(1, 1, 'https://facebook.com/sethu', 'N', '2025-04-20 06:19:31'),
(2, 2, 'https://youtube.com/sethuramans', 'N', '2025-04-20 06:19:54'),
(3, 3, 'https://instagram.com/#sethu', 'N', '2025-04-20 06:20:16'),
(4, 1, 'https://facebook.com/sethuraja', 'N', '2025-04-20 06:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `telegram_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `telegram_id`, `username`, `token`) VALUES
(1, '123456789', 'sethuramancbe', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_duplicate` (`user_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taskname` (`title`);

--
-- Indexes for table `tasks_actions`
--
ALTER TABLE `tasks_actions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_task` (`user_id`,`task_id`),
  ADD KEY `task_action` (`task_id`);

--
-- Indexes for table `tasks_links`
--
ALTER TABLE `tasks_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_task` (`task_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telegram_id` (`telegram_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks_actions`
--
ALTER TABLE `tasks_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks_links`
--
ALTER TABLE `tasks_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks_actions`
--
ALTER TABLE `tasks_actions`
  ADD CONSTRAINT `task_action` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_action` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tasks_links`
--
ALTER TABLE `tasks_links`
  ADD CONSTRAINT `fk_task` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
