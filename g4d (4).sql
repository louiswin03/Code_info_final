-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 24 jan. 2024 à 14:43
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
-- Base de données : `g4d`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckAllTables` ()   BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE tableName VARCHAR(255);

  DECLARE cur CURSOR FOR
    SELECT table_name FROM information_schema.tables WHERE table_schema = 'mysql';

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO tableName;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SET @sql = CONCAT('CHECK TABLE ', tableName, ';');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
  END LOOP;

  CLOSE cur;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `cgu et mentions légales`
--

CREATE TABLE `cgu et mentions légales` (
  `id CGU et mentions légales` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `type` enum('CGU','mentions légales') NOT NULL,
  `contenu` varchar(2500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `cgu et mentions légales`
--

INSERT INTO `cgu et mentions légales` (`id CGU et mentions légales`, `titre`, `type`, `contenu`) VALUES
(1, 'Conditions générales', 'CGU', 'En utilisant notre service, vous acceptez ces conditions. Si vous n\'êtes pas d\'accord avec une partie quelconque de ces conditions, veuillez ne pas utiliser notre service.'),
(2, 'Utilisation du service', 'CGU', 'Vous acceptez d\'utiliser le service de manière légale, éthique et conforme à ces conditions. Vous vous engagez à ne pas utiliser notre service à des fins illégales ou interdites.'),
(3, 'Modification des conditions', 'CGU', 'Nous nous réservons le droit de mettre à jour, modifier ou remplacer toute partie de ces conditions en publiant les mises à jour et les changements sur notre site. Il est de votre responsabilité de vérifier régulièrement ces changements.'),
(23, 'Limitation de responsabilité', 'CGU', 'Nous ne pouvons garantir l\'exactitude, l\'actualité ou l\'exhaustivité des informations présentées dans notre service. Nous déclinons toute responsabilité pour tout dommage direct, indirect, accessoire, spécial ou consécutif résultant de l\'utilisation de notre service.'),
(25, 'Collecte des informations', 'mentions légales', 'Nous collectons des informations lorsque vous vous inscrivez sur notre site, naviguez sur nos pages ou utilisez nos services. Les informations collectées peuvent inclure votre nom, adresse e-mail, numéro de téléphone, etc.'),
(26, 'Utilisation des informations', 'mentions légales', 'Les informations que nous collectons sont utilisées pour personnaliser votre expérience, améliorer notre site, répondre à vos demandes, traiter vos transactions, etc. Nous ne partageons pas vos informations avec des tiers sans votre consentement.'),
(27, 'Conservation des données', 'mentions légales', 'Nous conservons vos données aussi longtemps que nécessaire pour les objectifs pour lesquels elles ont été collectées et conformément aux lois applicables sur la protection des données.'),
(28, 'Vos droits', 'mentions légales', 'Vous avez le droit d\'accéder à vos informations personnelles, de les rectifier, de demander leur suppression ou de limiter leur traitement. Pour exercer ces droits, veuillez nous contacter à l\'adresse indiquée dans la section \"Nous contacter\" de notre site.'),
(29, 'Modifications de la politique de confidentialité', 'mentions légales', 'Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment. Les changements seront publiés sur cette page');

-- --------------------------------------------------------

--
-- Structure de la table `cgu_mentions_legales`
--

CREATE TABLE `cgu_mentions_legales` (
  `id_CGU_mentions_legales` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `type` enum('CGU','mentions légales') NOT NULL,
  `contenu` varchar(2500) NOT NULL,
  `titre_en` varchar(255) NOT NULL,
  `contenu_en` varchar(2500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `cgu_mentions_legales`
--

INSERT INTO `cgu_mentions_legales` (`id_CGU_mentions_legales`, `titre`, `type`, `contenu`, `titre_en`, `contenu_en`) VALUES
(1, 'Conditions générales', 'CGU', 'En utilisant notre service, vous acceptez ces conditions. Si vous n\'êtes pas d\'accord avec une partie quelconque de ces conditions, veuillez ne pas utiliser notre service.', 'Terms and Conditions', 'By using our service, you agree to these terms. If you do not agree with any part of these terms, please do not use our service.'),
(2, 'Utilisation du service', 'CGU', 'Vous acceptez d\'utiliser le service de manière légale, éthique et conforme à ces conditions. Vous vous engagez à ne pas utiliser notre service à des fins illégales ou interdites.', 'Terms of Service', 'You agree to use the service in a legal, ethical, and compliant manner with these conditions. You agree not to use our service for illegal or prohibited purposes.'),
(3, 'Modification des conditions', 'CGU', 'Nous nous réservons le droit de mettre à jour, modifier ou remplacer toute partie de ces conditions en publiant les mises à jour et les changements sur notre site. Il est de votre responsabilité de vérifier régulièrement ces changements.', 'Modification of Terms', 'We reserve the right to update, modify, or replace any part of these terms by posting updates and changes on our site. It is your responsibility to regularly check these changes.'),
(23, 'Limitation de responsabilité', 'CGU', 'Nous ne pouvons garantir l\'exactitude, l\'actualité ou l\'exhaustivité des informations présentées dans notre service. Nous déclinons toute responsabilité pour tout dommage direct, indirect, accessoire, spécial ou consécutif résultant de l\'utilisation de notre service.', 'Limitation of Liability', 'We cannot guarantee the accuracy, timeliness, or completeness of the information presented in our service. We disclaim any liability for any direct, indirect, incidental, special, or consequential damages resulting from the use of our service.'),
(25, 'Collecte des informations', 'mentions légales', 'Nous collectons des informations lorsque vous vous inscrivez sur notre site, naviguez sur nos pages ou utilisez nos services. Les informations collectées peuvent inclure votre nom, adresse e-mail, numéro de téléphone, etc.', 'Data Collection', 'We collect information when you register on our site, browse our pages, or use our services. The information collected may include your name, email address, phone number, etc.'),
(26, 'Utilisation des informations', 'mentions légales', 'Les informations que nous collectons sont utilisées pour personnaliser votre expérience, améliorer notre site, répondre à vos demandes, traiter vos transactions, etc. Nous ne partageons pas vos informations avec des tiers sans votre consentement.', 'Use of Information', 'The information we collect is used to personalize your experience, improve our site, respond to your requests, process your transactions, etc. We do not share your information with third parties without your consent.'),
(27, 'Conservation des données', 'mentions légales', 'Nous conservons vos données aussi longtemps que nécessaire pour les objectifs pour lesquels elles ont été collectées et conformément aux lois applicables sur la protection des données.', 'Data Retention', 'We retain your data as long as necessary for the purposes for which it was collected and in accordance with applicable data protection laws.'),
(28, 'Vos droits', 'mentions légales', 'Vous avez le droit d\'accéder à vos informations personnelles, de les rectifier, de demander leur suppression ou de limiter leur traitement. Pour exercer ces droits, veuillez nous contacter à l\'adresse indiquée dans la section \"Nous contacter\" de notre site.', 'Your Rights', 'You have the right to access your personal information, correct it, request its deletion, or limit its processing. To exercise these rights, please contact us at the address provided in the \"Contact Us\" section of our site.'),
(29, 'Modifications de la politique de confidentialité', 'mentions légales', 'Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment. Les changements seront publiés sur cette page', 'Changes to Privacy Policy', 'We reserve the right to change this privacy policy at any time. Changes will be posted on this page.');

-- --------------------------------------------------------

--
-- Structure de la table `conférence`
--

CREATE TABLE `conférence` (
  `id conférence` int(11) NOT NULL,
  `titre` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `heure de début` datetime NOT NULL,
  `heure de fin` datetime NOT NULL,
  `sujet` varchar(45) NOT NULL,
  `salle_id salle` int(11) NOT NULL,
  `salle_capacité` int(11) NOT NULL,
  `salle_numéro de salle` int(11) NOT NULL,
  `administrateur_id administrateur` int(11) NOT NULL,
  `id_sujets` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `conférence`
--

INSERT INTO `conférence` (`id conférence`, `titre`, `date`, `heure de début`, `heure de fin`, `sujet`, `salle_id salle`, `salle_capacité`, `salle_numéro de salle`, `administrateur_id administrateur`, `id_sujets`) VALUES
(3, 'Cours1', '2023-12-27 00:00:00', '2023-12-27 10:00:00', '2023-12-27 12:00:00', 'Mathématiques', 1, 100, 101, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id contact` int(11) NOT NULL,
  `adressse mail` varchar(45) NOT NULL,
  `numéro de téléphone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveau sonore`
--

CREATE TABLE `niveau sonore` (
  `id niveau sonore` int(11) NOT NULL,
  `valeur mesurée` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `heure` datetime NOT NULL,
  `conférence_id conférence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question(forum)`
--

CREATE TABLE `question(forum)` (
  `id question` int(11) NOT NULL,
  `contenu` varchar(45) NOT NULL,
  `date de création` datetime NOT NULL,
  `administrateur_id administrateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question de faq`
--

CREATE TABLE `question de faq` (
  `id_question` int(11) NOT NULL,
  `réponse proposée` varchar(500) NOT NULL,
  `question proposée` varchar(100) DEFAULT NULL,
  `question proposée_en` varchar(500) NOT NULL,
  `réponse proposée_en` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `question de faq`
--

INSERT INTO `question de faq` (`id_question`, `réponse proposée`, `question proposée`, `question proposée_en`, `réponse proposée_en`) VALUES
(17, ' Pour une qualité audio optimale, plusieurs éléments sont cruciaux. D\'abord, assurez-vous d\'avoir un environnement calme, éloigné des bruits de fond ou des distractions potentielles. Utilisez des microphones de qualité adaptés à votre espace et au nombre de participants, privilégiant ceux avec réduction de bruit ou directionnels pour limiter les sons indésirables. Testez vos équipements audio avant la conférence pour ajuster les niveaux, éviter la distorsion ou les échos. ', 'Comment puis-je garantir une qualité audio optimale pendant une conférence ?', 'How can I ensure optimal audio quality during a conference?', 'For optimal audio quality, several elements are crucial. First, make sure to have a quiet environment, away from background noise or potential distractions. Use quality microphones suitable for your space and the number of participants, favoring those with noise reduction or directional features to limit undesirable sounds. Test your audio equipment before the conference to adjust levels, avoid distortion, or echoes. '),
(18, ' Les sondages concernant le fonctionnement des conférences audio sont généralement programmés pendant la pause de la session. Vous serez averti de la disponibilité de ces sondages par le biais d\'une notification directement sur le site. Ils offrent une opportunité précieuse pour recueillir vos retours, avis et suggestions sur les aspects audio de la conférence. ', 'Quand sont organisés les sondages sur le fonctionnement des conférences audio ?', 'When are surveys on the functioning of audio conferences organized?', 'Surveys regarding the functioning of audio conferences are usually scheduled during the session break. You will be notified of the availability of these surveys through a notification directly on the site. They provide a valuable opportunity to collect your feedback, opinions, and suggestions on the audio aspects of the conference. '),
(19, ' La rétroaction audio, souvent identifiée par des bruits stridents et désagréables, est généralement causée par une boucle de rétroaction entre les haut-parleurs et les microphones. Pour l\'éviter, assurez-vous que les haut-parleurs ne sont pas positionnés trop près des microphones pour réduire les risques de capture du son émis. Utilisez des équipements anti-larsen ou des logiciels de suppression de bruit pour atténuer ces problèmes. ', 'Comment résoudre les problèmes de rétroaction audio lors d\'une présentation ?', 'How to resolve audio feedback issues during a presentation?', 'Audio feedback, often identified by sharp and unpleasant noises, is generally caused by a feedback loop between speakers and microphones. To avoid it, ensure that speakers are not positioned too close to microphones to reduce the risk of capturing emitted sound. Use anti-feedback equipment or noise reduction software to mitigate these issues. ');

-- --------------------------------------------------------

--
-- Structure de la table `question_forum`
--

CREATE TABLE `question_forum` (
  `id question` int(11) NOT NULL,
  `contenu` varchar(45) NOT NULL,
  `date de création` datetime DEFAULT current_timestamp(),
  `administrateur_id administrateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `question_forum`
--

INSERT INTO `question_forum` (`id question`, `contenu`, `date de création`, `administrateur_id administrateur`) VALUES
(89, 'Comment marche le capteur ?', '2024-01-23 14:00:55', 0),
(90, 'question souhaité', '2024-01-23 14:34:13', 0);

-- --------------------------------------------------------

--
-- Structure de la table `reponse_forum`
--

CREATE TABLE `reponse_forum` (
  `id réponse` int(11) NOT NULL,
  `contenu` varchar(45) NOT NULL,
  `date de création` datetime NOT NULL,
  `administrateur_id administrateur` int(11) NOT NULL,
  `question_forum_id_question` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `reponse_forum`
--

INSERT INTO `reponse_forum` (`id réponse`, `contenu`, `date de création`, `administrateur_id administrateur`, `question_forum_id_question`) VALUES
(15, 'Je ne sais pas', '0000-00-00 00:00:00', 0, 89),
(16, 'je veux répondre', '0000-00-00 00:00:00', 0, 90);

-- --------------------------------------------------------

--
-- Structure de la table `réponse(forum)`
--

CREATE TABLE `réponse(forum)` (
  `id réponse` int(11) NOT NULL,
  `contenu` varchar(45) NOT NULL,
  `date de création` datetime NOT NULL,
  `administrateur_id administrateur` int(11) NOT NULL,
  `question(forum)_id question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id salle` int(11) NOT NULL,
  `capacité` int(11) NOT NULL,
  `numéro de salle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id salle`, `capacité`, `numéro de salle`) VALUES
(1, 100, 101);

-- --------------------------------------------------------

--
-- Structure de la table `sondage`
--

CREATE TABLE `sondage` (
  `Numero de sondage` int(11) NOT NULL,
  `résultat (moyenne des résultats obtenus` varchar(45) NOT NULL,
  `Nombre de réponses reçues` int(11) NOT NULL,
  `conférence_id conférence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sujets_conference`
--

CREATE TABLE `sujets_conference` (
  `id_sujets` int(11) NOT NULL,
  `nom_sujet` varchar(255) NOT NULL,
  `chemin_image` varchar(255) NOT NULL,
  `nom_sujet_en` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `sujets_conference`
--

INSERT INTO `sujets_conference` (`id_sujets`, `nom_sujet`, `chemin_image`, `nom_sujet_en`) VALUES
(15, 'Mathématiques', 'images/MathsF.png', 'Mathematics'),
(16, 'Physique', 'images/PhysiqueF.png', 'Physics'),
(17, 'Informatique', 'images/InfoF.png', 'Computer Science'),
(18, 'Philosophie', 'images/PhiloF.png', 'Philosophy'),
(19, 'Economie', 'images/EcoF.png', 'Economics'),
(21, 'Divers', 'images/DiversF.png', 'Miscellaneous'),
(29, 'histoire', 'images/DiversF.png', '');

-- --------------------------------------------------------

--
-- Structure de la table `texts`
--

CREATE TABLE `texts` (
  `id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_en` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `texts`
--

INSERT INTO `texts` (`id`, `section`, `content`, `content_en`) VALUES
(1, 'section1', 'Laissez-Vous Accompagner Dans La Gestion De Conférences.', 'Let Yourself Be Accompanied In Conference Management.'),
(2, 'section2', 'Nous proposons un service de gestion de conférences avec des capteurs haute de gamme et un suivi avec de nombreuses fonctionnalités', 'We offer conference management service with high-end sensors and comprehensive tracking features.'),
(3, 'section3', 'Soyez sûr que chaque mot compte.\r\n', 'Be sure every word counts.'),
(4, 'section4', 'Optimisez l\'expérience audio de vos conférences avec nos capteurs sonores de pointe pour une gestion de qualité inégalée', 'Optimize the audio experience of your conferences with our cutting-edge sound sensors for unparalleled quality management.');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id utilisateur` int(11) NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `Prénom` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `mot de passe` varchar(255) NOT NULL,
  `adresse mail` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id utilisateur`, `Nom`, `Prénom`, `type`, `mot de passe`, `adresse mail`) VALUES
(1, 'Brun', 'William', 'admin', 'test', 'wbrun@gmail.com'),
(6, 'winkelmuller', 'louis', 'élève', '$2y$10$Fl2LX/8bBl6IQ7nuXPXl2egiyusKdJ613.RM24', 'louiswinkelmuller@icloud.com'),
(8, 'Jacquier', 'Hugo', 'admin', '$2y$10$JLURvy6taYObsacwYBTLzO7KzGZW0H1W3pVl.QL7CAZAa.QyqICVe', 'hugo@gmail.com'),
(11, '', '', 'élève', '$2y$10$0HbTDovm4.b.kB5LfJeQO.d.12Bc9GykxGJmpP1/xyT42q4qw/35G', ''),
(12, '', '', 'élève', '$2y$10$7CnV8csPzvKgJQMT/YyyzeAd9QDQK/JtCVp1FyeegcTukj5.nJwmS', ''),
(14, 'LOULU', 'W', 'élève', '$2y$10$25leWZDeWD9nc1UCjO.TmOknH/4/Qk4yjZnaUAET0GYcE0/vCirhe', 'LO@.com'),
(15, 'mat', 'aa', 'élève', '$2y$10$lDmBIXcS0hXkhRfl1OOqBu8CqMGo6cNjhLvmILVKJjCdeSRcx6A3K', 'maa'),
(16, 'test22771818', 'OUIIIIII', 'élève', '$2y$10$0hmsgOUjwpxy58whvw9gg.mPhGUHHebaRQuP4TILMNjsheKQasBNe', 'OUI'),
(17, 'alaex', 'aa', 'élève', '$2y$10$kteagWRzaQv9Yq99KxVgMenedw3YLq3VzDbCdvz13h70fabEN4wma', 'kelber'),
(18, 'william', 'eve', 'élève', '$2y$10$5cxRkmhYpYRC5jFIIQUYP.JKNr.zGMLoIfhz2kkAeza.FaDW3G5je', 'eve.isep'),
(19, 'alec', 'bor', 'élève', '$2y$10$cYhBmH9yULwtxAAwqbfqL.SDQFdSVM79mG2ylJ.RbT9QxlhfI7EeK', 'alex'),
(20, 'amira', 'dupond', 'élève', '$2y$10$4WFRE7OMpcy5gIbybY4T4uG2LMy8WNrx8z1vyDJ1CndLkE4CWQ/0q', 'amira@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_has_conférence`
--

CREATE TABLE `utilisateur_has_conférence` (
  `utilisateur_id utilisateur` int(11) NOT NULL,
  `conférence_id conférence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cgu et mentions légales`
--
ALTER TABLE `cgu et mentions légales`
  ADD PRIMARY KEY (`id CGU et mentions légales`);

--
-- Index pour la table `cgu_mentions_legales`
--
ALTER TABLE `cgu_mentions_legales`
  ADD PRIMARY KEY (`id_CGU_mentions_legales`);

--
-- Index pour la table `conférence`
--
ALTER TABLE `conférence`
  ADD PRIMARY KEY (`id conférence`),
  ADD KEY `fk_conférence_salle1` (`salle_id salle`,`salle_capacité`,`salle_numéro de salle`),
  ADD KEY `fk_conférence_administrateur1` (`administrateur_id administrateur`),
  ADD KEY `fk_conference_sujets` (`id_sujets`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id contact`,`adressse mail`);

--
-- Index pour la table `niveau sonore`
--
ALTER TABLE `niveau sonore`
  ADD PRIMARY KEY (`id niveau sonore`),
  ADD KEY `fk_niveau sonore_conférence1` (`conférence_id conférence`);

--
-- Index pour la table `question(forum)`
--
ALTER TABLE `question(forum)`
  ADD PRIMARY KEY (`id question`),
  ADD KEY `fk_question(forum)_administrateur1` (`administrateur_id administrateur`);

--
-- Index pour la table `question de faq`
--
ALTER TABLE `question de faq`
  ADD PRIMARY KEY (`id_question`,`réponse proposée`);

--
-- Index pour la table `question_forum`
--
ALTER TABLE `question_forum`
  ADD PRIMARY KEY (`id question`),
  ADD KEY `fk_question(forum)_administrateur1` (`administrateur_id administrateur`);

--
-- Index pour la table `reponse_forum`
--
ALTER TABLE `reponse_forum`
  ADD PRIMARY KEY (`id réponse`),
  ADD KEY `fk_réponse(forum)_administrateur` (`administrateur_id administrateur`),
  ADD KEY `fk_réponse(forum)_question(forum)1` (`question_forum_id_question`);

--
-- Index pour la table `réponse(forum)`
--
ALTER TABLE `réponse(forum)`
  ADD PRIMARY KEY (`id réponse`),
  ADD KEY `fk_réponse(forum)_administrateur` (`administrateur_id administrateur`),
  ADD KEY `fk_réponse(forum)_question(forum)1` (`question(forum)_id question`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id salle`,`capacité`,`numéro de salle`);

--
-- Index pour la table `sondage`
--
ALTER TABLE `sondage`
  ADD PRIMARY KEY (`Numero de sondage`,`Nombre de réponses reçues`),
  ADD KEY `fk_sondage_conférence1` (`conférence_id conférence`);

--
-- Index pour la table `sujets_conference`
--
ALTER TABLE `sujets_conference`
  ADD PRIMARY KEY (`id_sujets`);

--
-- Index pour la table `texts`
--
ALTER TABLE `texts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id utilisateur`);

--
-- Index pour la table `utilisateur_has_conférence`
--
ALTER TABLE `utilisateur_has_conférence`
  ADD PRIMARY KEY (`utilisateur_id utilisateur`,`conférence_id conférence`),
  ADD KEY `fk_utilisateur_has_conférence_conférence1` (`conférence_id conférence`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cgu et mentions légales`
--
ALTER TABLE `cgu et mentions légales`
  MODIFY `id CGU et mentions légales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `cgu_mentions_legales`
--
ALTER TABLE `cgu_mentions_legales`
  MODIFY `id_CGU_mentions_legales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `conférence`
--
ALTER TABLE `conférence`
  MODIFY `id conférence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id contact` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `niveau sonore`
--
ALTER TABLE `niveau sonore`
  MODIFY `id niveau sonore` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `question(forum)`
--
ALTER TABLE `question(forum)`
  MODIFY `id question` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `question de faq`
--
ALTER TABLE `question de faq`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `question_forum`
--
ALTER TABLE `question_forum`
  MODIFY `id question` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT pour la table `reponse_forum`
--
ALTER TABLE `reponse_forum`
  MODIFY `id réponse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id salle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `sondage`
--
ALTER TABLE `sondage`
  MODIFY `Numero de sondage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sujets_conference`
--
ALTER TABLE `sujets_conference`
  MODIFY `id_sujets` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `texts`
--
ALTER TABLE `texts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `conférence`
--
ALTER TABLE `conférence`
  ADD CONSTRAINT `fk_conference_sujets` FOREIGN KEY (`id_sujets`) REFERENCES `sujets_conference` (`id_sujets`),
  ADD CONSTRAINT `fk_conférence_administrateur1` FOREIGN KEY (`administrateur_id administrateur`) REFERENCES `utilisateur` (`id utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_conférence_salle1` FOREIGN KEY (`salle_id salle`,`salle_capacité`,`salle_numéro de salle`) REFERENCES `salle` (`id salle`, `capacité`, `numéro de salle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `niveau sonore`
--
ALTER TABLE `niveau sonore`
  ADD CONSTRAINT `fk_niveau sonore_conférence1` FOREIGN KEY (`conférence_id conférence`) REFERENCES `conférence` (`id conférence`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `question(forum)`
--
ALTER TABLE `question(forum)`
  ADD CONSTRAINT `fk_question(forum)_administrateur1` FOREIGN KEY (`administrateur_id administrateur`) REFERENCES `utilisateur` (`id utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `réponse(forum)`
--
ALTER TABLE `réponse(forum)`
  ADD CONSTRAINT `fk_réponse(forum)_administrateur` FOREIGN KEY (`administrateur_id administrateur`) REFERENCES `utilisateur` (`id utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_réponse(forum)_question(forum)1` FOREIGN KEY (`question(forum)_id question`) REFERENCES `question(forum)` (`id question`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sondage`
--
ALTER TABLE `sondage`
  ADD CONSTRAINT `fk_sondage_conférence1` FOREIGN KEY (`conférence_id conférence`) REFERENCES `conférence` (`id conférence`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur_has_conférence`
--
ALTER TABLE `utilisateur_has_conférence`
  ADD CONSTRAINT `fk_utilisateur_has_conférence_conférence1` FOREIGN KEY (`conférence_id conférence`) REFERENCES `conférence` (`id conférence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_utilisateur_has_conférence_utilisateur1` FOREIGN KEY (`utilisateur_id utilisateur`) REFERENCES `utilisateur` (`id utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
