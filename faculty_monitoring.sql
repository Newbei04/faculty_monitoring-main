-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2026 at 05:50 PM
-- Server version: 8.4.3
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faculty_monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_date` date NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `start_booking_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_booking_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `booking_date`, `room_id`, `user_id`, `subject_id`, `start_booking_time`, `end_booking_time`, `created_at`, `updated_at`) VALUES
(1, '2026-04-07', 1, 2, 1, '07:00:00', '09:00:00', '2026-04-14 09:57:36', '2026-04-14 09:57:36'),
(2, '2026-04-14', 1, 2, 1, '07:00:00', '09:00:00', '2026-04-14 09:57:36', '2026-04-14 09:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `schedule_id` bigint UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `schedule_id`, `date`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-04-20', 'Gusto ko eh', '2026-04-14 15:14:42', '2026-04-14 15:14:42');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_10_29_161043_create_sessions_table', 1),
(7, '2023_10_30_042739_create_tables_for_the_app', 1),
(8, '2023_11_22_155248_update_schedules_table_add_new_column', 1),
(9, '2023_11_22_175925_update_rooms_table_added_qr_code_path', 1),
(10, '2023_11_23_201309_create_attendances_table', 1),
(11, '2023_12_02_225953_create_bookings_table', 1),
(12, '2024_01_31_120212_update_users_table_add_new_fields_on_users', 1),
(13, '2024_01_31_144600_update_subjects_table_change_data_type_of_code', 1),
(14, '2024_02_09_131643_create_schedules_table', 1),
(15, '2024_02_22_001858_create_settings_table', 1),
(16, '2024_03_20_023607_create_leave_requests_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `room_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_occupied` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `building_number`, `qr_code_path`, `created_at`, `updated_at`, `is_occupied`) VALUES
(1, 'NB 101', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(2, 'NB 103', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(3, 'NB 104', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(4, 'AB 101', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(5, 'AB 103', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(6, 'AB 104', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(7, 'CLR 1', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(8, 'CLR 2', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(9, 'CLR 3', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(10, 'CLR 4', 'Academic', NULL, '2026-03-03 07:32:08', '2026-03-03 07:32:08', 0),
(11, 'CLR 5', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(12, 'NB 301', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(13, 'NB 302', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(14, 'NB 303', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(15, 'NB 304', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(16, 'FRON ROOM', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(17, 'SIMULATION ROOM', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(18, 'SUITE ROOM', 'Academic', '/qrcodes/18.svg', '2026-03-03 07:32:09', '2026-04-14 09:55:51', 0),
(19, 'STANDARD ROOM', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(20, 'DINING ROOM', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(21, 'BAR', 'Academic', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(22, 'STOCK ROOM', 'Laboratory', '/qrcodes/22.svg', '2026-03-03 07:32:09', '2026-04-14 14:54:29', 0),
(23, 'BREAD AND PASTRY ROOM', 'Laboratory', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(24, 'HOT KITCHEN', 'Laboratory', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0),
(25, 'COLD KITCHEN', 'Laboratory', NULL, '2026-03-03 07:32:09', '2026-03-03 07:32:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `subject_id`, `room_id`, `year`, `semester`, `day`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '1st Year', '1st Semester', 'Tuesday', '07:00', '09:00', '2026-04-14 09:57:36', '2026-04-14 09:57:36'),
(2, 2, 2, 1, '1st Year', '1st Semester', 'Tuesday', '10:00', '11:00', '2026-04-14 15:34:53', '2026-04-14 15:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('60m5F85DJDwshjbCMS1tNLZFZjCmTC0bjcqDeTF5', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiM0lHdWJzZk16bkZ5dEhiejc5ZURXazA4NXc1MEttNVZzUkJHZkx2ZiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvc2NhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTU6ImxvZ2luX2JhY2twYWNrXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIyOiJwYXNzd29yZF9oYXNoX2JhY2twYWNrIjtzOjYwOiIkMnkkMTAkOTJJWFVOcGtqTzByT1E1YnlNaS5ZZTRvS29FYTNSbzlsbEMvLm9nL2F0Mi51aGVXRy9pZ2kiO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkeWI2WjBVNmVaWHk2U2QuL214Y0k4LlNuLmozdXZwd3NqZXBSMmRNblVUb0JYUGlxQWYyUUciO30=', 1776272017),
('9F8sCWnXAXW1DQ45wwDiBjd26eBzPL1OS9EXitab', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6ImZSZGR6d0NBYVFFV2dsN0l3c2gyRVJ6NW8zQk5EWGh5Q0oxVVJYVEUiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTU6ImxvZ2luX2JhY2twYWNrXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIyOiJwYXNzd29yZF9oYXNoX2JhY2twYWNrIjtzOjYwOiIkMnkkMTAkOTJJWFVOcGtqTzByT1E1YnlNaS5ZZTRvS29FYTNSbzlsbEMvLm9nL2F0Mi51aGVXRy9pZ2kiO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkeWI2WjBVNmVaWHk2U2QuL214Y0k4LlNuLmozdXZwd3NqZXBSMmRNblVUb0JYUGlxQWYyUUciO3M6NjoiY3JlYXRlIjthOjE6e3M6MTA6InNhdmVBY3Rpb24iO3M6MTM6InNhdmVfYW5kX2JhY2siO31zOjY6InVwZGF0ZSI7YToxOntzOjEwOiJzYXZlQWN0aW9uIjtzOjEzOiJzYXZlX2FuZF9iYWNrIjt9fQ==', 1776183234),
('Fdrwh1G9scqve1LZivwe0N6lEFZ107tMEbiGzAUk', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiek0zRUoxOXA2RGVGclV5WGg3TEdTRnFIVW9qdEFqUnNsMllLMjUxVCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1NToibG9naW5fYmFja3BhY2tfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6InBhc3N3b3JkX2hhc2hfYmFja3BhY2siO3M6NjA6IiQyeSQxMCQ5MklYVU5wa2pPMHJPUTVieU1pLlllNG9Lb0VhM1JvOWxsQy8ub2cvYXQyLnVoZVdHL2lnaSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCR5YjZaMFU2ZVpYeTZTZC4vbXhjSTguU24uajN1dnB3c2plcFIyZE1uVVRvQlhQaXFBZjJRRyI7fQ==', 1776270971),
('GYAPcFTSvuIJ8x4eH4jVfe1V4SXmzH2fLP2OUBJr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0NtYmJMdkszejF4bkNWMHdOeEM0VWtxSno1NlYwSzQza3BsZUpEWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9mYWN1bHR5X21vbml0b3JpbmctbWFpbjo4MDAwL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1776275275),
('kMACXcYly52VsQ6Iefyi8vEkZ4cTgFDm09QFupHN', NULL, '192.168.1.10', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFl1WjB2ZjNLWWUza2JkRWNEYjF5ZDN3eHFWUHRucDQ4eGY5dUlVbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xOTIuMTY4LjEuMTA6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1776184449),
('rDiEUMiwsh27b1HacvJRPuFqYc7BsbIS1tI3T77i', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-PH) WindowsPowerShell/5.1.26100.7920', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnpTcFVNVzh3VkZ5ak5iVUs5eXpZM3hjTEtmY3F0NjJzbzl0V3RKZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1776184231),
('rFZU4LuRCPW1acTqn8xYS1Rw5ryN518MSg0PQoTr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-PH) WindowsPowerShell/5.1.26100.7920', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicURwOVh5RkJGc0xrbU44Q0t2SURVUWNETUxNa3BaaG9OT1VLNUdhYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1776184436),
('TvnekAQQulwqnnFFffeTFdpHYKvcm0dkpZ735GRc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNlR6QTR3WWdXZktrR0ZFTVF5N1lpMkV1aG5BMnNLVHNHcEtVZ01NVCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvc2NoZWR1bGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1NToibG9naW5fYmFja3BhY2tfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6InBhc3N3b3JkX2hhc2hfYmFja3BhY2siO3M6NjA6IiQyeSQxMCQ5MklYVU5wa2pPMHJPUTVieU1pLlllNG9Lb0VhM1JvOWxsQy8ub2cvYXQyLnVoZVdHL2lnaSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCR5YjZaMFU2ZVpYeTZTZC4vbXhjSTguU24uajN1dnB3c2plcFIyZE1uVVRvQlhQaXFBZjJRRyI7fQ==', 1776179025),
('uVbcn2IOfu08dDXrjLtkETHGpIGvOmFFlKSuDV58', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlRRcnExbzhFeTdwYlJYMXZQd2lRSWtDTFRBQVdFcEQ1RlpvYTV5VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1776275060);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Living in the IT Era', 'GEE 1', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(2, 'Readings in Philippine History', 'GE 2', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(3, 'Art Appreciation', 'GE 3', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(4, 'Readings in Visual Arts', 'GEE 3', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(5, 'Purposive Communication', 'GE 4', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(6, 'The Contemporary World', 'GE 5', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(7, 'Science and Technology and Society', 'GE 6', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(8, 'Gender and Society', 'GEE 6', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(9, 'Mathematics in the Modern World', 'GE 7', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(10, 'Understanding the Self', 'I_GEC 1', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(11, 'Ethics', 'SC_GE 8', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(12, 'Rizal’s Life and Works', 'GE 9A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(13, 'Society and Literature', 'LIT 1', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(14, 'Global Currents & Literature', 'LIT 2', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(15, 'Kontekstualisadong Kumunikasyon sa Filipino', 'FILIPINO 1', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(16, 'Filipino sa Ibat-Ibang Disiplina', 'FIL 2', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(17, 'Physical Activity towards Health Fitness 1', 'PE 1', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(18, 'Physical Activity towards Health Fitness 2', 'PE 2', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(19, 'Physical Activity towards Health Fitness 3', 'PE 3', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(20, 'Movement Enhancement', 'PE 1 BA', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(21, 'Civic Welfare Training Service 1', 'SC_NSTP 1', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(22, 'National Service Training Program', 'NSTP 2', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(23, 'Macro Perspective of Tourism and Hospitality', 'THC 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(24, 'Risk Management as Applied to Safety, Security and Sanitation', 'THC 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(25, 'Quality Service Management in Tourism & Hospitality', 'THC 103', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(26, 'Philippine Culture and Tourism Geography', 'THC 104', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(27, 'Micro Perspective of Tourism & Hospitality', 'THC 105', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(28, 'Tourism & Hospitality Marketing', 'THC 106', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(29, 'Professional Development & Applied Ethics', 'THC 107', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(30, 'Multicultural Diversity in Workplace for the Tourism Professional', 'THC 108', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(31, 'Entrepreneurship in Tourism and Hospitality', 'THC 109', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(32, 'Applied Business Tools and Technology', 'HPC 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(33, 'Kitchen Essentials and Basic Food Production with Laboratory', 'HPC 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(34, 'Fundamentals in Food Service Operations with Laboratory', 'HPC 103', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(35, 'Fundamentals in Lodging Operations', 'HPC 4A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(36, 'Supply Chain Management in Hospitality Industry', 'HPC 105', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(37, 'Introduction to Meetings, Incentives, Conferences and Events Management(MICE)', 'HPC 106', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(38, 'Foreign Language 1 (Mandarin)', 'HPC 107', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(39, 'Ergonomics & Facilities Planning for the Hospitality Industry', 'HPC 108', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(40, 'Research in Hospitality 1', 'HPC 109', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(41, 'Bread and Pastry with Laboratory', 'HPE 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(42, 'Introduction to Transport Service', 'HPE 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(43, 'Bar and Beverage Management with Laboratory', 'HPE 103', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(44, 'Rooms Divisions and Cost Control with Laboratory', 'HPE 104', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(45, 'Catering Management with Laboratory', 'HPE 106', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(46, 'Operations Management in Tourism and Hospitality Industry', 'BME 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(47, 'Strategic Management in Tourism & Hospitality', 'BME 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(48, 'Management & Marketing in 21st Century', 'MNGT 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(49, 'Foundation of Shorthand', 'OA 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(50, 'Keyboarding and Documents Processing', 'OA 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(51, 'Administrative Office Procedures & Management', 'OA 103', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(52, 'Business Report Writing', 'OA 104', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(53, 'Advanced Shorthand', 'OA 104 B', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(54, 'Personal & Professional Development', 'OA 105A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(55, 'Business Report Writing', 'OA 106', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(56, 'Customer Relations', 'OA 107B', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(57, 'Office Administration Internship', 'OA 108', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(58, 'Internet Research for Business', 'OA 109', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(59, 'Machine Shorthand 1', 'OA 110', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(60, 'Events Management', 'OA 110 A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(61, 'Events Management', 'OA 111', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(62, 'Integrated Software Applications', 'OA 112', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(63, 'Entrepreneurial Behavior and Competencies', 'OA 113', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(64, 'Business Law', 'OA 114', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(65, 'Taxation', 'OA 115', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(66, 'Legal Office Procedures', 'OA ELEC 1', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(67, 'Accounting 2', 'OA ELEC 2', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(68, 'Medical Office Procedures', 'OA ELEC 3', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(69, 'Filipino Stenography', 'OA ELEC 4', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(70, 'Web Design', 'OA ELEC 5', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(71, 'International Studies', 'OA ELEC 6', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(72, 'Legal/Medical Office', 'OA ELEC 7', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(73, 'Accounting for Business Enterprise', 'ACCTG 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(74, 'Human Resource Management', 'BAC 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(75, 'Basic Microeconomics', 'BAC 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(76, 'Taxation', 'BAC 103', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(77, 'International Business and Trade', 'BAC 104', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(78, 'HRDM Research 1', 'BAC 105', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(79, 'HRDM Research 2', 'BAC 106', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(80, 'Administrative and Office Management', 'HRDM 101A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(81, 'Recruitment and Selections', 'HRDM 102A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(82, 'Compensation Administration', 'HRDM 103A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(83, 'Organizational Development', 'HRDM 104A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(84, 'Human Behavior in Organization', 'MGT 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(85, 'Obligations and Contracts', 'LAW 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(86, 'Personal Finance', 'HRDM ELEC 101A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(87, 'Management Accounting', 'HRDM ELEC 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(88, 'Marketing Management', 'HRDM ELEC 103', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(89, 'HRDM Research 1', 'HRDM ELEC 104A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(90, 'Special Topics in HRDM', 'HRDM ELEC 105A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(91, 'Labor Laws and Legislation', 'HRDM ELEC 106', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(92, 'Introduction to Computing', 'CC 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(93, 'Fundamentals of Programming', 'CC 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(94, 'Intermediate Programming', 'CC 103', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(95, 'Computer Organization', 'CO 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(96, 'Discrete Mathematics', 'MS 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(97, 'Human Computer Interaction 1', 'HCI 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(98, 'Object Oriented Programming', 'OOP 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(99, 'Human Computer Interaction 2', 'HCI 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(100, 'Multimedia Technologies', 'MT 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(101, 'Networking 1 (Fundamentals of Networking)', 'NET 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(102, 'Information Management 1 (Fundamentals of Database)', 'CC 105', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(103, 'System Analysis and Design', 'SAD 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(104, 'Web Development 1', 'WD 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(105, 'Application Development and Emerging Technologies', 'CC 106', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(106, 'Information Management 2', 'IM 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(107, 'Mobile Application Development 1', 'MD 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(108, 'Quantitative Methods', 'MS 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(109, 'Networking 2 (Advanced Networking)', 'NET 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(110, 'Operating Systems Application', 'OS 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(111, 'Social and Professional Issues', 'SP 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(112, 'Web Systems and Technologies 1', 'WS 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(113, 'Capstone Project 2', 'CAP 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(114, 'Elective 3 (Special Topics on Web and Mobile 1)', 'ELEC 3', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(115, 'Elective 4 (Special Topics on Web and Mobile 2)', 'ELEC 4', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(116, 'Information Assurance and Security 2', 'IAS 102', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(117, 'System Administration and Maintenance', 'SA 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(118, 'System Integration and Architecture', 'SIA 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(119, 'Elective 2 (Mobile Application Development 2)', 'ELEC 2A', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(120, 'Technopreneurship', 'TECH 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(121, 'Elective 1 (Web Systems and Technologies 2)', 'ELEC1', '2026-03-03 07:32:08', '2026-03-03 07:32:08'),
(122, 'Information Assurance and Security 1', 'IAS 101', '2026-03-03 07:32:08', '2026-03-03 07:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_initial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `role`, `created_at`, `updated_at`, `first_name`, `last_name`, `middle_initial`, `name_extension`) VALUES
(1, 'rmredenrudolfrecto10@gmail.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Ow6Sc8WIUABDEsJjElSnw6Kw01VGc6euZ7LsrRcevTLidVy6OZnIBK3uFmHL', NULL, NULL, 'admin', NULL, NULL, 'Reden', 'Recto', 'Rovillos', NULL),
(2, 'clarence@gmail.com', NULL, '$2y$10$yb6Z0U6eZXy6Sd./mxcI8.Sn.j3uvpwsjepR2dMnUToBXPiqAf2QG', NULL, NULL, NULL, 'xRvmSYm2LhU43RQe59xmKmB3O40XAhZtKdkCnQKfByHlMNYbWsiRBQw2ZGzt', NULL, NULL, 'faculty', '2026-04-14 09:55:16', '2026-04-14 09:55:16', 'Clarence', 'Nanlabi', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
