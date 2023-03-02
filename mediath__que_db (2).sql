-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 02 mars 2023 à 15:33
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mediathéque_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `code_adh` int(11) NOT NULL,
  `nom_adh` text NOT NULL,
  `prenom_adh` text NOT NULL,
  `adresse_adh` varchar(30) NOT NULL,
  `email_adh` varchar(30) NOT NULL,
  `telephone_adh` int(20) NOT NULL,
  `cin_adh` varchar(10) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `type_adh` text NOT NULL,
  `penalite` int(10) NOT NULL,
  `surnom_adh` varchar(20) NOT NULL,
  `password_adh` varchar(20) NOT NULL,
  `date_ouverture` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `code_emprunt` int(11) NOT NULL,
  `date_emprunt` date NOT NULL,
  `retour_emprunt` date NOT NULL,
  `code_reservation` int(11) NOT NULL,
  `code_gerant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gerant`
--

CREATE TABLE `gerant` (
  `code_gerant` int(11) NOT NULL,
  `surnom_gerant` varchar(15) NOT NULL,
  `password_gerant` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

CREATE TABLE `ouvrage` (
  `code_ouv` int(11) NOT NULL,
  `titre_ouv` varchar(20) NOT NULL,
  `nom_auteur` text NOT NULL,
  `image_de_couverture` varchar(20) NOT NULL,
  `etat_ouv` text NOT NULL,
  `type` text NOT NULL,
  `date_edition` date NOT NULL,
  `date_achat` date NOT NULL,
  `page_nombre` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `code_reservation` int(11) NOT NULL,
  `date-reservation` date NOT NULL,
  `code_adh` int(11) NOT NULL,
  `code_ouv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`code_adh`);

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`code_emprunt`),
  ADD KEY `code_reservation` (`code_reservation`),
  ADD KEY `code_gerant` (`code_gerant`);

--
-- Index pour la table `gerant`
--
ALTER TABLE `gerant`
  ADD PRIMARY KEY (`code_gerant`);

--
-- Index pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD PRIMARY KEY (`code_ouv`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`code_reservation`),
  ADD KEY `code_adh` (`code_adh`),
  ADD KEY `code_ouv` (`code_ouv`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `code_gerant` FOREIGN KEY (`code_emprunt`) REFERENCES `gerant` (`code_gerant`),
  ADD CONSTRAINT `code_reservation` FOREIGN KEY (`code_emprunt`) REFERENCES `reservation` (`code_reservation`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`code_adh`) REFERENCES `adherent` (`code_adh`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`code_ouv`) REFERENCES `ouvrage` (`code_ouv`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
