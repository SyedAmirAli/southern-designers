-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2024 at 07:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ctp_southern_designer`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `delete` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `permission_id`, `parent_id`, `name`, `route`, `icon`, `order`, `status`, `delete`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Settings', NULL, '<i class=\"far fa-cogs\"></i>', 100, 1, 1, '2024-02-07 07:55:58', '2024-02-07 07:55:58'),
(2, 2, 1, 'App Setting', 'admin.settings.index', NULL, 1, 1, 1, '2024-02-07 07:57:10', '2024-02-07 07:57:10'),
(3, 3, 1, 'Admin Setting', 'admin.admin-settings.index', '<i class=\"far fa-user-cog\"></i>', 2, 1, 1, '2024-02-07 07:58:56', '2024-02-07 07:58:56'),
(5, 5, 1, 'Admin Menu', 'admin.admin-menu.index', '<i class=\"far fa-cogs\"></i>', 4, 1, 1, '2024-02-07 10:19:56', '2024-02-07 10:19:56'),
(43, 60, 1, 'Role Setup', 'admin.role.index', NULL, 5, 1, 1, '2024-02-15 04:35:35', '2024-02-15 04:35:35'),
(44, 61, 1, 'User Create', 'admin.user.index', NULL, 6, 1, 1, '2024-02-15 04:45:08', '2024-02-15 04:45:08'),
(73, 100, 72, 'Registration Form Setup', 'admin.volunteer-registration-form.index', NULL, 1, 1, 1, '2024-03-31 11:16:50', '2024-03-31 11:16:50'),
(80, 107, 1, 'Authentication Page', 'admin.auth-page.index', NULL, 8, 1, 1, '2024-04-07 11:20:56', '2024-04-07 11:20:56'),
(81, 108, NULL, 'Home', 'admin.homepage-setup.index', '<i class=\"fas fa-laptop-house\"></i>', 1, 1, 1, '2024-10-07 04:19:43', '2024-10-07 04:20:08'),
(82, 109, 81, 'Page Setup', 'admin.home-page-setup.index', NULL, 1, 1, 1, '2024-10-07 04:21:31', '2024-10-07 04:21:31'),
(83, 110, 81, 'Services Products', 'admin.home-page-services-product.index', '<i class=\"fab fa-servicestack\"></i>', 2, 1, 1, '2024-10-07 06:22:57', '2024-10-07 06:22:57'),
(84, 111, 81, 'Primary Services', 'admin.home-page-primary-services.index', NULL, 3, 1, 1, '2024-10-07 07:23:04', '2024-10-07 07:23:04'),
(85, 122, 81, 'Services Counter', 'admin.home-page-services-counter.index', NULL, 4, 1, 1, '2024-10-07 08:11:00', '2024-10-07 08:11:00'),
(86, 127, 81, 'Others Services', 'admin.home-page-others-services.index', NULL, 5, 1, 1, '2024-10-07 08:49:45', '2024-10-07 08:49:45'),
(87, 133, 81, 'Reviews', 'admin.home-page-reviews.index', NULL, 6, 1, 1, '2024-10-07 09:12:20', '2024-10-07 09:12:20'),
(88, 139, 81, 'Brands', 'admin.home-page-brands.index', NULL, 7, 1, 1, '2024-10-07 09:54:35', '2024-10-07 09:54:35'),
(89, 150, NULL, 'Category & Product', NULL, '<i class=\"fas fa-project-diagram\"></i>', 2, 1, 1, '2024-10-07 10:57:42', '2024-10-07 10:57:42'),
(90, 151, NULL, 'Media', NULL, '<i class=\"fas fa-photo-video\"></i>', 3, 1, 1, '2024-10-07 11:03:01', '2024-10-07 11:03:01'),
(91, 152, NULL, 'Contact', NULL, '<i class=\"fas fa-phone-volume\"></i>', 5, 1, 1, '2024-10-07 11:03:49', '2024-10-07 11:03:49'),
(92, 153, NULL, 'About', NULL, '<i class=\"fas fa-id-card-alt\"></i>', 4, 1, 1, '2024-10-07 11:04:28', '2024-10-07 11:04:28'),
(93, 154, 90, 'Manage Media', 'admin.media.index', NULL, 1, 1, 1, '2024-10-07 11:08:12', '2024-10-07 11:08:12'),
(94, 155, 89, 'Manage Category', 'admin.category.index', NULL, 1, 1, 1, '2024-10-07 11:08:51', '2024-10-07 11:08:51'),
(95, 156, 89, 'Manage Products', 'admin.product.index', NULL, 2, 1, 1, '2024-10-07 11:09:28', '2024-10-07 11:09:28'),
(96, 157, 92, 'Manage Members', 'admin.about-us.index', NULL, 1, 1, 1, '2024-10-07 11:11:18', '2024-10-08 04:18:52'),
(97, 158, 91, 'Contact Us', 'admin.contacts.index', NULL, 2, 1, 1, '2024-10-07 11:17:38', '2024-10-07 11:17:38'),
(98, 159, 90, 'Media Banner', 'admin.media-banner.index', NULL, 1, 1, 1, '2024-10-07 17:22:13', '2024-10-07 17:22:13'),
(99, 160, 90, 'Media Gallery', 'admin.media-gallery.index', NULL, 3, 1, 1, '2024-10-08 03:25:47', '2024-10-08 03:25:47'),
(100, 161, NULL, 'Sustainability', NULL, '<i class=\"fas fa-assistive-listening-systems\"></i>', 5, 1, 1, '2024-10-08 03:35:52', '2024-10-08 03:36:57'),
(101, 162, 100, 'Manage Sustainability', 'admin.sustainability.index', NULL, 1, 1, 1, '2024-10-08 03:37:50', '2024-10-08 03:37:50'),
(102, 163, 100, 'Sustainability Videos', 'admin.sustainability-videos.index', NULL, 2, 1, 1, '2024-10-08 03:38:24', '2024-10-08 03:38:24'),
(103, 164, 92, 'About Banner', 'admin.about-banner.index', NULL, 1, 1, 1, '2024-10-08 04:18:19', '2024-10-08 04:18:19'),
(104, 165, 91, 'Contact Banner', 'admin.contacts-banner.index', NULL, 0, 1, 1, '2024-10-08 05:07:56', '2024-10-08 05:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_actions`
--

CREATE TABLE `admin_menu_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `admin_menu_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `route` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu_actions`
--

INSERT INTO `admin_menu_actions` (`id`, `permission_id`, `admin_menu_id`, `name`, `route`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 4, 'Create', 'admin.client-navigation-menu.create', 1, '2024-02-07 11:00:20', '2024-02-07 11:00:20'),
(2, 7, 4, 'Index', 'admin.client-navigation-menu.index', 1, '2024-02-07 11:00:48', '2024-02-07 11:00:48'),
(3, 8, 4, 'Edit', 'admin.client-navigation-menu.edit', 1, '2024-02-07 11:01:02', '2024-02-07 11:01:02'),
(4, 11, 7, 'Create', 'admin.slider.create', 1, '2024-02-08 06:55:40', '2024-02-08 06:55:40'),
(5, 12, 7, 'Edit', 'admin.slider.edit', 1, '2024-02-08 06:55:51', '2024-02-08 06:55:51'),
(6, 14, 8, 'Create', 'admin.blog.create', 1, '2024-02-08 09:02:59', '2024-02-08 09:02:59'),
(7, 15, 8, 'Edit', 'admin.blog.edit', 1, '2024-02-08 09:03:23', '2024-02-08 09:03:23'),
(8, 18, 10, 'Create', 'admin.workout-section.create', 1, '2024-02-08 15:56:38', '2024-02-08 15:56:38'),
(9, 19, 10, 'Edit', 'admin.workout-section.edit', 1, '2024-02-08 15:56:49', '2024-02-08 15:56:49'),
(10, 21, 11, 'Video create', 'admin.video-gallery.create', 1, '2024-02-10 06:20:09', '2024-02-10 06:39:47'),
(11, 22, 11, 'Video Edit', 'admin.video-gallery.edit', 1, '2024-02-10 06:20:50', '2024-02-10 06:20:50'),
(14, 27, 13, 'Image Create', 'admin.image-gallery.create', 1, '2024-02-10 15:07:32', '2024-02-10 15:07:32'),
(15, 28, 13, 'Image Edit', 'admin.image-gallery.edit', 1, '2024-02-10 15:08:09', '2024-02-10 15:08:09'),
(16, 35, 18, 'Team Page Top Section', 'admin.team-top.create', 1, '2024-02-10 16:51:20', '2024-02-10 16:51:20'),
(18, 64, 46, 'Create', 'admin.works-area-details.create', 1, '2024-02-16 08:33:01', '2024-02-16 08:33:01'),
(19, 65, 46, 'Edit', 'admin.works-area-details.edit', 1, '2024-02-16 08:33:09', '2024-02-16 08:33:09'),
(22, 74, 52, 'Create', 'admin.career-item.create', 1, '2024-02-19 08:25:24', '2024-02-19 08:26:35'),
(23, 75, 52, 'Edit', 'admin.career-item.edit', 1, '2024-02-19 08:25:39', '2024-02-19 08:26:26'),
(24, 76, 51, 'Create', 'admin.career.create', 1, '2024-02-19 08:28:59', '2024-02-19 08:28:59'),
(25, 77, 51, 'Edit', 'admin.career.edit', 1, '2024-02-19 08:29:13', '2024-02-19 08:29:13'),
(26, 83, 13, 'Destroy', 'admin.image-gallery.destroy', 1, '2024-03-14 11:14:07', '2024-03-14 11:14:07'),
(27, 84, 11, 'Destroy', 'admin.video-gallery.destroy', 1, '2024-03-14 11:15:43', '2024-03-14 11:15:43'),
(28, 112, 84, 'Create', 'admin.home-page-primary-services.create', 1, '2024-10-07 07:53:02', '2024-10-07 07:53:02'),
(29, 113, 84, 'Edit', 'admin.home-page-primary-services.edit', 1, '2024-10-07 07:53:29', '2024-10-07 07:53:29'),
(30, 114, 84, 'Show', 'admin.home-page-primary-services.show', 1, '2024-10-07 07:53:53', '2024-10-07 07:53:53'),
(31, 115, 83, 'Create', 'admin.home-page-services-product.create', 1, '2024-10-07 07:54:36', '2024-10-07 07:54:36'),
(32, 116, 83, 'Edit', 'admin.home-page-services-product.edit', 1, '2024-10-07 07:54:48', '2024-10-07 07:54:48'),
(33, 117, 83, 'Update', 'admin.home-page-services-product.update', 1, '2024-10-07 07:54:59', '2024-10-07 07:54:59'),
(34, 118, 83, 'Show', 'admin.home-page-services-product.show', 1, '2024-10-07 07:55:08', '2024-10-07 07:55:08'),
(35, 119, 83, 'Destroy', 'admin.home-page-services-product.destroy', 1, '2024-10-07 07:55:22', '2024-10-07 07:55:22'),
(36, 120, 84, 'Destroy', 'admin.home-page-primary-services.destroy', 1, '2024-10-07 07:56:49', '2024-10-07 07:56:49'),
(37, 121, 84, 'Update', 'admin.home-page-primary-services.update', 1, '2024-10-07 07:57:00', '2024-10-07 07:57:00'),
(38, 123, 85, 'Create', 'admin.home-page-services-counter.create', 1, '2024-10-07 08:11:37', '2024-10-07 08:11:37'),
(39, 124, 85, 'Edit', 'admin.home-page-services-counter.edit', 1, '2024-10-07 08:11:50', '2024-10-07 08:11:50'),
(40, 125, 85, 'Update', 'admin.home-page-services-counter.update', 1, '2024-10-07 08:12:03', '2024-10-07 08:12:03'),
(41, 126, 85, 'Destroy', 'admin.home-page-services-counter.destroy', 1, '2024-10-07 08:12:15', '2024-10-07 08:12:15'),
(42, 128, 86, 'Create', 'admin.home-page-others-services.create', 1, '2024-10-07 08:57:04', '2024-10-07 08:57:04'),
(43, 129, 86, 'Edit', 'admin.home-page-others-services.edit', 1, '2024-10-07 08:57:12', '2024-10-07 08:57:12'),
(44, 130, 86, 'Update', 'admin.home-page-others-services.update', 1, '2024-10-07 08:57:21', '2024-10-07 08:57:21'),
(45, 131, 86, 'Destroy', 'admin.home-page-others-services.destroy', 1, '2024-10-07 08:57:38', '2024-10-07 08:57:38'),
(46, 132, 86, 'Show', 'admin.home-page-others-services.show', 1, '2024-10-07 08:57:52', '2024-10-07 08:57:52'),
(47, 134, 87, 'Create', 'admin.home-page-reviews.create', 1, '2024-10-07 09:12:38', '2024-10-07 09:12:38'),
(48, 135, 87, 'Show', 'admin.home-page-reviews.show', 1, '2024-10-07 09:12:47', '2024-10-07 09:12:47'),
(49, 136, 87, 'Edit', 'admin.home-page-reviews.edit', 1, '2024-10-07 09:12:56', '2024-10-07 09:12:56'),
(50, 137, 87, 'Update', 'admin.home-page-reviews.update', 1, '2024-10-07 09:13:11', '2024-10-07 09:13:11'),
(51, 138, 87, 'Destroy', 'admin.home-page-reviews.destroy', 1, '2024-10-07 09:13:24', '2024-10-07 09:13:24'),
(52, 140, 88, 'Create', 'admin.home-page-brands.create', 1, '2024-10-07 09:54:56', '2024-10-07 09:54:56'),
(53, 141, 88, 'Edit', 'admin.home-page-brands.edit', 1, '2024-10-07 09:55:04', '2024-10-07 09:55:04'),
(54, 142, 88, 'Update', 'admin.home-page-brands.update', 1, '2024-10-07 09:55:15', '2024-10-07 09:55:15'),
(55, 143, 88, 'Show', 'admin.home-page-brands.show', 1, '2024-10-07 09:55:24', '2024-10-07 09:55:24'),
(56, 144, 88, 'Destroy', 'admin.home-page-brands.destroy', 1, '2024-10-07 09:55:35', '2024-10-07 09:55:35'),
(57, 145, 5, 'Create', 'admin.admin-menu.create', 1, '2024-10-07 10:55:26', '2024-10-07 10:55:26'),
(58, 146, 5, 'Edit', 'admin.admin-menu.edit', 1, '2024-10-07 10:55:36', '2024-10-07 10:55:36'),
(59, 147, 5, 'Show', 'admin.admin-menu.show', 1, '2024-10-07 10:55:48', '2024-10-07 10:55:48'),
(60, 148, 5, 'Update', 'admin.admin-menu.update', 1, '2024-10-07 10:56:04', '2024-10-07 10:56:04'),
(61, 149, 5, 'Destroy', 'admin.admin-menu.destroy', 1, '2024-10-07 10:56:17', '2024-10-07 10:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `secondary_color` varchar(255) DEFAULT NULL,
  `primary_color` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `logo`, `favicon`, `title`, `footer_text`, `secondary_color`, `primary_color`, `facebook`, `twitter`, `linkedin`, `whatsapp`, `google`, `created_at`, `updated_at`) VALUES
(1, 'media/admin-setting/2024-10-07-qRvKOamvI7vt9ddQC3yL8FkmofNNAfDZRH7bpdWn.png', 'media/admin-setting/2024-10-07-p1BSgofmL3nlqIsgEzNJ3msR6bgEHUCvRgoBAge0.png', 'Soutern Designers', '@Copyright By ME', '#000000', '#0b8f42', 'https://www.facebook.com/syedamir0', 'https://www.facebook.com/syedamir0', 'https://www.facebook.com/syedamir0', 'https://api.whatsapp.com/send?phone=01817807594', NULL, '2024-02-07 08:14:43', '2024-10-07 03:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `home_title` varchar(255) DEFAULT NULL,
  `faq_title` varchar(255) DEFAULT NULL,
  `services_title` varchar(255) DEFAULT NULL,
  `about_title` varchar(255) DEFAULT NULL,
  `search_title` varchar(255) DEFAULT NULL,
  `services_title_one` varchar(255) DEFAULT NULL,
  `services_title_two` varchar(255) DEFAULT NULL,
  `basic_title_one` varchar(255) DEFAULT NULL,
  `basic_title_two` text DEFAULT NULL,
  `basic_title_three` varchar(255) DEFAULT NULL,
  `basic_title_four` text DEFAULT NULL,
  `basic_title_five` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `secondary_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `banner_animation_image` varchar(255) DEFAULT NULL,
  `map_image` varchar(255) DEFAULT NULL,
  `footer_image` varchar(255) DEFAULT NULL,
  `footer_animation_image` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `threads` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `map_url` text DEFAULT NULL,
  `phone_one` varchar(255) DEFAULT NULL,
  `phone_two` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `title`, `home_title`, `faq_title`, `services_title`, `about_title`, `search_title`, `services_title_one`, `services_title_two`, `basic_title_one`, `basic_title_two`, `basic_title_three`, `basic_title_four`, `basic_title_five`, `logo`, `secondary_logo`, `favicon`, `banner_image`, `banner_animation_image`, `map_image`, `footer_image`, `footer_animation_image`, `facebook`, `threads`, `youtube`, `whatsapp`, `twitter`, `instagram`, `linkedin`, `pinterest`, `map_url`, `phone_one`, `phone_two`, `email`, `meta_title`, `meta_keyword`, `meta_description`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'Pathgriho', NULL, 'Visit Our Facebook Page', 'Contact Us', 'About Us', 'AT-LABS.', NULL, NULL, 'example.secondary@gmail.com', '<iframe             src=\"https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fpathgrihobd&amp;tabs=timeline&amp;width=3000&amp;height=800&amp;small_header=true&amp;adapt_container_width=false&amp;hide_cover=false&amp;show_facepile=false&amp;appId\"             width=\"3000\"             height=\"240\"             style=\"border: none; overflow: hidden\"             scrolling=\"no\"             frameborder=\"0\"             allowfullscreen=\"true\"             allow=\"autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share\"           ></iframe>', 'Pathgriho Foundation, Grihobasider Milonmela, Bangladesh.', 'Pathgriho Foundation is a non-profit organization that empowers               underprivileged individuals and communities in Bangladesh               through education, youth development, women’s empowerment,               climate change, governance and poverty alleviation.', 'Pathgriho Foundation', 'media/app-setting/2024-03-26-yi0FlCu2h21KTDPGVX6557wVJSJvQpHqzwnXIyP4.png', 'media/app-setting/2024-03-26-ImuggzRxXofzvHWnKmsMK2UX2s7APV92qnOAj4ie.png', 'media/app-setting/2024-02-17-luJCWGPra3kDsekEdNeOeRQrADGZDg3pjJpHfbzK.jpg', 'media/app-setting/2024-02-17-luJCWGPra3kDsekEdNeOeRQrADGZDg3pjJpHfbzK.jpg2024-02-17-jVd72TsD7IMSeJWMisJKORNkJPFL7rCQ20s9sQ0F.png2024-02-17-AItSiqpegrU951xhTWdWAY0wnIyAusl0XNnfbT1V.png2024-02-17-2oWHqsirFHuzLgPGwXtBFuXj1BcTqmctPvmPhtqA.png', 'media/app-setting/2024-02-17-fo4gCoRtlBNdjez7J4WanNPiqLzM4zbbWQGivSv0.jpg', NULL, 'media/app-setting/2024-03-26-3rPP1PY1a4WUMfAlGGsjL2Y6t9PbyO2BialiYbs5.png', 'media/app-setting/2024-03-26-rWbC2zLVeuQz7y26YNE7CEAP3iFNJ8x7D2msm0Rd.png', 'https://www.facebook.com/pathgrihobd', NULL, '#', NULL, NULL, NULL, NULL, NULL, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d116833.97303538515!2d90.33728788013568!3d23.780818635354535!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8b087026b81%3A0x8fa563bbdd5904c2!2sDhaka!5e0!3m2!1sen!2sbd!4v1707900588217!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '+880 17807500', '+880 17807500', 'example@gmail.com', NULL, NULL, NULL, '2024-02-07 08:41:47', '2024-03-26 16:27:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `image`, `name`, `serial`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'media/home-page-brands/images/2024-10-07-XVkZ0rPyOAUQR5z9stUjUnlIa3TRn7MHITtUaQQl.png', NULL, 1, 1, 16, '2024-10-07 09:57:11', '2024-10-07 09:57:11'),
(2, 'media/home-page-brands/images/2024-10-07-gCqkNgYc1iZujYpqHDXWO2EOjADGwnkXXNwhLecC.png', NULL, 1, 1, 16, '2024-10-07 09:57:21', '2024-10-07 09:57:21'),
(3, 'media/home-page-brands/images/2024-10-07-0SHqRC7eg1bKm3bZcvxTH6cdATGmX0uoWABviNhY.png', NULL, 1, 1, 16, '2024-10-07 09:57:30', '2024-10-07 09:57:30'),
(4, 'media/home-page-brands/images/2024-10-07-PO9S5CqCch8LbGdeVm7tcLEdkrhmL6uHZ9nXqxgt.png', NULL, 1, 1, 16, '2024-10-07 09:57:42', '2024-10-07 09:57:42'),
(5, 'media/home-page-brands/images/2024-10-07-ssPmbHzswRSmxEIOb43Ddx1KQLY2GfigbkL9qepz.png', NULL, 1, 1, 16, '2024-10-07 09:57:55', '2024-10-07 09:57:55'),
(6, 'media/home-page-brands/images/2024-10-07-wftcj05OoLQsiAyUD2KRDgjK3HKxCy6XF2KysXdF.png', NULL, 1, 1, 16, '2024-10-07 09:58:09', '2024-10-07 09:58:09'),
(7, 'media/home-page-brands/images/2024-10-07-zoWiEZFtKbhbK1bRkYJHHvcuS3yLSM6B7zDFoN9h.png', NULL, 1, 1, 16, '2024-10-07 09:58:21', '2024-10-07 09:58:21'),
(8, 'media/home-page-brands/images/2024-10-07-9zxUx19yZlTMaOg6TclPEm7C7jagI7b562DTLFmE.png', NULL, 1, 1, 16, '2024-10-07 09:58:35', '2024-10-07 09:58:35'),
(9, 'media/home-page-brands/images/2024-10-07-0ix9lDUaicYksLtelP8up3EJTTqHgkLPihAsSm9j.png', NULL, 1, 1, 16, '2024-10-07 09:58:49', '2024-10-07 09:58:49'),
(10, 'media/home-page-brands/images/2024-10-07-C5Ju4h2RwGwMVdnZlTk1Km9LqsMe3KqLa4dL7mKE.png', NULL, 1, 1, 16, '2024-10-07 09:59:03', '2024-10-07 09:59:03'),
(11, 'media/home-page-brands/images/2024-10-07-ht2mgRJ2dXEgr29RK9X2e1dNLEu4FnNbDAWk0XIm.png', NULL, 1, 1, 16, '2024-10-07 09:59:15', '2024-10-07 09:59:15'),
(12, 'media/home-page-brands/images/2024-10-07-r1D43HdgCkeLmjcyolEeFrHOnGMDeRCxEgpDqdUr.png', NULL, 1, 1, 16, '2024-10-07 09:59:32', '2024-10-07 09:59:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `serial`, `status`, `slug`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Clothing', 'media/category/images/2024-10-07-rzGZCTeU4XcqU0I3o32tJ6RnvHtT2y4tURgFomqX.jpg', NULL, 1, 1, 'clothing', 16, '2024-10-07 15:29:56', '2024-10-07 15:37:47'),
(2, 'Footwear', 'media/category/images/2024-10-07-4ajsXq4lPEyg62bRuQKyk0Ny6lucAYHLBRKhWcUV.jpg', NULL, 2, 1, 'footwear', 16, '2024-10-07 15:30:24', '2024-10-07 15:38:46'),
(3, 'Accessories', 'media/category/images/2024-10-07-oFCGksHnx4pgLVUl0S9hj5D6DZADYBZZounxa204.jpg', NULL, 3, 1, 'accessories', 16, '2024-10-07 15:30:54', '2024-10-07 15:38:54'),
(4, 'Jewelry', 'media/category/images/2024-10-07-fmSucfppu9s28e7ankfH4Hf2xiC8Yj0ODXnMpMwm.jpg', NULL, 4, 1, 'jewelry', 16, '2024-10-07 15:31:17', '2024-10-07 15:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `client_messages`
--

CREATE TABLE `client_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_messages`
--

INSERT INTO `client_messages` (`id`, `name`, `email`, `phone`, `address`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Amir', 'amirralli300400@gmail.com', '01817807594', 'Sherpur Shadar', 'amirralli300400@gmail.com', 1, '2024-10-08 10:47:21', '2024-10-08 10:47:21'),
(2, 'Syed Amir Ali', 'amirralli300400@gmail.com', '01817807594', 'Sherpur Shadar', 'amirralli300400@gmail.com', 1, '2024-10-08 10:48:10', '2024-10-08 10:48:10'),
(3, 'Syed Amir Ali', 'amirralli300400@gmail.com', '01817807594', 'Sherpur Shadar', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas voluptates, commodi sint incidunt, ut iusto rem nulla asperiores saepe, quo dolor nesciunt sit. Ipsam quibusdam delectus, ipsum pariatur dolor aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas voluptates, commodi sint incidunt, ut iusto rem nulla asperiores saepe, quo dolor nesciunt sit. Ipsam quibusdam delectus, ipsum pariatur dolor aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas voluptates, commodi sint incidunt, ut iusto rem nulla asperiores saepe, quo dolor nesciunt sit. Ipsam quibusdam delectus, ipsum pariatur dolor aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas voluptates, commodi sint incidunt, ut iusto rem nulla asperiores saepe, quo dolor nesciunt sit. Ipsam quibusdam delectus, ipsum pariatur dolor aut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas voluptates, commodi sint incidunt, ut iusto rem nulla asperiores saepe, quo dolor nesciunt sit. Ipsam quibusdam delectus, ipsum pariatur dolor aut.', 1, '2024-10-08 10:52:25', '2024-10-08 10:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `summery` text DEFAULT NULL,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `icon` varchar(120) NOT NULL COMMENT 'Font Awesome V6 All Free Icons',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `name`, `image`, `summery`, `serial`, `icon`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Sourcing', 'media/media/images/2024-10-08-KWEjPi5upKYjFeg7IDuogwZxZrFX2aRJB9WIikWt.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 1, '<i class=\"fa-brands fa-slack\"></i>', 1, 16, '2024-10-08 03:03:07', '2024-10-08 03:03:07'),
(2, 'Manufacturing', 'media/media/images/2024-10-08-0YH8TuEQpiPZYwkUHnnn3GKMRD3PpmExUsqR3lTh.jpg', NULL, 2, '<i class=\"fa-solid fa-city\"></i>', 1, 16, '2024-10-08 03:03:47', '2024-10-08 03:03:47'),
(3, 'SD Venture', 'media/media/images/2024-10-08-ZnOQ7wmeVuyzsqefrMOG5QXWVY2wwd1x8xAmQ3m3.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 3, '<i class=\"fa-brands fa-dropbox\"></i>', 1, 16, '2024-10-08 03:04:37', '2024-10-08 03:04:37'),
(4, 'Hunting', 'media/media/images/2024-10-08-k3PITiMOwvLCIfQn17OTOjHCLnve95hGXfhDmfFc.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 4, '<i class=\"fa-solid fa-city\"></i>', 1, 16, '2024-10-08 03:05:06', '2024-10-08 03:09:17'),
(5, 'Clothing', 'media/media/images/2024-10-08-ImP2RHUFjKy6x4kEswT1HnK7iPSZUl8bbakAEEi5.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 5, '<i class=\"fa-brands fa-dropbox\"></i>', 1, 16, '2024-10-08 03:05:38', '2024-10-08 03:05:38'),
(6, 'Deying', 'media/media/images/2024-10-08-8HkdzhblND0HgmFBUUuDmMwBEyexOEglvOvmYapp.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 6, '<i class=\"fa-solid fa-city\"></i>', 1, 16, '2024-10-08 03:06:20', '2024-10-08 03:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `media_galleries`
--

CREATE TABLE `media_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `embed_code` text NOT NULL,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_galleries`
--

INSERT INTO `media_galleries` (`id`, `title`, `embed_code`, `serial`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Build & Launch an Enterprise-Level Food Ordering Platform: React Node.js MongoDB Auth Stripe & More!', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ardeKHEN1j4?si=parWZL1zr3HZNVkx\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 1, 1, 16, '2024-10-08 03:29:35', '2024-10-08 03:29:35'),
(2, 'Build & Launch an Enterprise-Level Food Ordering Platform: React Node.js MongoDB Auth Stripe & More!', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ardeKHEN1j4?si=parWZL1zr3HZNVkx\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 2, 1, 16, '2024-10-08 03:30:07', '2024-10-08 03:30:07');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `fb_icon` varchar(255) DEFAULT NULL,
  `fb_url` varchar(255) DEFAULT NULL,
  `fb_target` varchar(255) NOT NULL DEFAULT '_blank',
  `x_icon` varchar(255) DEFAULT NULL,
  `x_url` varchar(255) DEFAULT NULL,
  `x_target` varchar(255) NOT NULL DEFAULT '_blank',
  `instagram_icon` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `instagram_target` varchar(255) NOT NULL DEFAULT '_blank',
  `linkedin_icon` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `linkedin_target` varchar(255) NOT NULL DEFAULT '_blank',
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `title`, `phone`, `email`, `image`, `fb_icon`, `fb_url`, `fb_target`, `x_icon`, `x_url`, `x_target`, `instagram_icon`, `instagram_url`, `instagram_target`, `linkedin_icon`, `linkedin_url`, `linkedin_target`, `serial`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'M A AL Hosayen', 'Director', '+8801913498791', 'dolon@greenlifebd.com', 'media/about-us/images/2024-10-08-B4mXLONPoFcy2esGLPtgqazmLzmhJQUaHoo07HlC.jpg', '<i class=\"fa-brands fa-facebook\"></i>', '#', '_target', '<i class=\"fa-brands fa-x-twitter\"></i>', '#', '_target', '<i class=\"fa-brands fa-instagram\"></i>', '#', '_target', '<i class=\"fa-brands fa-linkedin\"></i>', '#', '_target', 1, 1, 16, '2024-10-08 04:53:34', '2024-10-08 04:53:34'),
(2, 'Assaduzzaman Chowdhury', 'Director-Admin', '+8801714138393', 'assad@greenlifebd.com', 'media/about-us/images/2024-10-08-73syBaX97KV3N28eWpBA4lNSGFVRG9gfq8lMKGYS.jpg', '<i class=\"fa-brands fa-facebook\"></i>', '#', '_target', '<i class=\"fa-brands fa-x-twitter\"></i>', '#', '_target', '<i class=\"fa-brands fa-instagram\"></i>', '#', '_target', '<i class=\"fa-brands fa-linkedin\"></i>', '#', '_target', 2, 1, 16, '2024-10-08 04:54:14', '2024-10-08 04:54:14'),
(3, 'Mr. Abu Faisal Mosabber', 'Managing Director', '000000000000', 'saimon@greenlifebd.com', 'media/about-us/images/2024-10-08-sSkqNvzmcB4h0LqUG14c6wFyptG6FhpJArPAO7ym.jpg', '<i class=\"fa-brands fa-facebook\"></i>', '#', '_target', '<i class=\"fa-brands fa-x-twitter\"></i>', '#', '_target', '<i class=\"fa-brands fa-instagram\"></i>', '#', '_target', '<i class=\"fa-brands fa-linkedin\"></i>', '#', '_target', 3, 1, 16, '2024-10-08 04:55:33', '2024-10-08 04:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_26_070249_create_permission_tables', 1),
(6, '2023_04_29_104538_create_admin_menus_table', 1),
(7, '2023_04_29_104545_create_admin_menu_actions_table', 1),
(8, '2023_04_30_095422_create_jobs_table', 1),
(9, '2023_07_16_193339_create_settings_table', 1),
(10, '2023_08_08_095304_create_admin_settings_table', 1),
(11, '2023_08_23_083356_create_portfolios_table', 1),
(56, '2024_03_17_122342_create_password_resets_table', 35),
(72, '2023_10_03_222638_create_client_messages_table', 36),
(73, '2023_11_02_115531_create_app_settings_table', 37),
(74, '2024_10_07_115616_create_services_products_table', 38),
(75, '2024_10_07_123012_add_serial_services_products_tbale', 39),
(76, '2024_10_07_124913_update_summery_to_services_products_tbale', 40),
(77, '2024_10_07_131347_create_primary_services_table', 41),
(78, '2024_10_07_135757_create_services_counters_table', 42),
(79, '2024_10_07_142140_create_others_services_table', 43),
(80, '2024_10_07_150239_create_reviews_table', 44),
(81, '2024_10_07_154625_create_brands_table', 45),
(82, '2024_10_07_172500_create_categories_table', 46),
(83, '2024_10_07_213225_add_slug_to_categories_tbale', 47),
(84, '2024_10_07_214110_create_products_table', 48),
(85, '2024_10_07_215103_add_slug_to_products_tbale', 49),
(86, '2024_10_07_215545_add_feature_to_products_tbale', 50),
(87, '2024_10_08_085356_create_media_table', 51),
(88, '2024_10_08_091501_create_media_galleries_table', 52),
(89, '2024_10_08_093409_create_sustainability_videos_table', 53),
(90, '2024_10_08_103229_create_members_table', 54),
(91, '2024_10_08_111833_create_client_messages_table', 55);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 4),
(1, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 16),
(5, 'App\\Models\\User', 13),
(5, 'App\\Models\\User', 14);

-- --------------------------------------------------------

--
-- Table structure for table `others_services`
--

CREATE TABLE `others_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL COMMENT 'Font Awesome V6 All Free Icons',
  `summery` text DEFAULT NULL,
  `btn_title` varchar(255) NOT NULL,
  `btn_url` varchar(255) NOT NULL,
  `btn_target` varchar(20) NOT NULL,
  `btn_icon` varchar(120) NOT NULL COMMENT 'Font Awesome V6 All Free Icons',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `others_services`
--

INSERT INTO `others_services` (`id`, `name`, `icon`, `summery`, `btn_title`, `btn_url`, `btn_target`, `btn_icon`, `status`, `serial`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Sign & Paint VIP Program', '<i class=\'fa-solid fa-heart-circle-bolt\'></i>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores dignissimos, iste ipsum fugit nulla soluta eveniet magni, repudiandae.', 'Learn More', '#', '_blank', '<i class=\'fa-solid fa-arrow-right\'></i>', 1, 1, 16, '2024-10-07 08:52:47', '2024-10-07 08:52:47'),
(2, 'Quick & Super fast delivery', '<i class=\'fa-brands fa-canadian-maple-leaf\'></i>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores dignissimos, iste ipsum fugit nulla soluta eveniet magni, repudiandae.', 'Explore now', '#', '_blank', '<i class=\'fa-solid fa-truck-moving\'></i>', 1, 2, 16, '2024-10-07 08:53:50', '2024-10-07 08:53:50'),
(3, 'Awareness & Support', '</i><i class=\'fa-solid fa-hand-holding-hand\'></i>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores dignissimos, iste ipsum fugit nulla soluta eveniet magni, repudiandae.', 'support for help', '#', '_blank', '<i class=\'fa-solid fa-hand\'>', 1, 1, 16, '2024-10-07 08:54:46', '2024-10-07 08:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `expired_time` varchar(255) DEFAULT NULL,
  `code` bigint(20) UNSIGNED NOT NULL,
  `is_reset` tinyint(1) NOT NULL DEFAULT 0,
  `verify` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `user_id`, `email`, `start_time`, `expired_time`, `code`, `is_reset`, `verify`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '2024-03-17T08:18:20.819016Z', '2024-03-17T08:23:20.819158Z', 686317, 0, 0, '2024-03-17 08:18:26', '2024-03-17 08:18:26'),
(2, 1, NULL, '2024-03-17T08:32:53.551107Z', '2024-03-17T08:37:53.551213Z', 795694, 0, 0, '2024-03-17 08:32:57', '2024-03-17 08:32:57'),
(3, 1, NULL, '2024-03-17T08:35:39.550494Z', '2024-03-17T08:40:39.550717Z', 674692, 0, 0, '2024-03-17 08:35:43', '2024-03-17 08:35:43'),
(4, 1, NULL, '2024-03-17T08:37:37.138173Z', '2024-03-17T08:42:37.138256Z', 861153, 0, 0, '2024-03-17 08:37:41', '2024-03-17 08:37:41'),
(5, 1, NULL, '2024-03-17T08:39:38.997375Z', '2024-03-17T08:44:38.997470Z', 932976, 0, 0, '2024-03-17 08:39:43', '2024-03-17 08:39:43'),
(6, 1, NULL, '2024-03-17T08:44:15.555418Z', '2024-03-17T08:49:15.555500Z', 626132, 0, 0, '2024-03-17 08:44:20', '2024-03-17 08:44:20'),
(7, 1, NULL, '2024-03-17T08:54:18.419808Z', '2024-03-17T08:59:18.419892Z', 272819, 0, 0, '2024-03-17 08:54:22', '2024-03-17 08:54:22'),
(8, 1, NULL, '2024-03-17T09:06:08.664581Z', '2024-03-17T09:11:08.664875Z', 592318, 0, 0, '2024-03-17 09:06:14', '2024-03-17 09:06:14'),
(9, 1, NULL, '2024-03-17T09:08:38.076671Z', '2024-03-17T09:13:38.076763Z', 745236, 0, 0, '2024-03-17 09:08:38', '2024-03-17 09:08:38'),
(10, 1, NULL, '2024-03-17T09:12:59.573176Z', '2024-03-17T09:17:59.573329Z', 392167, 0, 0, '2024-03-17 09:12:59', '2024-03-17 09:12:59'),
(11, 1, NULL, '2024-03-17T09:14:46.181615Z', '2024-03-17T09:19:46.181835Z', 576356, 0, 0, '2024-03-17 09:14:46', '2024-03-17 09:14:46'),
(12, 1, NULL, '2024-03-17T09:16:10.977950Z', '2024-03-17T09:21:10.978207Z', 197510, 0, 0, '2024-03-17 09:16:10', '2024-03-17 09:16:10'),
(13, 1, NULL, '2024-03-17T09:17:17.097341Z', '2024-03-17T09:22:17.097469Z', 603968, 0, 0, '2024-03-17 09:17:17', '2024-03-17 09:17:17'),
(14, 1, NULL, '2024-03-17T09:19:03.471833Z', '2024-03-17T09:19:03.472495Z', 508382, 0, 0, '2024-03-17 09:19:03', '2024-03-17 09:19:03'),
(15, 1, NULL, '2024-03-17T09:19:19.435092Z', '2024-03-17T09:20:19.435299Z', 610313, 0, 0, '2024-03-17 09:19:19', '2024-03-17 09:19:19'),
(16, 1, NULL, '2024-03-17T09:27:53.545714Z', '2024-03-17T09:28:53.545800Z', 297694, 0, 0, '2024-03-17 09:27:53', '2024-03-17 09:27:53'),
(17, 1, NULL, '2024-03-17T09:30:28.303619Z', '2024-03-17T09:31:28.303807Z', 334848, 0, 0, '2024-03-17 09:30:28', '2024-03-17 09:30:28'),
(18, 1, NULL, '2024-03-17T09:31:34.210523Z', '2024-03-17T09:32:34.210615Z', 219909, 0, 0, '2024-03-17 09:31:34', '2024-03-17 09:31:34'),
(19, 1, NULL, '2024-03-17T09:35:36.189382Z', '2024-03-17T09:36:36.189478Z', 252640, 0, 0, '2024-03-17 09:35:36', '2024-03-17 09:35:36'),
(20, 1, NULL, '2024-03-17T09:36:42.047188Z', '2024-03-17T09:37:42.047271Z', 609943, 0, 0, '2024-03-17 09:36:42', '2024-03-17 09:36:42'),
(21, 1, NULL, '2024-03-17T09:52:37.819208Z', '2024-03-17T09:53:37.819336Z', 204707, 0, 0, '2024-03-17 09:52:37', '2024-03-17 09:52:37'),
(22, 1, NULL, '2024-03-17T09:54:13.601926Z', '2024-03-17T09:55:13.602009Z', 493576, 0, 0, '2024-03-17 09:54:13', '2024-03-17 09:54:13'),
(23, 1, NULL, '2024-03-17T09:56:46.929136Z', '2024-03-17T09:57:46.929216Z', 622733, 0, 0, '2024-03-17 09:56:46', '2024-03-17 09:56:46'),
(24, 1, NULL, '2024-03-17T09:57:15.108728Z', '2024-03-17T09:58:15.108816Z', 670545, 0, 0, '2024-03-17 09:57:15', '2024-03-17 09:57:15'),
(25, 1, NULL, '2024-03-17T09:58:17.465118Z', '2024-03-17T09:59:17.465208Z', 825567, 0, 0, '2024-03-17 09:58:17', '2024-03-17 09:58:17'),
(26, 1, NULL, '2024-03-17T10:00:14.322778Z', '2024-03-17T10:01:14.322857Z', 321950, 0, 0, '2024-03-17 10:00:14', '2024-03-17 10:00:14'),
(27, 1, 'amirralli300400@gmail.com', '2024-03-17T10:22:19.614547Z', '2024-03-17T10:23:19.614629Z', 896787, 0, 0, '2024-03-17 10:22:19', '2024-03-17 10:22:19'),
(28, 1, 'amirralli300400@gmail.com', '2024-03-17T10:39:59.041041Z', '2024-03-17T10:40:59.041124Z', 806235, 0, 0, '2024-03-17 10:39:59', '2024-03-17 10:39:59'),
(29, 1, 'amirralli300400@gmail.com', '2024-03-17T10:43:34.160511Z', '2024-03-17T10:44:34.160605Z', 958808, 0, 0, '2024-03-17 10:43:34', '2024-03-17 10:43:34'),
(30, 1, 'amirralli300400@gmail.com', '2024-03-17T10:45:04.203362Z', '2024-03-17T10:46:04.203486Z', 217593, 0, 0, '2024-03-17 10:45:04', '2024-03-17 10:45:04'),
(31, 1, 'amirralli300400@gmail.com', '2024-03-17T10:45:42.808402Z', '2024-03-17T10:46:42.808493Z', 454328, 0, 0, '2024-03-17 10:45:42', '2024-03-17 10:45:42'),
(32, 1, 'amirralli300400@gmail.com', '2024-03-17T10:47:13.046426Z', '2024-03-17T10:57:13.046604Z', 498579, 0, 0, '2024-03-17 10:47:13', '2024-03-17 10:47:13'),
(33, 1, 'amirralli300400@gmail.com', '2024-03-17T10:47:18.170718Z', '2024-03-17T10:57:18.170847Z', 570498, 0, 0, '2024-03-17 10:47:18', '2024-03-17 10:47:18'),
(34, 1, 'amirralli300400@gmail.com', '2024-03-17T10:52:51.885215Z', '2024-03-17T11:02:51.885309Z', 878395, 0, 0, '2024-03-17 10:52:51', '2024-03-17 10:52:51'),
(35, 1, 'amirralli300400@gmail.com', '2024-03-17T11:13:48.157782Z', '2024-03-17T11:23:48.157927Z', 469935, 0, 0, '2024-03-17 11:13:48', '2024-03-17 11:13:48'),
(36, 1, 'amirralli300400@gmail.com', '2024-03-17T11:16:56.962401Z', '2024-03-17T11:26:56.962484Z', 755455, 0, 0, '2024-03-17 11:16:56', '2024-03-17 11:16:56'),
(37, 1, 'amirralli300400@gmail.com', '2024-03-17T11:48:28.678534Z', '2024-03-17T11:58:28.678632Z', 928474, 0, 0, '2024-03-17 11:48:28', '2024-03-17 11:48:28'),
(38, 1, 'amirralli300400@gmail.com', '2024-03-17T11:58:39.822821Z', '2024-03-17T12:08:39.822910Z', 898576, 0, 0, '2024-03-17 11:58:39', '2024-03-17 11:58:39'),
(39, 1, 'amirralli300400@gmail.com', '2024-03-17T12:03:44.608253Z', '2024-03-17T12:13:44.608380Z', 694167, 0, 1, '2024-03-17 12:03:44', '2024-03-17 12:04:19'),
(40, 1, 'amirralli300400@gmail.com', '2024-03-17T13:45:58.695129Z', '2024-03-17T13:55:58.695286Z', 836460, 0, 1, '2024-03-17 13:45:58', '2024-03-17 13:46:25'),
(41, 1, 'amirralli300400@gmail.com', '2024-03-17T13:49:35.150734Z', '2024-03-17T13:59:35.150816Z', 669399, 0, 1, '2024-03-17 13:49:35', '2024-03-17 13:49:54'),
(42, 1, 'amirralli300400@gmail.com', '2024-03-17T15:54:55.502387Z', '2024-03-17T16:04:55.502508Z', 747686, 0, 1, '2024-03-17 15:54:55', '2024-03-17 15:55:09'),
(43, 1, 'amirralli300400@gmail.com', '2024-03-17T15:57:09.850625Z', '2024-03-17T16:07:09.850705Z', 154243, 1, 1, '2024-03-17 15:57:09', '2024-03-17 16:10:51'),
(44, 1, 'amirralli300400@gmail.com', '2024-03-17T16:45:31.801727Z', '2024-03-17T16:55:31.801854Z', 198495, 1, 1, '2024-03-17 16:45:31', '2024-03-17 16:46:12'),
(45, 1, 'amirralli300400@gmail.com', '2024-03-17T17:11:21.858288Z', '2024-03-17T17:21:21.858683Z', 193408, 1, 1, '2024-03-17 17:11:26', '2024-03-17 17:12:28'),
(46, 1, 'amirralli300400@gmail.com', '2024-03-19T16:30:53.614216Z', '2024-03-19T16:40:53.614436Z', 153737, 1, 1, '2024-03-19 16:30:57', '2024-03-19 16:32:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Settings', 'web', '2024-02-07 07:55:58', '2024-02-07 07:55:58'),
(2, 'admin.settings.index', 'web', '2024-02-07 07:57:10', '2024-02-07 07:57:10'),
(3, 'admin.admin-settings.index', 'web', '2024-02-07 07:58:56', '2024-02-07 07:58:56'),
(4, 'admin.client-navigation-menus.index', 'web', '2024-02-07 09:08:18', '2024-02-07 09:08:18'),
(5, 'admin.admin-menu.index', 'web', '2024-02-07 10:19:56', '2024-02-07 10:19:56'),
(6, 'admin.client-navigation-menu.create', 'web', '2024-02-07 11:00:20', '2024-02-07 11:00:20'),
(7, 'admin.client-navigation-menu.index', 'web', '2024-02-07 11:00:48', '2024-02-07 11:00:48'),
(8, 'admin.client-navigation-menu.edit', 'web', '2024-02-07 11:01:02', '2024-02-07 11:01:02'),
(9, 'Home Page', 'web', '2024-02-08 06:54:37', '2024-02-08 06:54:37'),
(10, 'admin.slider.index', 'web', '2024-02-08 06:55:10', '2024-02-08 06:55:10'),
(11, 'admin.slider.create', 'web', '2024-02-08 06:55:40', '2024-02-08 06:55:40'),
(12, 'admin.slider.edit', 'web', '2024-02-08 06:55:51', '2024-02-08 06:55:51'),
(13, 'admin.blog.index', 'web', '2024-02-08 09:02:30', '2024-02-08 09:02:30'),
(14, 'admin.blog.create', 'web', '2024-02-08 09:02:59', '2024-02-08 09:02:59'),
(15, 'admin.blog.edit', 'web', '2024-02-08 09:03:23', '2024-02-08 09:03:23'),
(16, 'admin.testimonial.edit', 'web', '2024-02-08 11:27:20', '2024-02-08 11:27:20'),
(17, 'admin.workout-section.index', 'web', '2024-02-08 15:54:57', '2024-02-08 15:54:57'),
(18, 'admin.workout-section.create', 'web', '2024-02-08 15:56:38', '2024-02-08 15:56:38'),
(19, 'admin.workout-section.edit', 'web', '2024-02-08 15:56:49', '2024-02-08 15:56:49'),
(20, 'admin.video-gallery.index', 'web', '2024-02-10 06:09:45', '2024-02-10 06:09:45'),
(21, 'admin.video-gallery.create', 'web', '2024-02-10 06:20:09', '2024-02-10 06:20:09'),
(22, 'admin.video-gallery.edit', 'web', '2024-02-10 06:20:50', '2024-02-10 06:20:50'),
(26, 'admin.image-gallery.index', 'web', '2024-02-10 15:06:26', '2024-02-10 15:06:26'),
(27, 'admin.image-gallery.create', 'web', '2024-02-10 15:07:32', '2024-02-10 15:07:32'),
(28, 'admin.image-gallery.edit', 'web', '2024-02-10 15:08:09', '2024-02-10 15:08:09'),
(32, 'Team Page', 'web', '2024-02-10 16:18:18', '2024-02-10 16:18:18'),
(33, 'admin.team-top.index', 'web', '2024-02-10 16:22:06', '2024-02-10 16:22:06'),
(35, 'admin.team-top.create', 'web', '2024-02-10 16:51:20', '2024-02-10 16:51:20'),
(37, 'Admin.faq.index', 'web', '2024-02-12 06:55:44', '2024-02-12 06:55:44'),
(38, 'Sticker & Banner Page', 'web', '2024-02-12 07:42:15', '2024-02-12 07:42:15'),
(39, 'admin.sticker-banner-page-top.index', 'web', '2024-02-12 09:06:54', '2024-02-12 09:06:54'),
(40, 'admin.stickers.index', 'web', '2024-02-12 09:30:49', '2024-02-12 09:30:49'),
(41, 'admin.x-banner.index', 'web', '2024-02-12 09:54:02', '2024-02-12 09:54:02'),
(43, 'Career Page', 'web', '2024-02-12 12:32:31', '2024-02-12 12:32:31'),
(47, 'admin.career-top.index', 'web', '2024-02-12 13:35:32', '2024-02-12 13:35:32'),
(48, 'admin.career-vacant-postion.index', 'web', '2024-02-12 14:49:39', '2024-02-12 14:49:39'),
(49, 'admin.careerpagebottom.index', 'web', '2024-02-12 16:55:51', '2024-02-12 16:55:51'),
(50, 'About Us page', 'web', '2024-02-12 18:40:58', '2024-02-12 18:40:58'),
(51, 'admin.about-us-top.index', 'web', '2024-02-12 18:41:48', '2024-02-12 18:41:48'),
(52, 'admin.about-us-bottom.index', 'web', '2024-02-13 05:50:56', '2024-02-13 05:50:56'),
(53, 'Contact Us Page', 'web', '2024-02-13 06:38:13', '2024-02-13 10:45:27'),
(54, 'admin.contact-us.index', 'web', '2024-02-13 06:40:54', '2024-02-13 06:40:54'),
(56, 'admin.mclist.index', 'web', '2024-02-13 09:00:51', '2024-02-13 09:00:51'),
(57, 'admin.jmclist.index', 'web', '2024-02-13 09:58:28', '2024-02-13 09:58:28'),
(58, 'admin.bord-member.index', 'web', '2024-02-13 09:59:55', '2024-02-13 09:59:55'),
(59, 'admin.contact-main.index', 'web', '2024-02-14 08:55:29', '2024-02-14 08:55:29'),
(60, 'admin.role.index', 'web', '2024-02-15 04:35:35', '2024-02-15 04:35:35'),
(61, 'admin.user.index', 'web', '2024-02-15 04:45:08', '2024-02-15 04:45:08'),
(62, 'admin.news-and-article.index', 'web', '2024-02-16 06:59:07', '2024-02-16 06:59:07'),
(63, 'Footer Items Setup', 'web', '2024-02-16 08:32:33', '2024-02-18 08:46:44'),
(64, 'admin.works-area-details.create', 'web', '2024-02-16 08:33:01', '2024-02-16 08:33:01'),
(65, 'admin.works-area-details.edit', 'web', '2024-02-16 08:33:09', '2024-02-16 08:33:09'),
(69, 'admin.about.index', 'web', '2024-02-18 09:43:58', '2024-02-18 09:43:58'),
(70, 'admin.contact.index', 'web', '2024-02-18 12:51:43', '2024-02-18 12:51:43'),
(71, 'admin.client-message.index', 'web', '2024-02-18 13:29:39', '2024-02-18 13:29:39'),
(72, 'admin.career.index', 'web', '2024-02-19 08:23:25', '2024-02-19 08:23:25'),
(73, 'admin.career-item.index', 'web', '2024-02-19 08:24:09', '2024-02-19 08:24:09'),
(74, 'admin.career-item.create', 'web', '2024-02-19 08:25:24', '2024-02-19 08:26:35'),
(75, 'admin.career-item.edit', 'web', '2024-02-19 08:25:39', '2024-02-19 08:26:26'),
(76, 'admin.career.create', 'web', '2024-02-19 08:28:59', '2024-02-19 08:28:59'),
(77, 'admin.career.edit', 'web', '2024-02-19 08:29:13', '2024-02-19 08:29:13'),
(78, 'admin.our-mission.index', 'web', '2024-02-19 10:17:11', '2024-02-19 10:17:11'),
(79, 'admin.our-vision.index', 'web', '2024-02-19 10:19:55', '2024-02-19 10:19:55'),
(80, 'admin.our-missions.index', 'web', '2024-02-19 10:20:38', '2024-02-19 10:20:38'),
(81, 'admin.book-store.index', 'web', '2024-02-19 15:30:18', '2024-02-19 15:30:18'),
(82, 'Store Management', 'web', '2024-02-20 12:03:01', '2024-02-20 12:03:01'),
(83, 'admin.image-gallery.destroy', 'web', '2024-03-14 11:14:07', '2024-03-14 11:14:07'),
(84, 'admin.video-gallery.destroy', 'web', '2024-03-14 11:15:43', '2024-03-14 11:15:43'),
(85, 'admin.password_reset', 'web', '2024-03-15 11:49:05', '2024-03-15 11:49:05'),
(86, 'admin.bd-map.index', 'web', '2024-03-22 06:35:52', '2024-03-22 06:35:52'),
(87, 'admin.join-us.index', 'web', '2024-03-23 06:41:44', '2024-03-23 06:41:44'),
(88, 'admin.book-store-banner.index', 'web', '2024-03-25 11:21:39', '2024-03-25 11:21:39'),
(89, 'admin.about-external-link.index', 'web', '2024-03-26 04:28:06', '2024-03-26 04:28:06'),
(90, 'admin.-about.index', 'web', '2024-03-26 04:32:08', '2024-03-26 04:32:08'),
(91, 'Donate Page', 'web', '2024-03-29 09:22:42', '2024-03-29 09:22:42'),
(92, 'admin.show.index', 'web', '2024-03-29 09:25:20', '2024-03-29 09:25:20'),
(93, 'admin.donate.index', 'web', '2024-03-29 09:26:07', '2024-03-29 09:26:07'),
(94, 'News & Reports', 'web', '2024-03-30 05:17:44', '2024-03-30 06:25:26'),
(95, 'Events', 'web', '2024-03-30 08:26:16', '2024-03-30 08:26:16'),
(96, 'frontend.upcoming-event.index', 'web', '2024-03-30 08:27:16', '2024-03-30 08:27:16'),
(97, 'admin.past-event.index', 'web', '2024-03-30 08:28:02', '2024-03-30 08:28:02'),
(98, 'admin.events.index', 'web', '2024-03-30 16:56:38', '2024-03-30 16:56:38'),
(99, '<i class=\"fal fa-person-sign\"></i>', 'web', '2024-03-31 11:16:05', '2024-03-31 11:16:05'),
(100, 'admin.volunteer-registration-form.index', 'web', '2024-03-31 11:16:50', '2024-03-31 11:16:50'),
(101, 'index.volunteer-details.show', 'web', '2024-03-31 17:13:16', '2024-03-31 17:13:16'),
(102, 'Volunteer Page Details', 'web', '2024-03-31 17:15:08', '2024-03-31 18:10:42'),
(103, 'admin.honorable-member.index', 'web', '2024-04-01 04:18:31', '2024-04-01 04:18:31'),
(105, 'admin.magazine.index', 'web', '2024-04-06 18:58:59', '2024-04-06 18:58:59'),
(107, 'admin.auth-page.index', 'web', '2024-04-07 11:20:56', '2024-04-07 11:20:56'),
(108, 'admin.homepage-setup.index', 'web', '2024-10-07 04:19:43', '2024-10-07 04:19:43'),
(109, 'admin.home-page-setup.index', 'web', '2024-10-07 04:21:31', '2024-10-07 04:21:31'),
(110, 'admin.home-page-services-product.index', 'web', '2024-10-07 06:22:57', '2024-10-07 06:22:57'),
(111, 'admin.home-page-primary-services.index', 'web', '2024-10-07 07:23:04', '2024-10-07 07:23:04'),
(112, 'admin.home-page-primary-services.create', 'web', '2024-10-07 07:53:02', '2024-10-07 07:53:02'),
(113, 'admin.home-page-primary-services.edit', 'web', '2024-10-07 07:53:29', '2024-10-07 07:53:29'),
(114, 'admin.home-page-primary-services.show', 'web', '2024-10-07 07:53:53', '2024-10-07 07:53:53'),
(115, 'admin.home-page-services-product.create', 'web', '2024-10-07 07:54:36', '2024-10-07 07:54:36'),
(116, 'admin.home-page-services-product.edit', 'web', '2024-10-07 07:54:48', '2024-10-07 07:54:48'),
(117, 'admin.home-page-services-product.update', 'web', '2024-10-07 07:54:59', '2024-10-07 07:54:59'),
(118, 'admin.home-page-services-product.show', 'web', '2024-10-07 07:55:08', '2024-10-07 07:55:08'),
(119, 'admin.home-page-services-product.destroy', 'web', '2024-10-07 07:55:22', '2024-10-07 07:55:22'),
(120, 'admin.home-page-primary-services.destroy', 'web', '2024-10-07 07:56:49', '2024-10-07 07:56:49'),
(121, 'admin.home-page-primary-services.update', 'web', '2024-10-07 07:57:00', '2024-10-07 07:57:00'),
(122, 'admin.home-page-services-counter.index', 'web', '2024-10-07 08:11:00', '2024-10-07 08:11:00'),
(123, 'admin.home-page-services-counter.create', 'web', '2024-10-07 08:11:37', '2024-10-07 08:11:37'),
(124, 'admin.home-page-services-counter.edit', 'web', '2024-10-07 08:11:49', '2024-10-07 08:11:49'),
(125, 'admin.home-page-services-counter.update', 'web', '2024-10-07 08:12:03', '2024-10-07 08:12:03'),
(126, 'admin.home-page-services-counter.destroy', 'web', '2024-10-07 08:12:15', '2024-10-07 08:12:15'),
(127, 'admin.home-page-others-services.index', 'web', '2024-10-07 08:49:45', '2024-10-07 08:49:45'),
(128, 'admin.home-page-others-services.create', 'web', '2024-10-07 08:57:04', '2024-10-07 08:57:04'),
(129, 'admin.home-page-others-services.edit', 'web', '2024-10-07 08:57:12', '2024-10-07 08:57:12'),
(130, 'admin.home-page-others-services.update', 'web', '2024-10-07 08:57:21', '2024-10-07 08:57:21'),
(131, 'admin.home-page-others-services.destroy', 'web', '2024-10-07 08:57:38', '2024-10-07 08:57:38'),
(132, 'admin.home-page-others-services.show', 'web', '2024-10-07 08:57:51', '2024-10-07 08:57:51'),
(133, 'admin.home-page-reviews.index', 'web', '2024-10-07 09:12:20', '2024-10-07 09:12:20'),
(134, 'admin.home-page-reviews.create', 'web', '2024-10-07 09:12:38', '2024-10-07 09:12:38'),
(135, 'admin.home-page-reviews.show', 'web', '2024-10-07 09:12:47', '2024-10-07 09:12:47'),
(136, 'admin.home-page-reviews.edit', 'web', '2024-10-07 09:12:56', '2024-10-07 09:12:56'),
(137, 'admin.home-page-reviews.update', 'web', '2024-10-07 09:13:11', '2024-10-07 09:13:11'),
(138, 'admin.home-page-reviews.destroy', 'web', '2024-10-07 09:13:24', '2024-10-07 09:13:24'),
(139, 'admin.home-page-brands.index', 'web', '2024-10-07 09:54:35', '2024-10-07 09:54:35'),
(140, 'admin.home-page-brands.create', 'web', '2024-10-07 09:54:56', '2024-10-07 09:54:56'),
(141, 'admin.home-page-brands.edit', 'web', '2024-10-07 09:55:04', '2024-10-07 09:55:04'),
(142, 'admin.home-page-brands.update', 'web', '2024-10-07 09:55:15', '2024-10-07 09:55:15'),
(143, 'admin.home-page-brands.show', 'web', '2024-10-07 09:55:24', '2024-10-07 09:55:24'),
(144, 'admin.home-page-brands.destroy', 'web', '2024-10-07 09:55:35', '2024-10-07 09:55:35'),
(145, 'admin.admin-menu.create', 'web', '2024-10-07 10:55:26', '2024-10-07 10:55:26'),
(146, 'admin.admin-menu.edit', 'web', '2024-10-07 10:55:36', '2024-10-07 10:55:36'),
(147, 'admin.admin-menu.show', 'web', '2024-10-07 10:55:48', '2024-10-07 10:55:48'),
(148, 'admin.admin-menu.update', 'web', '2024-10-07 10:56:03', '2024-10-07 10:56:03'),
(149, 'admin.admin-menu.destroy', 'web', '2024-10-07 10:56:17', '2024-10-07 10:56:17'),
(150, 'Category & Product', 'web', '2024-10-07 10:57:42', '2024-10-07 10:57:42'),
(151, 'Media', 'web', '2024-10-07 11:03:01', '2024-10-07 11:03:01'),
(152, 'Contact', 'web', '2024-10-07 11:03:49', '2024-10-07 11:03:49'),
(153, 'About', 'web', '2024-10-07 11:04:28', '2024-10-07 11:04:28'),
(154, 'admin.media.index', 'web', '2024-10-07 11:08:12', '2024-10-07 11:08:12'),
(155, 'admin.category.index', 'web', '2024-10-07 11:08:51', '2024-10-07 11:08:51'),
(156, 'admin.product.index', 'web', '2024-10-07 11:09:28', '2024-10-07 11:09:28'),
(157, 'Manage Members', 'web', '2024-10-07 11:11:18', '2024-10-08 04:18:52'),
(158, 'admin.contacts.index', 'web', '2024-10-07 11:17:38', '2024-10-07 11:17:38'),
(159, 'admin.media-banner.index', 'web', '2024-10-07 17:22:13', '2024-10-07 17:22:13'),
(160, 'admin.media-gallery.index', 'web', '2024-10-08 03:25:47', '2024-10-08 03:25:47'),
(161, 'Sustainability', 'web', '2024-10-08 03:35:52', '2024-10-08 03:35:52'),
(162, 'admin.sustainability.index', 'web', '2024-10-08 03:37:50', '2024-10-08 03:37:50'),
(163, 'admin.sustainability-videos.index', 'web', '2024-10-08 03:38:24', '2024-10-08 03:38:24'),
(164, 'admin.about-banner.index', 'web', '2024-10-08 04:18:19', '2024-10-08 04:18:19'),
(165, 'admin.contacts-banner.index', 'web', '2024-10-08 05:07:56', '2024-10-08 05:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `technologies` varchar(255) DEFAULT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `primary_services`
--

CREATE TABLE `primary_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `summery` text DEFAULT NULL,
  `btn_title` varchar(255) NOT NULL,
  `btn_url` varchar(255) NOT NULL,
  `btn_target` varchar(20) NOT NULL,
  `btn_icon` varchar(120) NOT NULL COMMENT 'Font Awesome V6 All Free Icons',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `primary_services`
--

INSERT INTO `primary_services` (`id`, `name`, `image`, `summery`, `btn_title`, `btn_url`, `btn_target`, `btn_icon`, `status`, `serial`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Garments', 'media/home-page-primary-services/images/2024-10-07-X2YCv1o0hLaKevovO1NQHLBgCAB8f82X2ZobseWY.jpg', 'Sed perspicias unde omnis natus error volute', 'Learn More', '#', '_blank', '<i class=\"fas fa-play\"></i>', 1, 1, 16, '2024-10-07 07:49:10', '2024-10-07 07:49:10'),
(2, 'Kniting', 'media/home-page-primary-services/images/2024-10-07-OS46sb6SqvkdA2ttjNNSy7T70d5EKW5oX8M8UXl4.jpg', 'Sed perspicias unde omnis natus error volute', 'Learn More', '#', '_blank', '<i class=\"fa-solid fa-arrow-right-long\"></i>', 1, 1, 16, '2024-10-07 07:50:42', '2024-10-07 07:50:42'),
(3, 'Dyeing', 'media/home-page-primary-services/images/2024-10-07-1R4xGQUrhVQz9JIcUaBCDH1CdesrZ49RGbx14xLA.jpg', 'Sed perspicias unde omnis natus error volute', 'Learn More', '#', '_blank', '<i class=\"fa-solid fa-arrow-right-long\"></i>', 1, 1, 16, '2024-10-07 07:51:30', '2024-10-07 07:51:30'),
(4, 'Embroidery', 'media/home-page-primary-services/images/2024-10-07-IFa0nEULghVtU4iWSba5YS3sVWvRwQEwzqHuQLGq.jpg', 'Sed perspicias unde omnis natus error volute', 'Learn More', '#', '_blank', '<i class=\"fa-solid fa-arrow-right-long\"></i>', 1, 1, 16, '2024-10-07 07:51:59', '2024-10-07 07:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(600) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photos` text DEFAULT NULL,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured` varchar(255) NOT NULL DEFAULT 'general',
  `slug` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `title`, `description`, `photos`, `serial`, `status`, `featured`, `slug`, `category_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Knit 2', 'media/product/images/2024-10-07-OEcSQ4DH1oSjcvJmoRl6yWrgXjeSWY6qIc5QrrXQ.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, \"Segoe UI\", \"Helvetica Neue\", Helvetica, \"Microsoft YaHei\", \"Meiryo UI\", Meiryo, \"Arial Unicode MS\", sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly! <strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong> is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, \"Segoe UI\", \"Helvetica Neue\", Helvetica, \"Microsoft YaHei\", \"Meiryo UI\", Meiryo, \"Arial Unicode MS\", sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, \"Segoe UI\", \"Helvetica Neue\", Helvetica, \"Microsoft YaHei\", \"Meiryo UI\", Meiryo, \"Arial Unicode MS\", sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, \"Segoe UI\", \"Helvetica Neue\", Helvetica, \"Microsoft YaHei\", \"Meiryo UI\", Meiryo, \"Arial Unicode MS\", sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-A18eyWit9LqLC9odGfOiSMna5ypynKHtVi78LNHO.jpg\",\"media\\/product\\/images\\/2024-10-07-RaLEBQllHXF5QivGQWbee1wDGwEzeLbAwyZ3UHu8.jpg\",\"media\\/product\\/images\\/2024-10-07-Ig70RYaVTXuHhOFYhOlPUDskFUDCjN4TVgT9p64a.jpg\"]', 1, 1, 'showcase', 'knit-2-1', 4, 16, '2024-10-07 16:30:09', '2024-10-07 16:47:14'),
(2, 'Knit', 'media/product/images/2024-10-07-VvBBHeYvSuM9c2nRJiyrDUsB8Nsp4Ii8NULsA514.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly!&nbsp;<strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong>&nbsp;is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-LkDJgR0V2TvA56HoEozdNnRn2IETDCOCE0FKndvP.jpg\",\"media\\/product\\/images\\/2024-10-07-wQeBWUH8Tg37LZNnpfpIxDDsbhHU3xUtSNvc9zgY.jpg\",\"media\\/product\\/images\\/2024-10-07-5NwoODLSE35d627iJw5gERDMCHYUNJYuqieUIb1k.jpg\",\"media\\/product\\/images\\/2024-10-07-kMvTWwA32FGHiyySsQmUO9pbb8vvlsOoEzxtC3SI.jpg\"]', 1, 1, 'showcase', 'knit', 4, 16, '2024-10-07 16:44:04', '2024-10-07 16:44:04'),
(3, 'Knit', 'media/product/images/2024-10-07-5cHHYWp94ctKkSMBqdCoNjjDBUagUdrdk6XfS9MN.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly!&nbsp;<strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong>&nbsp;is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-9Tmz59PBOh5nuwOxMcTA5PAt1oybId1g0w09xmGs.jpg\",\"media\\/product\\/images\\/2024-10-07-QgefgyCq4NrC3HXciJmdqSLNkh38iZArYy3StEhe.jpg\",\"media\\/product\\/images\\/2024-10-07-ZvaSf1uNybrSI7Z0m6tiQ8TJGBStSd5D1WZoCjWc.jpg\",\"media\\/product\\/images\\/2024-10-07-EQxjd8y6SKg3491QBOtzA3KHxNeLITFiIUo8fHO3.jpg\"]', 1, 1, 'showcase', 'knit-1', 4, 16, '2024-10-07 16:49:15', '2024-10-07 16:49:15'),
(4, 'Women Dress', 'media/product/images/2024-10-07-Jm5XA2B1tT7Dlv0ra27lzmbc5gzcaPOnSDX5fSZq.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly!&nbsp;<strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong>&nbsp;is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-vs3G6QPDkSfv5iucyivbEa41aJMtzpW5y4iox8he.jpg\",\"media\\/product\\/images\\/2024-10-07-CK3hJVxwemL2R3c9JnoX4ZyqAcUOdY1brIPf5KCt.jpg\",\"media\\/product\\/images\\/2024-10-07-CW7xD4zuuNDNBgIC3LVUHdsFIUVurL0N1pfWTkp4.jpg\",\"media\\/product\\/images\\/2024-10-07-lSI8zrwuX37vxyOfLRtYrhcRYi3OL5y5Dx0Uy92e.jpg\",\"media\\/product\\/images\\/2024-10-07-VgLCzxtiRHnXzQ9qa2CFgm8syRxRA7aQMtXBt7u8.jpg\"]', 1, 1, 'showcase', 'women-dress', 3, 16, '2024-10-07 16:50:11', '2024-10-07 16:50:11'),
(5, 'Women Dress Cartun', 'media/product/images/2024-10-07-aHGJHU0WWdBqbfmKz7Oh0rC6vhUdbLn8HZem4ctD.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly!&nbsp;<strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong>&nbsp;is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-aqWwtkCtRla48GXCiEyDRyvWPMZVcD8bsZ1zznWQ.jpg\",\"media\\/product\\/images\\/2024-10-07-OO7YL0vpyovl5F3dOOfXubKbzK2UYjoMeKhciVfN.jpg\",\"media\\/product\\/images\\/2024-10-07-P8maKK0UTWiourtTR6gzp1wVgAs1jGs8FyQrDuVa.jpg\",\"media\\/product\\/images\\/2024-10-07-vgZvO40qKe6g7RnSwyG3NZn9l2gWDPLlaxpOGMwo.jpg\",\"media\\/product\\/images\\/2024-10-07-yHNDl6JIQMh3thXExS6PkcPIM82WfVbbvF6XNQEj.jpg\"]', 1, 1, 'showcase', 'women-dress-cartun', 3, 16, '2024-10-07 16:50:44', '2024-10-07 16:50:44'),
(6, 'Women Dress', 'media/product/images/2024-10-07-ZDeNzEy8Idk5CNZLXrMYGmckbSqILLJkfnkWU0ua.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly!&nbsp;<strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong>&nbsp;is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-fgBSWi7dOdTf65qqQxq4QvtIPO0nHpE6xf5MKnei.jpg\",\"media\\/product\\/images\\/2024-10-07-LbVHmeEVufnEh30na21iys32iGuv4wDz7wdG1SnL.jpg\",\"media\\/product\\/images\\/2024-10-07-jhjSlemFfLkVcrY4Rs5ffv8uqxlqEuCjoC4Zv4w0.jpg\"]', 1, 1, 'showcase', 'women-dress-1', 2, 16, '2024-10-07 16:51:23', '2024-10-07 16:51:23');
INSERT INTO `products` (`id`, `name`, `image`, `title`, `description`, `photos`, `serial`, `status`, `featured`, `slug`, `category_id`, `created_by`, `created_at`, `updated_at`) VALUES
(7, 'Women Dress', 'media/product/images/2024-10-07-CnCYUxWZ8ps7rZ4ZEET0NHcdvGh8f1K2I7m1vR8J.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly!&nbsp;<strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong>&nbsp;is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-MzabmGQ3lGoc9mCRbvIFA57mu9ZLjOy3Uz3hyk0x.jpg\",\"media\\/product\\/images\\/2024-10-07-IsBttRmEr49wLBspOP91Nsv5JdX8Ek9TdNA3ZizF.jpg\",\"media\\/product\\/images\\/2024-10-07-WDvZrueJFxFOc8JOgEuFOIFaeMEy5XZba6YHm8DU.jpg\"]', 1, 1, 'general', 'women-dress-2', 1, 16, '2024-10-07 16:51:52', '2024-10-07 16:51:52'),
(8, 'Men Dress', 'media/product/images/2024-10-07-VVpxYpXp1HU9QCz58nWN2o0MFm20WOpf8P1OD1aD.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly!&nbsp;<strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong>&nbsp;is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-CfppzA9YsFVAK0KXt24aSchyml6I9588QrpDgPEJ.jpg\",\"media\\/product\\/images\\/2024-10-07-iOZIzpgaVh9tbE1ox1t2pgGGtsXrMubYNm87j0fe.jpg\",\"media\\/product\\/images\\/2024-10-07-3j44YAGVD173VD2Ro2Bo4l4IjF3WcnNr1FH9oC7m.jpg\"]', 1, 1, 'general', 'men-dress', 1, 16, '2024-10-07 16:52:19', '2024-10-07 16:52:19'),
(9, 'Men Dress', 'media/product/images/2024-10-07-JnzufbEFzTCp617f35PtiO1ACD3dYrlDhy0vHSTS.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly!&nbsp;<strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong>&nbsp;is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-KgwKNLB1w1EsQq6vx7aQNuFc6RT6tH9KQuoVGNLs.jpg\",\"media\\/product\\/images\\/2024-10-07-0ZZYgLN6UrAg6cdDLaMqesBXEhpFowXpubVMb8eC.jpg\",\"media\\/product\\/images\\/2024-10-07-ls4iNW4wTka2CQ7zkGBxtFAr0FSRfJNTEpzj4FTS.jpg\"]', 1, 1, 'general', 'men-dress-1', 1, 16, '2024-10-07 16:52:39', '2024-10-07 16:52:39'),
(10, 'Men Dress', 'media/product/images/2024-10-07-VytjoP0VdPzP9SDT2yoiIhLBpnYbJUsEtk8770ma.jpg', 'Our New Colleaction.. Our New Colleaction.Our New Colleaction.', '<p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Certainly!&nbsp;<strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Cell death</strong>&nbsp;is a natural process that occurs in the human body. Let’s explore it further:</span></p><ol style=\"margin: 12px 0px 0px; display: flex; flex-direction: column; gap: 12px; padding-inline-start: 24px; font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 14px;\"><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal; background-color: rgb(255, 255, 255);\">What Is Cell Death?</strong></p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Definition</strong>: Cell death refers to the event when cells in your body stop functioning and eventually die.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Purpose</strong>: It’s a crucial part of maintaining overall health. Cells die or recycle to make way for newer, more efficient ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Expected Process</strong>: Your body expects programmed cell deaths to happen as part of its normal functioning.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Types of Cell Death</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Apoptosis</strong>: This is a form of programmed cell death. Cells naturally self-destruct or die when they achieve maximum cell division and can no longer reproduce. Apoptosis is healthy and expected—for example, during pregnancy, unnecessary cells between developing fetal fingers die, allowing the fingers to separate.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Autophagy</strong>: Another type of programmed cell death, autophagy involves cells recycling their own components to maintain overall health.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Necrosis</strong>: Necrosis is unexpected cell death due to factors like lack of blood flow. It can cause tissue death and is not part of the normal programmed process.</span></li></ul></li><li><p style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline; background-color: rgb(255, 255, 255);\"><strong style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: bold; font-variation-settings: normal;\">Why Cell Death Matters</strong>:</p><ul style=\"display: flex; flex-direction: column; gap: 12px; margin-top: 12px; padding-inline-start: 24px;\"><li><span style=\"background-color: rgb(255, 255, 255);\">Cell death keeps your body functioning optimally by replacing damaged or old cells with new ones.</span></li><li><span style=\"background-color: rgb(255, 255, 255);\">Problems arise when cell death doesn’t happen as expected or when cells die when they shouldn’t (e.g., in cancers).</span></li></ul></li></ol><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\">Remember, cell death is a natural and necessary process that contributes to overall well-being. So, even though it might sound ominous, it’s essential for maintaining a healthy body! 🌟</span></p><p style=\"padding: 0px; margin: 12px 0px 0px; word-break: break-word; font-size: 14px; line-height: var(--cib-type-body1-line-height); font-variation-settings: var(--cib-type-body1-font-variation-settings); font-family: SegoeUIVariable, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif;\"><em style=\"background-color: rgb(255, 255, 255);\">[Note: If you have any more questions or need further clarification, feel free to ask—I’m here to assist!]</em></p>', '[\"media\\/product\\/images\\/2024-10-07-q9XFpx0KamIurjUMX8LWZEM1Tm5KVsO3EFse3tLH.jpg\",\"media\\/product\\/images\\/2024-10-07-XcLL3VsujMmc19Z544AfLgJteEltqk6yUHdgLRKj.jpg\",\"media\\/product\\/images\\/2024-10-07-zuo9tEGxjnEv5G6F1dHwySoUdy1YpdqsLmhrZy3a.jpg\"]', 1, 1, 'general', 'men-dress-2', 2, 16, '2024-10-07 16:53:02', '2024-10-07 16:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `summery` text DEFAULT NULL,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `icon` varchar(120) NOT NULL COMMENT 'Font Awesome V6 All Free Icons',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `image`, `summery`, `rating`, `serial`, `icon`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Sourcing', 'media/home-page-reviews/images/2024-10-07-TG5uX8TCtiyi7gFUKuv1n1PhggGQ2LWXpKy45jIN.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 4.90, 1, '<i class=\"fa-brands fa-slack\"></i>', 1, 16, '2024-10-07 09:38:59', '2024-10-07 09:45:20'),
(2, 'Manufacturing', 'media/home-page-reviews/images/2024-10-07-8tgrzdPe4WoBPUe7bX0DS3l4HI0mKyLKqfKZ9d0m.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 4.00, 1, '<i class=\"fa-solid fa-city\"></i>', 1, 16, '2024-10-07 09:40:58', '2024-10-07 09:40:58'),
(3, 'SD Venture', 'media/home-page-reviews/images/2024-10-07-brrxE5RLOqKSaoK11zQCeaEAjlmCrTncZeRSiiUq.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 5.00, 3, '<i class=\"fa-brands fa-dropbox\"></i>', 1, 16, '2024-10-07 09:41:37', '2024-10-07 09:41:37'),
(4, 'Sourcing', 'media/home-page-reviews/images/2024-10-07-5BrIGi8y6l9TZCQ79dIxvckidCfPHBO1SHdCyKI6.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 2.90, 3, '<i class=\"fa-brands fa-slack\"></i>', 1, 16, '2024-10-07 09:42:17', '2024-10-07 09:42:17'),
(5, 'Manufacturing', 'media/home-page-reviews/images/2024-10-07-ibFX3W9hzbwnlUzVkuipD1KZZDSQOqQd7T3s6N71.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 4.80, 5, '<i class=\"fa-solid fa-city\"></i>', 1, 16, '2024-10-07 09:42:53', '2024-10-07 09:42:53'),
(6, 'Our Clients', 'media/home-page-reviews/images/2024-10-07-FRtFHG4cYeBIiskt1a875WP3LouZRGions9kSJvD.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', 3.00, 6, '<i class=\"fa-brands fa-dropbox\"></i>', 1, 16, '2024-10-07 09:44:05', '2024-10-07 09:44:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'System Admin', 'web', '2024-02-07 07:00:10', '2024-02-07 07:00:10'),
(5, 'General User', 'web', '2024-02-19 16:16:06', '2024-04-06 08:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
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
(13, 5),
(14, 1),
(14, 5),
(15, 1),
(15, 5),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(20, 5),
(21, 1),
(21, 5),
(22, 1),
(22, 5),
(26, 1),
(26, 5),
(27, 1),
(27, 5),
(28, 1),
(28, 5),
(32, 1),
(33, 1),
(35, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(43, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
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
(83, 5),
(84, 1),
(84, 5),
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
(95, 5),
(96, 1),
(96, 5),
(97, 1),
(97, 5),
(98, 1),
(98, 5),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(105, 1),
(105, 5),
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
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services_counters`
--

CREATE TABLE `services_counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(120) NOT NULL COMMENT 'Font Awesome V6 All Free Icons',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services_counters`
--

INSERT INTO `services_counters` (`id`, `name`, `value`, `icon`, `status`, `serial`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Happy Clients', 231, '<i class=\"fa-regular fa-gem\" aria-hidden=\"true\"></i>', 1, 1, 16, '2024-10-07 08:17:33', '2024-10-07 08:17:33'),
(2, 'Order Completed', 9170894, '<i class=\"fa-solid fa-pen-ruler\" aria-hidden=\"true\"></i>', 1, 2, 16, '2024-10-07 08:18:25', '2024-10-07 08:20:15'),
(3, 'Hours Of Support', 1462, '<i class=\"fa-solid fa-hand-sparkles\" aria-hidden=\"true\"></i>', 1, 3, 16, '2024-10-07 08:18:52', '2024-10-07 08:19:53'),
(4, 'Employee', 3499, '<i class=\"fa-solid fa-trophy\" aria-hidden=\"true\"></i>', 1, 4, 16, '2024-10-07 08:19:30', '2024-10-07 08:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `services_products`
--

CREATE TABLE `services_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `summery` text NOT NULL,
  `icon` varchar(120) NOT NULL COMMENT 'Font Awesome V6 All Free Icons',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services_products`
--

INSERT INTO `services_products` (`id`, `name`, `image`, `summery`, `icon`, `status`, `serial`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Sourcing', 'media/home-page-services-product/images/2024-10-07-ylBLjnbO6LtuJCDcHox33SFtIAi9TuhtwCFFUxpV.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.', '<i class=\"fa-brands fa-slack\" aria-hidden=\"true\"></i>', 1, 1, 16, '2024-10-07 06:52:03', '2024-10-07 06:52:15'),
(2, 'Manufacturings', 'media/home-page-services-product/images/2024-10-07-wbEBLTZbraYFSsOayjoYI0REgdEpRESDJB0dn91V.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust', '<i class=\"fa-solid fa-city\" aria-hidden=\"true\"></i>', 1, 2, 16, '2024-10-07 06:54:51', '2024-10-07 07:07:42'),
(3, 'SD Venture', 'media/home-page-services-product/images/2024-10-07-W0TBEZ9Oe5uRtop57P81p4dCptCm3yNFAwQ1DQ6C.jpg', 'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust', '<i class=\"fa-brands fa-dropbox\" aria-hidden=\"true\"></i>', 1, 1, 16, '2024-10-07 07:04:06', '2024-10-07 07:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `primary_mobile` varchar(255) DEFAULT NULL,
  `secondary_mobile` varchar(255) DEFAULT NULL,
  `primary_email` varchar(255) DEFAULT NULL,
  `secondary_email` varchar(255) DEFAULT NULL,
  `office_time` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `google_map` text DEFAULT NULL,
  `favicon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `footer_logo` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `facebook_page` varchar(255) DEFAULT NULL,
  `facebook_group` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `single_page_data`
--

CREATE TABLE `single_page_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `enum` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL,
  `contents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`contents`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `single_page_data`
--

INSERT INTO `single_page_data` (`id`, `title`, `enum`, `data`, `contents`, `created_at`, `updated_at`) VALUES
(1, 'Home page action button under the bangladesh\'s map.', 'HOME__PAGE__JOIN__US', NULL, '{\"volunteer\":{\"title\":\"Join Pathgriho Foundation\",\"description\":\"We will only be able to fulfill our mission by working together with the best people.\",\"btn_title\":\"Join As A Volunteer\",\"btn_url\":\"http:\\/\\/localhost\\/pathgriho\\/public\\/admin\\/join-us\",\"btn_target\":\"_blank\"},\"support\":{\"title\":\"SUPPORT US\",\"description\":\"We will only be able to fulfill our mission by working together with the best people.\",\"btn_title\":\"Join As A Volunteerx\",\"btn_url\":\"http:\\/\\/localhost\\/pathgriho\\/public\\/admin\\/join-us\",\"btn_target\":\"_blank\"}}', '2024-03-23 09:20:40', '2024-03-30 16:45:35'),
(2, 'S2', 'HOME__PAGE__JOIN__US2', NULL, '{\"volunteer\":{\"title\":\"ad\",\"description\":\"ad\",\"btn_title\":null,\"btn_url\":null,\"btn_target\":null},\"support\":{\"title\":null,\"description\":null,\"btn_title\":null,\"btn_url\":null,\"btn_target\":null}}', '2024-03-23 10:14:55', '2024-03-23 10:18:08'),
(3, 'S23', 'HOME__PAGE__JOIN__US2', NULL, '{\"volunteer\":{\"title\":\"ad\",\"description\":\"ad\",\"btn_title\":null,\"btn_url\":null,\"btn_target\":null},\"support\":{\"title\":null,\"description\":null,\"btn_title\":null,\"btn_url\":null,\"btn_target\":null}}', '2024-03-23 10:19:29', '2024-03-23 10:19:29'),
(4, 'About Page Main', 'BOOK__STORE__PAGE__STATIC__ITEMS', NULL, '{\"title\":\"\\u0986\\u09a8\\u09cd\\u09a4\\u09b0\\u09cd\\u099c\\u09be\\u09a4\\u09bf\\u0995 \\u0995\\u09b2\\u0995\\u09be\\u09a4\\u09be \\u09aa\\u09c1\\u09b8\\u09cd\\u09a4\\u0995\\u09ae\\u09c7\\u09b2\\u09be \\u09e8\\u09e6\\u09e8\\u09ea(\\u09e8\\u09e6% \\u099b\\u09be\\u09dc)\",\"image\":\"media\\/book-store-banner\\/images\\/2024-03-26-MJzw4lYVix6ZeKKtwcsJrzp2B3ZqAPQ0okugUUCI.png\"}', '2024-03-25 11:58:30', '2024-03-26 06:01:03'),
(5, 'About Page Static Page Details', 'ABOUT__PAGE__STATIC__ITEMS', NULL, '{\"heading\":\"ABOUT US\",\"main_title\":\"We are Team Pathgriho\",\"mission_title\":\"Our Mission\",\"vision_title\":\"Our vision\",\"mission_description\":\"mufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz\",\"vision_description\":\"mufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz\",\"about_title\":\"Where we work\",\"story_title\":\"Our story\",\"video_title\":\"Join us\",\"about_description\":\"mufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz\",\"story_description\":\"mufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz\",\"description\":\"<p><span style=\\\"font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space-collapse: preserve; background-color: rgba(255, 255, 255, 0.1);\\\">\\u09ae\\u09be\\u09a8\\u09c1\\u09b7 \\u09b8\\u09c3\\u09b7\\u09cd\\u099f\\u09bf\\u09b0 \\u09b0\\u09b9\\u09b8\\u09cd\\u09af \\u0993\\u09af\\u09bc\\u09be\\u099c \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u098f\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09ea Arif Bin Habib New Waz Bangla Full Waz 2024\\r\\nmufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz\\r\\n\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09df\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u09a8\\u09a4\\u09c1\\u09a8 \\u0993\\u09df\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09e9,\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u098f\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09ea,\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09df\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u098f\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09ea,\\u0993\\u09af\\u09bc\\u09be\\u099c \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09e8,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c 2023,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09a8\\u09a4\\u09c1\\u09a8,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09a8\\u09be\\u09ae\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0995\\u09be\\u09a8\\u09cd\\u09a8\\u09be\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u09a8\\u09a4\\u09c1\\u09a8 \\u0993\\u09df\\u09be\\u099c\\r\\n(DISCLAIMER)\\r\\n\\u0987\\u0989\\u099f\\u09bf\\u0989\\u09ac \\u099a\\u09cd\\u09af\\u09be\\u09a8\\u09c7\\u09b2: \\\"Islamic Nur Media\\\" \\u0987\\u09b8\\u09b2\\u09be\\u09ae\\u09bf\\u0995 \\u09a8\\u09c1\\u09b0 \\u09ae\\u09bf\\u09a1\\u09bf\\u09df\\u09be \\u098f \\u09a4\\u09c7 \\u09aa\\u09cd\\u09b0\\u0995\\u09be\\u09b6\\u09bf\\u09a4 \\u09ad\\u09bf\\u09a1\\u09bf\\u0993\\u09a4\\u09c7 \\u09af\\u09a6\\u09bf \\u09b6\\u09bf\\u09b0\\u0995, \\u09ac\\u09c7\\u09a6\\u09be\\u09a4, \\u09ac\\u09be\\u09a8\\u09cb\\u09af\\u09bc\\u09be\\u099f \\u0995\\u09bf\\u099a\\u09cd\\u099b\\u09be-\\u0995\\u09be\\u09b9\\u09bf\\u09a8\\u09c0, \\u09b0\\u09be\\u09b7\\u09cd\\u099f\\u09cd\\u09b0 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u0986\\u0987\\u09a8 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u0995\\u09cb\\u09b0\\u0986\\u09a8 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u09b0\\u09be\\u09b8\\u09c2\\u09b2 (\\u09b8\\u09be\\u0983) \\u098f\\u09b0 \\u09b9\\u09be\\u09a6\\u09c0\\u09b8 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u0995\\u09cb\\u09a8 \\u0995\\u09a5\\u09be \\u09a5\\u09be\\u0995\\u09c7 \\u09a4\\u09be\\u09b9\\u09b2\\u09c7 \\u09a4\\u09be \\u09ac\\u0995\\u09cd\\u09a4\\u09be\\u09b0 \\u098f\\u0995\\u09be\\u09a8\\u09cd\\u09a4 \\u09a8\\u09bf\\u099c\\u09b8\\u09cd\\u09ac \\u09ae\\u09a4\\u09be\\u09ae\\u09a4 | \\u09af\\u09be\\u09b0 \\u09a6\\u09be\\u09af\\u09bc\\u09bf\\u09a4\\u09cd\\u09ac\\\" Islamic Nur Media\\u201d \\u0987\\u09b8\\u09b2\\u09be\\u09ae\\u09bf\\u0995 \\u09a8\\u09c1\\u09b0 \\u09ae\\u09bf\\u09a1\\u09bf\\u09df\\u09be\\\" \\u099a\\u09cd\\u09af\\u09be\\u09a8\\u09c7\\u09b2 \\u09a8\\u09bf\\u09ac\\u09c7 \\u09a8\\u09be | \\u0986\\u09ae\\u09b2\\u09c7\\u09b0 \\u0986\\u0997\\u09c7 \\u0995\\u09cb\\u09b0\\u0986\\u09a8 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09b6\\u09c1\\u09a6\\u09cd\\u09a7 \\u09b9\\u09be\\u09a6\\u09bf\\u09b8\\u09c7\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u09ae\\u09bf\\u09b2\\u09bf\\u09af\\u09bc\\u09c7 \\u09a8\\u09bf\\u09a8| \\u09af\\u09a6\\u09bf \\u09ae\\u09bf\\u09b2\\u09c7 \\u09ae\\u09be\\u09a8\\u09c1\\u09a8, \\u0985\\u09a8\\u09cd\\u09af\\u09a5\\u09be\\u09af\\u09bc \\u099b\\u09c7\\u09a1\\u09bc\\u09c7 \\u09a6\\u09bf\\u09a8 |\\r\\n<\\/span>\\u09ae\\u09be\\u09a8\\u09c1\\u09b7 \\u09b8\\u09c3\\u09b7\\u09cd\\u099f\\u09bf\\u09b0 \\u09b0\\u09b9\\u09b8\\u09cd\\u09af \\u0993\\u09af\\u09bc\\u09be\\u099c \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u098f\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09ea Arif Bin Habib New Waz Bangla Full Waz 2024\\r\\nmufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz\\r\\n\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09df\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u09a8\\u09a4\\u09c1\\u09a8 \\u0993\\u09df\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09e9,\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u098f\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09ea,\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09df\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u098f\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09ea,\\u0993\\u09af\\u09bc\\u09be\\u099c \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09e8,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c 2023,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09a8\\u09a4\\u09c1\\u09a8,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09a8\\u09be\\u09ae\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0995\\u09be\\u09a8\\u09cd\\u09a8\\u09be\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u09a8\\u09a4\\u09c1\\u09a8 \\u0993\\u09df\\u09be\\u099c\\r\\n(DISCLAIMER)\\r\\n\\u0987\\u0989\\u099f\\u09bf\\u0989\\u09ac \\u099a\\u09cd\\u09af\\u09be\\u09a8\\u09c7\\u09b2: \\\"Islamic Nur Media\\\" \\u0987\\u09b8\\u09b2\\u09be\\u09ae\\u09bf\\u0995 \\u09a8\\u09c1\\u09b0 \\u09ae\\u09bf\\u09a1\\u09bf\\u09df\\u09be \\u098f \\u09a4\\u09c7 \\u09aa\\u09cd\\u09b0\\u0995\\u09be\\u09b6\\u09bf\\u09a4 \\u09ad\\u09bf\\u09a1\\u09bf\\u0993\\u09a4\\u09c7 \\u09af\\u09a6\\u09bf \\u09b6\\u09bf\\u09b0\\u0995, \\u09ac\\u09c7\\u09a6\\u09be\\u09a4, \\u09ac\\u09be\\u09a8\\u09cb\\u09af\\u09bc\\u09be\\u099f \\u0995\\u09bf\\u099a\\u09cd\\u099b\\u09be-\\u0995\\u09be\\u09b9\\u09bf\\u09a8\\u09c0, \\u09b0\\u09be\\u09b7\\u09cd\\u099f\\u09cd\\u09b0 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u0986\\u0987\\u09a8 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u0995\\u09cb\\u09b0\\u0986\\u09a8 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u09b0\\u09be\\u09b8\\u09c2\\u09b2 (\\u09b8\\u09be\\u0983) \\u098f\\u09b0 \\u09b9\\u09be\\u09a6\\u09c0\\u09b8 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u0995\\u09cb\\u09a8 \\u0995\\u09a5\\u09be \\u09a5\\u09be\\u0995\\u09c7 \\u09a4\\u09be\\u09b9\\u09b2\\u09c7 \\u09a4\\u09be \\u09ac\\u0995\\u09cd\\u09a4\\u09be\\u09b0 \\u098f\\u0995\\u09be\\u09a8\\u09cd\\u09a4 \\u09a8\\u09bf\\u099c\\u09b8\\u09cd\\u09ac \\u09ae\\u09a4\\u09be\\u09ae\\u09a4 | \\u09af\\u09be\\u09b0 \\u09a6\\u09be\\u09af\\u09bc\\u09bf\\u09a4\\u09cd\\u09ac\\\" Islamic Nur Media\\u201d \\u0987\\u09b8\\u09b2\\u09be\\u09ae\\u09bf\\u0995 \\u09a8\\u09c1\\u09b0 \\u09ae\\u09bf\\u09a1\\u09bf\\u09df\\u09be\\\" \\u099a\\u09cd\\u09af\\u09be\\u09a8\\u09c7\\u09b2 \\u09a8\\u09bf\\u09ac\\u09c7 \\u09a8\\u09be | \\u0986\\u09ae\\u09b2\\u09c7\\u09b0 \\u0986\\u0997\\u09c7 \\u0995\\u09cb\\u09b0\\u0986\\u09a8 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09b6\\u09c1\\u09a6\\u09cd\\u09a7 \\u09b9\\u09be\\u09a6\\u09bf\\u09b8\\u09c7\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u09ae\\u09bf\\u09b2\\u09bf\\u09af\\u09bc\\u09c7 \\u09a8\\u09bf\\u09a8| \\u09af\\u09a6\\u09bf \\u09ae\\u09bf\\u09b2\\u09c7 \\u09ae\\u09be\\u09a8\\u09c1\\u09a8, \\u0985\\u09a8\\u09cd\\u09af\\u09a5\\u09be\\u09af\\u09bc \\u099b\\u09c7\\u09a1\\u09bc\\u09c7 \\u09a6\\u09bf\\u09a8 |<br><\\/p>\",\"video_iframe\":\"<iframe width=\\\"560\\\" height=\\\"315\\\" src=\\\"https:\\/\\/www.youtube.com\\/embed\\/fB9yDClXHBk?si=irBtwV4RPjNZVrbj\\\" title=\\\"YouTube video player\\\" frameborder=\\\"0\\\" allow=\\\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\\\" referrerpolicy=\\\"strict-origin-when-cross-origin\\\" allowfullscreen><\\/iframe>\",\"video_description\":\"\\u09ae\\u09be\\u09a8\\u09c1\\u09b7 \\u09b8\\u09c3\\u09b7\\u09cd\\u099f\\u09bf\\u09b0 \\u09b0\\u09b9\\u09b8\\u09cd\\u09af \\u0993\\u09af\\u09bc\\u09be\\u099c \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u098f\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09ea Arif Bin Habib New Waz Bangla Full Waz 2024\\r\\nmufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz\\r\\n\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09df\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u09a8\\u09a4\\u09c1\\u09a8 \\u0993\\u09df\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09e9,\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u098f\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09ea,\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09df\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u098f\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09ea,\\u0993\\u09af\\u09bc\\u09be\\u099c \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09e8\\u09e6\\u09e8\\u09e8,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c 2023,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09a8\\u09a4\\u09c1\\u09a8,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0993\\u09af\\u09bc\\u09be\\u099c \\u09a8\\u09be\\u09ae\\u09be\\u099c,\\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u0995\\u09be\\u09a8\\u09cd\\u09a8\\u09be\\u09b0 \\u0993\\u09af\\u09bc\\u09be\\u099c,\\u09ae\\u09c1\\u09ab\\u09a4\\u09bf \\u0986\\u09b0\\u09bf\\u09ab \\u09ac\\u09bf\\u09a8 \\u09b9\\u09be\\u09ac\\u09bf\\u09ac \\u09a8\\u09a4\\u09c1\\u09a8 \\u0993\\u09df\\u09be\\u099c\\r\\n(DISCLAIMER)\\r\\n\\u0987\\u0989\\u099f\\u09bf\\u0989\\u09ac \\u099a\\u09cd\\u09af\\u09be\\u09a8\\u09c7\\u09b2: \\\"Islamic Nur Media\\\" \\u0987\\u09b8\\u09b2\\u09be\\u09ae\\u09bf\\u0995 \\u09a8\\u09c1\\u09b0 \\u09ae\\u09bf\\u09a1\\u09bf\\u09df\\u09be \\u098f \\u09a4\\u09c7 \\u09aa\\u09cd\\u09b0\\u0995\\u09be\\u09b6\\u09bf\\u09a4 \\u09ad\\u09bf\\u09a1\\u09bf\\u0993\\u09a4\\u09c7 \\u09af\\u09a6\\u09bf \\u09b6\\u09bf\\u09b0\\u0995, \\u09ac\\u09c7\\u09a6\\u09be\\u09a4, \\u09ac\\u09be\\u09a8\\u09cb\\u09af\\u09bc\\u09be\\u099f \\u0995\\u09bf\\u099a\\u09cd\\u099b\\u09be-\\u0995\\u09be\\u09b9\\u09bf\\u09a8\\u09c0, \\u09b0\\u09be\\u09b7\\u09cd\\u099f\\u09cd\\u09b0 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u0986\\u0987\\u09a8 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u0995\\u09cb\\u09b0\\u0986\\u09a8 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u09b0\\u09be\\u09b8\\u09c2\\u09b2 (\\u09b8\\u09be\\u0983) \\u098f\\u09b0 \\u09b9\\u09be\\u09a6\\u09c0\\u09b8 \\u09ac\\u09bf\\u09b0\\u09cb\\u09a7\\u09c0, \\u0995\\u09cb\\u09a8 \\u0995\\u09a5\\u09be \\u09a5\\u09be\\u0995\\u09c7 \\u09a4\\u09be\\u09b9\\u09b2\\u09c7 \\u09a4\\u09be \\u09ac\\u0995\\u09cd\\u09a4\\u09be\\u09b0 \\u098f\\u0995\\u09be\\u09a8\\u09cd\\u09a4 \\u09a8\\u09bf\\u099c\\u09b8\\u09cd\\u09ac \\u09ae\\u09a4\\u09be\\u09ae\\u09a4 | \\u09af\\u09be\\u09b0 \\u09a6\\u09be\\u09af\\u09bc\\u09bf\\u09a4\\u09cd\\u09ac\\\" Islamic Nur Media\\u201d \\u0987\\u09b8\\u09b2\\u09be\\u09ae\\u09bf\\u0995 \\u09a8\\u09c1\\u09b0 \\u09ae\\u09bf\\u09a1\\u09bf\\u09df\\u09be\\\" \\u099a\\u09cd\\u09af\\u09be\\u09a8\\u09c7\\u09b2 \\u09a8\\u09bf\\u09ac\\u09c7 \\u09a8\\u09be | \\u0986\\u09ae\\u09b2\\u09c7\\u09b0 \\u0986\\u0997\\u09c7 \\u0995\\u09cb\\u09b0\\u0986\\u09a8 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09b6\\u09c1\\u09a6\\u09cd\\u09a7 \\u09b9\\u09be\\u09a6\\u09bf\\u09b8\\u09c7\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u09ae\\u09bf\\u09b2\\u09bf\\u09af\\u09bc\\u09c7 \\u09a8\\u09bf\\u09a8| \\u09af\\u09a6\\u09bf \\u09ae\\u09bf\\u09b2\\u09c7 \\u09ae\\u09be\\u09a8\\u09c1\\u09a8, \\u0985\\u09a8\\u09cd\\u09af\\u09a5\\u09be\\u09af\\u09bc \\u099b\\u09c7\\u09a1\\u09bc\\u09c7 \\u09a6\\u09bf\\u09a8 |\",\"btn_title\":\"Join As A Volenteers\",\"btn_link\":\"http:\\/\\/localhost\\/pathgriho\\/public\\/about\",\"founder_heading\":\"FOUNDED 2024\",\"founder_title\":\"Young Businessman Istak Ahmed Founded Pathgriho in Dhaka the Capital of Bangladesh.\",\"founder_facebook_url\":\"http:\\/\\/localhost\\/pathgriho\\/public\\/admin\\/about\",\"founder_twitter_url\":\"http:\\/\\/localhost\\/pathgriho\\/public\\/admin\\/about\",\"founder_btn_url\":\"http:\\/\\/localhost\\/pathgriho\\/public\\/founder\",\"founder_btn_title\":\"Meet the Founder\",\"founder_name\":\"Istak Ahmed\",\"founder_tag\":\"Co-Founder\",\"founder_email\":\"Email: istak123@gamil.com\",\"founder_birth\":\"Date Of Birth: 01.01.1996\",\"founder_bio_short_description\":\"<p>Arif Bin Habib New Waz Bangla Full Waz 2024 mufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz<br><\\/p>\",\"founder_bio_description\":\"<p>Arif Bin Habib New Waz Bangla Full Waz 2024 mufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz<br><\\/p>\",\"founder_bio_external_link\":\"http:\\/\\/localhost\\/pathgriho\\/public\\/admin\\/about?0\",\"founder_bio_external_links_title\":\"To know more about me please click the link bellows:\",\"founder_image\":\"media\\/about\\/images\\/2024-03-29-dySUF8qXEQbDwrDEKcTpF31qahMatnVB8yPP6g4r.jpg\"}', '2024-03-26 05:49:53', '2024-03-29 10:00:44'),
(6, 'Please fill out the form below to complete your payment.', 'DONATION__PAGE__STATIC__ITEMS', NULL, '{\"title\":\"Please fill out the form below to complete your payment.\",\"main_title\":\"Donate Any Amount for The Welfare of Underprivileged Children of Pathgriho\",\"currency_sign\":\"\\u09f3\",\"amount_1\":\"500\",\"amount_2\":\"1000\",\"amount_3\":\"1500\",\"amount_4\":\"2000\",\"amount_5\":\"2500\",\"heading\":\"Donor Info\",\"secondary_heading\":\"Your Details\",\"secondary_title\":\"Please fill out the form below to complete your payment.\",\"payment_description\":\"<p>Arif Bin Habib New Waz Bangla Full Waz 2024 mufti arif bin habib new waz,arif bin habib,mufti arif bin habib 2024,mufti arif bin habib new waz 2024,full waz arif bin habib,mufti arif bin habib notun waz 2024,mufti arif bin habib,mufti arif bin habib norsinghdi,new waz,arif bin habib waz full 2024,arif bin habib new full waz 2024,arif bin habib waz,arif bin habib 2024,bangla waz,new waz mahfil,mufti arif bin habib waz full 2022,arif bin habib new full waz,arif bin habib new waz<br><\\/p>\",\"founder_image\":\"media\\/donate\\/images\\/2024-03-29-UDi46lHYff65MVIsoWLw5m9mG8VrlEYukwKPcfBU.jpg\",\"payment_image\":\"media\\/donate\\/images\\/2024-03-29-DKAyHdQUykQa252Zyg4EGzvr2ZIomY1P0Ozw2XNC.png\"}', '2024-03-29 09:57:21', '2024-03-29 10:14:07'),
(7, 'Main Identifier of (Upcoming Event Page & Past Campaigns Page Static Title Setup)', 'EVENT__PAGES__STATIC__ITEMS', NULL, '{\"upcoming_event\":{\"title\":\"Some Overview About Our Upcoming Events\\/Campaigns\"},\"past_campaigns\":{\"title\":\"Some Overview About Our Past Campaigns\\/Events\"}}', '2024-03-30 17:04:01', '2024-03-30 17:04:01'),
(8, 'Pathgriho Volunteer Registration', 'VOLUNTEER__PAGE__DETAILS__STATIC__ITEMS', NULL, '{\"volunteer_registration\":{\"title\":\"Pathgriha Foundation Volunteer Application 2024\",\"title_bn\":\"\\u09aa\\u09be\\u09a0\\u0997\\u09c3\\u09b9 \\u09ab\\u09be\\u0989\\u09a8\\u09cd\\u09a1\\u09c7\\u09b6\\u09a8 \\u09ad\\u09b2\\u09be\\u09a8\\u09cd\\u099f\\u09bf\\u09df\\u09be\\u09b0 \\u0986\\u09ac\\u09c7\\u09a6\\u09a8 \\u09e8\\u09e6\\u09e8\\u09ea\",\"description\":\"We need some comrades in order to spread the spirit of reading books and develop creative work in the society with the aim of creating people who are tasteful in thinking and thinking. Pathgarha is a non-political voluntary literary organization. Come, read, write, spread. We will contact you at the end of the application. We hope you will help us by answering the following questions.\",\"description_bn\":\"\\u099a\\u09bf\\u09a8\\u09cd\\u09a4\\u09be \\u0993 \\u09ae\\u09a8\\u09a8\\u09c7 \\u09b0\\u09c1\\u099a\\u09bf\\u09b6\\u09c0\\u09b2 \\u09ae\\u09be\\u09a8\\u09c1\\u09b7 \\u0997\\u09dc\\u09be\\u09b0 \\u09aa\\u09cd\\u09b0\\u09a4\\u09cd\\u09af\\u09df\\u09c7 \\u09ac\\u0987 \\u09aa\\u09dc\\u09be\\u09b0 \\u099a\\u09c7\\u09a4\\u09a8\\u09be\\u0995\\u09c7 \\u099b\\u09dc\\u09bf\\u09df\\u09c7 \\u09a6\\u09bf\\u09df\\u09c7 \\u09b8\\u09ae\\u09be\\u099c\\u09c7 \\u09b8\\u09c3\\u09b7\\u09cd\\u099f\\u09bf\\u09b6\\u09c0\\u09b2 \\u0995\\u09be\\u099c \\u09ac\\u09bf\\u0995\\u09b6\\u09bf\\u09a4 \\u0995\\u09b0\\u09be\\u09b0 \\u09b2\\u0995\\u09cd\\u09b7\\u09cd\\u09af\\u09c7 \\u0995\\u09bf\\u099b\\u09c1 \\u09b8\\u09b9\\u09af\\u09cb\\u09a6\\u09cd\\u09a7\\u09be \\u09aa\\u09cd\\u09b0\\u09df\\u09cb\\u099c\\u09a8 \\u0964 \\u09aa\\u09be\\u09a0\\u0997\\u09c3\\u09b9 \\u098f\\u0995\\u099f\\u09bf \\u0985\\u09b0\\u09be\\u099c\\u09a8\\u09c8\\u09a4\\u09bf\\u0995 \\u09b8\\u09cd\\u09ac\\u09c7\\u099a\\u09cd\\u099b\\u09be\\u09b8\\u09c7\\u09ac\\u09c0 \\u09b8\\u09be\\u09b9\\u09bf\\u09a4\\u09cd\\u09af \\u09b8\\u0982\\u0997\\u09a0\\u09a8\\u0964 \\u0986\\u09b8\\u09c1\\u09a8, \\u09aa\\u09dc\\u09c1\\u09a8, \\u09b2\\u09bf\\u0996\\u09c1\\u09a8, \\u099b\\u09dc\\u09bf\\u09df\\u09c7 \\u09a6\\u09bf\\u09a8\\u0964 \\u0986\\u09ac\\u09c7\\u09a6\\u09a8\\u09c7\\u09b0 \\u09b6\\u09c7\\u09b7\\u09c7 \\u0986\\u09ae\\u09b0\\u09be \\u0986\\u09aa\\u09a8\\u09be\\u09a6\\u09c7\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u09af\\u09cb\\u0997\\u09be\\u09af\\u09cb\\u0997 \\u0995\\u09b0\\u09ac \\u0986\\u09b6\\u09be\\u0995\\u09b0\\u09bf \\u09a8\\u09bf\\u099a\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09cd\\u09a8\\u0997\\u09c1\\u09b2\\u09cb\\u09b0 \\u0989\\u09a4\\u09cd\\u09a4\\u09b0 \\u09a6\\u09bf\\u09df\\u09c7 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b8\\u09b9\\u09af\\u09cb\\u0997\\u09bf\\u09a4\\u09be \\u0995\\u09b0\\u09ac\\u09c7\\u09a8 \\u0964\",\"btn_title\":\"submit here\",\"btn_title_bn\":\"\\u098f\\u0996\\u09be\\u09a8\\u09c7 \\u099c\\u09ae\\u09be \\u09a6\\u09bf\\u09a8\"}}', '2024-03-31 18:40:48', '2024-03-31 18:40:48'),
(9, 'Authentication Page\'s Static Items', 'AUTHENTICATION__PAGE__DETAILS__STATIC__ITEMS', NULL, '{\"sign_in_heading\":\"SIGN IN\",\"sign_up_heading\":\"Create Account\",\"sign_in_title\":\"Welcome Back!\",\"sign_up_title\":\"Southern Designers\",\"sign_in_summery\":\"Enter your personal details to use all of site features\",\"sign_up_summery\":\"Register with your personal details to use all of site features\",\"fb_icon\":\"<i class=\\\"fa-brands fa-facebook-f !text-[#5c6bc0]\\\"><\\/i>\",\"google_icon\":\"<i class=\\\"fa-brands fa-google-plus-g !text-yellow-500\\\"><\\/i>\",\"forgot_password_title\":\"Forget Your Password?\",\"go_to_login_title\":\"Login Here\",\"go_to_register_title\":\"Create Account\",\"sign_in_btn_title\":\"Sign In\",\"sign_up_btn_title\":\"Create Account\",\"name_placeholder\":\"Name: e.g Jhon Doe\",\"email_placeholder\":\"E-mail or Username\",\"password_placeholder\":\"Password: e.g X*&09!*a**#\",\"show_pass_icon\":\"<i class=\\\"fa-solid fa-eye text-red-500 group-[.active]:!block !hidden\\\"><\\/i>\",\"hidden_pass_icon\":\"<i class=\\\"fa-solid fa-eye-slash text-primary group-[.active]:!hidden !block\\\"><\\/i>\",\"sign_up_alt_title\":\"or use your email for registeration\",\"sign_in_alt_title\":\"or use your email for registeration\"}', '2024-04-07 11:50:05', '2024-10-07 03:55:43'),
(10, 'Hello', 'HOME_PAGE_SETUP', NULL, '{\"primary_video_title\":\"We believe in\",\"secondary_video_title\":\"Not at the cost of our world.\",\"fancy_texts\":\"Foresight,Simplicity,Innovation,Entrepreneurship,Technology,Collaboration,Possibilities,Globalisation\",\"video\":\"media\\/home-page-setup\\/videos\\/home-page-video.mp4\",\"main_services\":{\"name\":\"Your platform to the world\",\"title\":null,\"summery\":\"We provide integrated and customized solutions to global retailers and brands. We are an ethical and entrepreneurial company with a strong sustainability focus. With our keen design sense, extensive industry experience and adoption of the latest techniques and technologies, we are enabling the fashion industry around the world catering to the fast-evolving tastes and preferences of consumers Sourcing We enable our esteemed customers to source multiple across all products and categories through our partners in key markets. We provide them our market know-how, in- house design-led capabilities while we are able to manage the entire supply chain execution for our customers. Manufacturing We have a created our own manufacturing capacities spread across three countries \\u2013 Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.\"},\"primary_services\":{\"name\":\"Southern Designers\",\"title\":\"Others Services\",\"summery\":\"We provide integrated and customized solutions to global retailers and brands. We are an ethical and entrepreneurial company with a strong sustainability focus. With our keen design sense, extensive industry experience and adoption of the latest techniques and technologies, we are enabling the fashion industry around the world catering to the fast-evolving tastes and preferences of consumers Sourcing.\"},\"counter_services\":{\"name\":\"Our Professional Solutions For Business\",\"title\":\"Popular services\",\"summery\":\"We provide integrated and customized solutions to global retailers and brands. We are an ethical and entrepreneurial company with a strong sustainability focus. With our keen design sense, extensive industry experience and adoption of the latest techniques and technologies, we are enabling the fashion industry around the world catering to the fast-evolving tastes and preferences of consumers Sourcing We enable our esteemed customers to source multiple across all products and categories through our partners in key markets. We provide them our market know-how, in- house design-led capabilities while we are able to manage the entire supply chain execution for our customers.\"},\"reviews\":{\"name\":\"Reviews\",\"title\":\"Our Value\",\"summery\":\"We provide integrated and customized solutions to global retailers and brands. We are an ethical and entrepreneurial company with a strong sustainability focus. With our keen design sense, extensive industry experience and adoption of the latest techniques and technologies, we are enabling the fashion industry around the world catering to the fast-evolving tastes and preferences of consumers Sourcing.\"},\"featured_products\":{\"name\":\"Featured Products\",\"title\":\"Latest\",\"summery\":\"We provide integrated and customized solutions to global retailers and brands. We are an ethical and entrepreneurial company with a strong sustainability focus. With our keen design sense, extensive industry experience and adoption of the latest techniques and technologies, we are enabling the fashion industry around the world catering to the fast-evolving tastes and preferences of consumers Sourcing.\"},\"brands\":{\"name\":\"Brands\",\"title\":\"Our Values\",\"summery\":\"We provide integrated and customized solutions to global retailers and brands. We are an ethical and entrepreneurial company with a strong sustainability focus. With our keen design sense, extensive industry experience and adoption of the latest techniques and technologies, we are enabling the fashion industry around the world catering to the fast-evolving tastes and preferences of consumers Sourcing.\"},\"contact\":{\"name\":\"US\",\"title\":\"Contact With\",\"summery\":\"We provide integrated and customized solutions to global retailers and brands. We are an ethical and entrepreneurial company with a strong sustainability focus. With our keen design sense, extensive industry experience and adoption of the latest techniques and technologies, we are enabling the fashion industry around the world catering to the fast-evolving tastes and preferences of consumers Sourcing.\"}}', '2024-10-07 05:35:39', '2024-10-07 06:20:11'),
(11, 'Nothing', 'MEDIA_PAGE_ITEMS', NULL, '{\"heading\":\"Welcome to Southern Designer\",\"name\":\"Your tagline or call to action here\",\"btn_title\":\"Learn More\",\"btn_target\":\"_blank\",\"btn_url\":\"#\",\"memories_title\":\"Our Memories\",\"memories_heading\":\"Media\",\"image\":\"media\\/media-banner\\/images\\/2024-10-07-iMvQRkOgT6SAJ42XlS9b0Hx47J1Rv3Bxfbj2mA5i.jpg\"}', '2024-10-07 17:41:15', '2024-10-08 10:08:41'),
(12, 'Sustainability Page Static Items Setup', 'SUSTAINABILITY_PAGE_ITEMS', NULL, '{\"heading\":\"Welcome to Southern Designer\",\"name\":\"Your tagline or call to action here\",\"btn_title\":\"Learn More\",\"btn_target\":\"_blank\",\"btn_url\":\"#\",\"video_title\":\"Youtube Videos\",\"video_heading\":\"Our details in videos on youtube\",\"image\":\"media\\/sustainability\\/images\\/2024-10-08-T6robJpjseWeUBAW7BjVNJ4M9HrJYXHmCKTp1Hc0.jpg\",\"mission\":{\"heading\":\"Our Mission\",\"title\":\"Our Mission is to provide the best services with you.\",\"icon\":\"<i class=\\\"fa-solid fa-pen-nib\\\"><\\/i>\",\"image\":\"media\\/sustainability\\/images\\/2024-10-08-VHVkINBenGxjVnFN2sTNW8R4vTdeOovde98JDToA.jpg\",\"description\":\"<p>Green Life Group - a 100% garment export group of company who believes in the art of producing honest and approving garments and fabric to the world of fashion and clothing industry. While positioning ourselves as a reliable supplier of global brands, we allow us to explore the potential and create a niche in the export business. We are strictly maintaining a very high standard of compliance even within the smallest concern of our group. This is another key reason which attracts the leading buyers. Our range covers the offerings of fashion needs for men, women and kids across apparels and accessories, all in tune with the current market trend. Since inception, with a commitment of delivery on time with perfect quality, we have made sure to offer the highest level of buyer satisfaction throughout the globe. All of our factories are situated in factory owned land. With accumulate production capacity of 15Million piece garments a year, the annual turnover of the group is USD 60 Million.<br><\\/p>\"},\"vision\":{\"heading\":\"Our Vision\",\"title\":\"Our Mission is to provide the best services with you.\",\"icon\":\"<i class=\\\"fa-solid fa-circle-info\\\"><\\/i>\",\"image\":\"media\\/sustainability\\/images\\/2024-10-08-eKvOGtKJ6ax1x602khc2Tkx82Fbm1OCjG8alkHeY.jpg\",\"description\":\"<p>Green Life Group - a 100% garment export group of company who believes in the art of producing honest and approving garments and fabric to the world of fashion and clothing industry. While positioning ourselves as a reliable supplier of global brands, we allow us to explore the potential and create a niche in the export business. We are strictly maintaining a very high standard of compliance even within the smallest concern of our group. This is another key reason which attracts the leading buyers. Our range covers the offerings of fashion needs for men, women and kids across apparels and accessories, all in tune with the current market trend. Since inception, with a commitment of delivery on time with perfect quality, we have made sure to offer the highest level of buyer satisfaction throughout the globe. All of our factories are situated in factory owned land. With accumulate production capacity of 15Million piece garments a year, the annual turnover of the group is USD 60 Million.<br><\\/p>\"}}', '2024-10-08 04:08:27', '2024-10-08 04:09:26'),
(13, 'Main App Settings With Headers & Footers', 'ABOUT_PAGE_ITEMS', NULL, '{\"heading\":\"Welcome to Southern Designer\",\"name\":\"Your tagline or call to action here\",\"btn_title\":\"Learn More\",\"btn_target\":\"_blank\",\"btn_url\":\"#\",\"member_title\":\"Exclusive Members\",\"member_heading\":\"Meet Our Experience Team Members\",\"primary_title\":\"About Us\",\"primary_heading\":\"Who we are\",\"image\":\"media\\/about-banner\\/images\\/2024-10-08-vmiLAC8kNz77MwxsnipoRZfGmo6kbA0uIYtAdrCd.jpg\",\"mission\":{\"heading\":\"Our Mission\",\"title\":\"Our Mission is to provide the best services with you.\",\"icon\":\"<i class=\\\"fa-solid fa-pen-nib\\\"><\\/i>\",\"image\":\"media\\/about-banner\\/images\\/2024-10-08-2ABxTPQzazmFCsGDMSRl2hajXBbR9J2uIodEuvgb.jpg\",\"description\":\"<p>Green Life Group - a 100% garment export group of company who believes in the art of producing honest and approving garments and fabric to the world of fashion and clothing industry. While positioning ourselves as a reliable supplier of global brands, we allow us to explore the potential and create a niche in the export business. We are strictly maintaining a very high standard of compliance even within the smallest concern of our group. This is another key reason which attracts the leading buyers. Our range covers the offerings of fashion needs for men, women and kids across apparels and accessories, all in tune with the current market trend. Since inception, with a commitment of delivery on time with perfect quality, we have made sure to offer the highest level of buyer satisfaction throughout the globe. All of our factories are situated in factory owned land. With accumulate production capacity of 15Million piece garments a year, the annual turnover of the group is USD 60 Million.<br><\\/p>\"},\"vision\":{\"heading\":\"Our Vision\",\"title\":\"Our Mission is to provide the best services with you.\",\"icon\":\"<i class=\\\"fa-solid fa-circle-info\\\"><\\/i>\",\"image\":\"media\\/about-banner\\/images\\/2024-10-08-m26YDhfCQ47Yz54TTXO6G66prSBj52DOnucnL3Uz.jpg\",\"description\":\"<p>Green Life Group - a 100% garment export group of company who believes in the art of producing honest and approving garments and fabric to the world of fashion and clothing industry. While positioning ourselves as a reliable supplier of global brands, we allow us to explore the potential and create a niche in the export business. We are strictly maintaining a very high standard of compliance even within the smallest concern of our group. This is another key reason which attracts the leading buyers. Our range covers the offerings of fashion needs for men, women and kids across apparels and accessories, all in tune with the current market trend. Since inception, with a commitment of delivery on time with perfect quality, we have made sure to offer the highest level of buyer satisfaction throughout the globe. All of our factories are situated in factory owned land. With accumulate production capacity of 15Million piece garments a year, the annual turnover of the group is USD 60 Million.<br><\\/p>\"}}', '2024-10-08 04:31:31', '2024-10-09 19:31:15'),
(14, 'CONTACT PAGE', 'CONTACT_PAGE_ITEMS', NULL, '{\"heading\":\"Welcome to Southern Designer\",\"name\":\"Your tagline or call to action here\",\"btn_title\":\"Learn More\",\"btn_target\":\"_blank\",\"btn_url\":\"#\",\"contact_title\":\"Make an appointment!\",\"contact_description\":\"<p>Schedule a free consultation with our team to discuss your specific requirements and learn more about how we can help you. Our experts will work with you to find customized solutions to meet your goals. Our experienced professionals work closely with our clients to provide them with customized solutions for their specific needs, helping them achieve their goals and grow together. Thank you for considering us, and we look forward to hearing from you soon! Schedule a free consultation with our team to discuss your specific requirements and learn more about how we can help you. Our experts will work with you to find customized solutions to meet your goals. Our experienced professionals work closely with our clients to provide them with customized solutions for their specific needs, helping them achieve their goals and grow together. Thank you for considering us, and we look forward to hearing from you soon! Schedule a free consultation with our team to discuss your specific requirements and learn more about how we can help you. Our experts will work with you to find customized solutions to meet your goals. Our experienced professionals work closely with our clients to provide them with customized solutions for their specific needs, helping them achieve their goals and grow together. Thank you for considering us, and we look forward to hearing from you soon!<br><\\/p>\",\"image\":\"media\\/contacts-banner\\/images\\/2024-10-08-IjYAGU8yyET8bzSdxtrz2KL2h7IA2xRI0lDIIMdj.jpg\"}', '2024-10-08 05:09:46', '2024-10-08 05:09:46'),
(15, 'APP SETTINGS - HEADER & FOOTER PAGE SETUP', 'APP_SETTINGS_ITEMS', NULL, '{\"app_name\":\"Southern Designers\",\"app_title\":\"Southern Designers\",\"footer_title_1\":\"Company\",\"footer_title_2\":\"Factory Address\",\"footer_title_3\":\"Contact Us\",\"footer_description\":\"Green Life Group - a 100% garment export group of company who believes in the art of producing honest and approving garments.\",\"main_address_icon\":\"<i class=\\\"fa-solid fa-location-dot\\\" aria-hidden=\\\"true\\\"><\\/i>\",\"main_address_name\":\"House# 16, Road# 19, Sector# 4, Uttara, Dhaka - 1230 Bangladesh.\",\"main_email_icon\":\"<i class=\\\"fa-solid fa-envelope-open-text\\\" aria-hidden=\\\"true\\\"><\\/i>\",\"main_email_name\":\"info@greenlifebd.com\",\"main_phone_icon\":\"<i class=\\\"fa-solid fa-phone-volume\\\" aria-hidden=\\\"true\\\"><\\/i>\",\"main_phone_name\":\"+88096116515\",\"meta_name\":null,\"meta_title\":null,\"meta_keyword\":null,\"meta_description\":null,\"factory_address_1\":{\"title\":\"Southern Designers Ltd.\",\"location\":\"Zirabo, Savar, Dhaka\",\"icon\":\"<i class=\\\"fa-solid fa-address-book\\\"><\\/i>\",\"email\":\"info@sdlbd.net\",\"phone\":\"+880 178087739\"},\"factory_address_2\":{\"title\":\"Green Life Knit Composite Ltd.\",\"location\":\"Tongabari, Ashulia, Savar\",\"icon\":\"<i class=\\\"fa-solid fa-map-location-dot\\\"><\\/i>\",\"email\":\"info@greenlifebd.com\",\"phone\":\"+880 178087739\"},\"factory_address_3\":{\"title\":null,\"location\":null,\"icon\":null,\"email\":null,\"phone\":null},\"factory_address_4\":{\"title\":null,\"location\":null,\"icon\":null,\"email\":null,\"phone\":null},\"copyright_title\":{\"one\":\"Copyright \\u00a9\",\"two\":\"All Rights Reserved.\"},\"copyright\":{\"title\":\"Creative Tech Park.\",\"url\":\"#\",\"target\":\"_blank\"},\"facebook\":{\"icon\":\"<i class=\\\"fa-brands fa-facebook\\\"><\\/i>\",\"url\":null,\"target\":null},\"youtube\":{\"icon\":\"<i class=\\\"fa-brands fa-youtube\\\"><\\/i>\",\"url\":null,\"target\":null},\"twitter\":{\"icon\":\"<i class=\\\"fa-brands fa-x-twitter\\\"><\\/i>\",\"url\":null,\"target\":null},\"linkedin\":{\"icon\":\"<i class=\\\"fa-brands fa-linkedin\\\"><\\/i>\",\"url\":null,\"target\":null},\"instagram\":{\"icon\":\"<i class=\\\"fa-brands fa-instagram\\\"><\\/i>\",\"url\":null,\"target\":null},\"app_favicon\":\"media\\/settings\\/images\\/2024-10-10-C7rYQ4IyPkWfQCbxPd712mVLU983P7V1ipFT3PYm.png\",\"header_image\":\"media\\/settings\\/images\\/2024-10-10-ZINI5vkSxTutfWP9r4PfN41SExDf96y4Ftqc4LYl.png\",\"footer_image\":\"media\\/settings\\/images\\/2024-10-10-drKg8mIko0LmXVmbyIxSkgK5ZmFvgeVtjwM4jlxc.png\"}', '2024-10-09 19:32:57', '2024-10-10 03:22:29');

-- --------------------------------------------------------

--
-- Table structure for table `sustainability_videos`
--

CREATE TABLE `sustainability_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `embed_code` text NOT NULL,
  `serial` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sustainability_videos`
--

INSERT INTO `sustainability_videos` (`id`, `title`, `embed_code`, `serial`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ভাজা মাছ জীবিত হওয়ার ঘটনা ।', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/rZ4PTRDkojo?si=TV6FVp0SrDkcStCF\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 1, 1, 16, '2024-10-08 04:13:15', '2024-10-08 04:13:15'),
(2, 'হৃদয় শীতল করা লেকচার ||', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/HD7537i1KiI?si=lp-OQsqFqGhFknmJ\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 2, 1, 16, '2024-10-08 04:13:50', '2024-10-08 04:13:50'),
(3, 'অতিত কালের একটি মজার ঘটনা!', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/8ZzOlvfq1qY?si=l9l58TToT0vs2dZ9\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 3, 1, 16, '2024-10-08 04:14:23', '2024-10-08 04:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `google_id` varchar(300) DEFAULT NULL,
  `facebook_id` varchar(300) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `user_name`, `email`, `google_id`, `facebook_id`, `phone`, `address`, `image`, `cover_image`, `bio`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin', 'amirralli300400@gmail.com', '100841164953742194096', NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocKSsmDlV12YnpW-bDYRpSE5azuK6eFy9C34ZxNI0E7mCK1EZjVY=s96-c', NULL, NULL, 1, NULL, '$2y$10$2QFEPpuzbW6cFnTW6eGd1uRRio/nymnAJeEYPEuMt8eoM.BHTZ2Vi', NULL, '2024-02-07 07:00:10', '2024-04-07 09:18:26'),
(13, 1, 'Syed Amir Ali', 'syedamirali', 'syedamirali814@gmail.com', '106730981408730372568', NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocL6_Au3g0vYpE69FUbBzSRia9op4bqDNIeZoaD1pk1iZw4TEG8=s96-c', NULL, NULL, 1, NULL, NULL, NULL, '2024-04-06 08:22:00', '2024-04-06 08:22:00'),
(14, 1, 'Syed Amir Ali', 'amirali1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$sh7Re2lpmjOhG76f0PkTw.3GQ6gke4OQh3xhobiUZIU5aTOJVtAhW', NULL, '2024-04-06 11:50:49', '2024-04-06 11:50:49'),
(16, 1, 'Syed Amir Ali', 'admin@gmail.com', 'admin@gmail.com', NULL, NULL, NULL, NULL, 'media/user/2043087496703582f66c3f.webp', NULL, NULL, 1, NULL, '$2y$10$/lBqS4P6amrdTgK1A1amyunHaqR./aSLDz2rmpEtKPXz.DICQSusG', NULL, '2024-10-07 03:28:01', '2024-10-07 03:40:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu_actions`
--
ALTER TABLE `admin_menu_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_settings_created_by_foreign` (`created_by`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `client_messages`
--
ALTER TABLE `client_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_created_by_foreign` (`created_by`);

--
-- Indexes for table `media_galleries`
--
ALTER TABLE `media_galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_galleries_created_by_foreign` (`created_by`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `members_created_by_foreign` (`created_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `others_services`
--
ALTER TABLE `others_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `others_services_created_by_foreign` (`created_by`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolios_created_by_foreign` (`created_by`);

--
-- Indexes for table `primary_services`
--
ALTER TABLE `primary_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `primary_services_created_by_foreign` (`created_by`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_created_by_foreign` (`created_by`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_created_by_foreign` (`created_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services_counters`
--
ALTER TABLE `services_counters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_counters_created_by_foreign` (`created_by`);

--
-- Indexes for table `services_products`
--
ALTER TABLE `services_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_created_by_foreign` (`created_by`);

--
-- Indexes for table `single_page_data`
--
ALTER TABLE `single_page_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sustainability_videos`
--
ALTER TABLE `sustainability_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sustainability_videos_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `admin_menu_actions`
--
ALTER TABLE `admin_menu_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_messages`
--
ALTER TABLE `client_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `media_galleries`
--
ALTER TABLE `media_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `others_services`
--
ALTER TABLE `others_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `primary_services`
--
ALTER TABLE `primary_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services_counters`
--
ALTER TABLE `services_counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services_products`
--
ALTER TABLE `services_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `single_page_data`
--
ALTER TABLE `single_page_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sustainability_videos`
--
ALTER TABLE `sustainability_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD CONSTRAINT `app_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `media_galleries`
--
ALTER TABLE `media_galleries`
  ADD CONSTRAINT `media_galleries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `others_services`
--
ALTER TABLE `others_services`
  ADD CONSTRAINT `others_services_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `primary_services`
--
ALTER TABLE `primary_services`
  ADD CONSTRAINT `primary_services_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services_counters`
--
ALTER TABLE `services_counters`
  ADD CONSTRAINT `services_counters_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sustainability_videos`
--
ALTER TABLE `sustainability_videos`
  ADD CONSTRAINT `sustainability_videos_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
