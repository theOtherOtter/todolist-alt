-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Mer 14 Décembre 2016 à 10:52
-- Version du serveur :  5.5.42
-- Version de PHP :  7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `todolist-alt`
--

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

CREATE TABLE `tasks` (
  `id_task` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `beginDate` date NOT NULL,
  `closedDate` date,
  `id_task_status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tasks`
--

INSERT INTO `tasks` (`id_task`, `name`, `beginDate`, `closedDate`, `id_task_status`) VALUES
(1, 'Test 1', '2016-11-16', '2017-01-30', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tasks_owners`
--

CREATE TABLE `tasks_owners` (
  `id_task_owner` bigint(20) NOT NULL,
  `id_task` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `creator` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tasks_status`
--

CREATE TABLE `tasks_status` (
  `id_task_status` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tasks_status`
--

INSERT INTO `tasks_status` (`id_task_status`, `name`) VALUES
(1, 'INIT');

-- --------------------------------------------------------

--
-- Structure de la table `tasks_tasks_owners`
--

CREATE TABLE `tasks_tasks_owners` (
  `tasks_id_task` bigint(20) NOT NULL,
  `taskOwners_id_task_owner` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users_tasks_owners`
--

CREATE TABLE `users_tasks_owners` (
  `users_id_user` bigint(20) NOT NULL,
  `taskOwners_id_task_owner` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id_task`);

--
-- Index pour la table `tasks_owners`
--
ALTER TABLE `tasks_owners`
  ADD PRIMARY KEY (`id_task_owner`);

--
-- Index pour la table `tasks_status`
--
ALTER TABLE `tasks_status`
  ADD PRIMARY KEY (`id_task_status`);

--
-- Index pour la table `tasks_tasks_owners`
--
ALTER TABLE `tasks_tasks_owners`
  ADD UNIQUE KEY `UK_bp8sshdowps072usd555i9m6p` (`taskOwners_id_task_owner`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `users_tasks_owners`
--
ALTER TABLE `users_tasks_owners`
  ADD UNIQUE KEY `UK_backv9rrqqbmd3qw3r5nlqtkd` (`taskOwners_id_task_owner`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id_task` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `tasks_owners`
--
ALTER TABLE `tasks_owners`
  MODIFY `id_task_owner` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tasks_status`
--
ALTER TABLE `tasks_status`
  MODIFY `id_task_status` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT;