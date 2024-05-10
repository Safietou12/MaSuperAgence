-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 10 mai 2024 à 13:51
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `masuperagence7`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240502095500', '2024-05-02 11:55:26', 237),
('DoctrineMigrations\\Version20240506093400', '2024-05-06 11:34:15', 224),
('DoctrineMigrations\\Version20240506093452', '2024-05-06 11:35:00', 111),
('DoctrineMigrations\\Version20240507092307', '2024-05-07 11:23:20', 93),
('DoctrineMigrations\\Version20240507111532', '2024-05-07 13:15:42', 127),
('DoctrineMigrations\\Version20240507113029', '2024-05-07 13:30:50', 91);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `surface` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `rooms` int(11) NOT NULL,
  `beedrooms` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `heat` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `sold` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `title`, `surface`, `description`, `rooms`, `beedrooms`, `floor`, `price`, `heat`, `city`, `address`, `postal_code`, `sold`, `created_at`, `updated_at`, `filename`) VALUES
(1, 'Mon Premier bien', 50, 'description du bien', 4, 5, 2, 200000, 0, 'Dakar', 'keur massar cité gendarmerie 2', '34000', 0, '2024-05-02 12:13:34', '2024-05-07 15:51:47', 'photoholgic-upy-iepqt5c-unsplash-663a31f53086a084794009.jpg'),
(9, 'Mon deuxieme bienn', 52, 'hhhhhhhhhhhhhhhhhhhhhhhhhhh', 4, 2, 2, 1250000, 0, 'Dakar', 'Ouakam cité avion', '12587', 0, '2024-05-03 13:30:05', '2024-05-03 13:30:05', 'r-663a1584da494919182430.jpg'),
(12, 'Mon troisieme bien', 520, 'mon troisieme bien', 1, 5, 1, 550000, 0, 'Dakar', 'Ouakam cité avion', '12587', 0, '2024-05-03 13:54:22', '2024-05-03 13:54:22', 'photoholgic-upy-iepqt5c-unsplash-2-663a15bd0972c058860162.jpg'),
(13, 'mon quatrieme bien', 45, 'mon quatrieme bien', 1, 2, 2, 150000, 0, 'Dakar', 'Ouakam cité avion', '12587', 0, '2024-05-03 14:07:33', '2024-05-03 14:07:33', 'photoholgic-upy-iepqt5c-unsplash-1-663a1ce78f246352112022.jpg'),
(15, 'bien5', 52, 'dsddddddddddddddd', 2, 2, 2, 156200, 0, 'Dakar', 'keur massar', '12587', 0, '2024-05-06 14:33:48', '2024-05-06 14:33:48', 'bernard-hermant-nd9yl9ukvlk-unsplash-663a1c5488e92186165157.jpg'),
(16, 'bien 6', 150, 'ccccccccccccccccccccccc', 1, 1, 3, 850000, 0, 'Dakar', 'Ouakam cité avion', '12587', 0, '2024-05-06 14:34:19', '2024-05-08 14:32:57', 'martin-baron-iomzdse8fus-unsplash-663b70f9edff7438797521.jpg'),
(17, 'mon supe bien', 44, 'hj', 1, 1, 0, 45210, 0, 'Dakar', 'keur massar', '12587', 0, '2024-05-07 12:27:09', '2024-05-07 12:27:09', 'bernard-hermant-nd9yl9ukvlk-unsplash-663a1d283f557674680929.jpg'),
(18, 'Mon troisieme bien11', 44, NULL, 5, 1, 1, 1000000, 0, 'Dakar', 'Ouakam cité avion', '12587', 0, '2024-05-07 12:52:55', '2024-05-07 14:36:25', 'martin-baron-iomzdse8fus-unsplash-663a2049e71fb468405161.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `email`) VALUES
(4, 'admin', '[\"ROLE_ADMIN\"]', '$2y$13$wU0F2HfXchoaivf1Cq3V5.KkwJ2drilFOYqyS0cli9hLdtAeywaOi', 'admin@admin.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
