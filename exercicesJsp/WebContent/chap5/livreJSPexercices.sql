# Host: localhost
# Generation Time: Jun 24, 2004 at 10:20 AM
# Server version: 4.0.20
# 
# Database : `livrejsp` pour les exercices du chapitre 5 (exercice 5.2)
# Pour mettre � jour la table lancer mysql depuis une fen�tre de commande
# avec la commande mysql -u root -p (taper le mot de passe root)
# ensuite sous mysql taper la commande source /chemin d'acces/au/fichier/livrejsp.sql;
# Pour les exercices du chapitre 5, la table lecteurs contient un champs de mot de passe
#                                   la table livres contient  un champs dejaReserve 
# 
USE mysql;
DROP DATABASE IF EXISTS `livrejsp`;
CREATE DATABASE `livrejsp`;
USE livrejsp;
# --------------------------------------------------------

#
# Structure de la table `lecteurs` pour les exercices du chapitre 5
#

DROP TABLE IF EXISTS `emprunts`;
CREATE TABLE `emprunts` (
  EMP_Numero char(255),
  EMP_Date date ,
  EMP_DateRetour date,
  EMP_CodeLivre char(255) ,
  EMP_NumLecteur char(255),
  PRIMARY KEY  (`EMP_Numero`)
) ;

# --------------------------------------------------------

## Structure de la table `lecteurs` pour les exercices du chapitre 5
#

DROP TABLE IF EXISTS `lecteurs`;
CREATE TABLE `lecteurs` (
  LEC_NumLecteur char(16),
  LEC_NomLecteur char(16),
  LEC_PrenomLecteur char(16),
  LEC_Adresse char(80),
  LEC_Ville char(16),
  LEC_CodePostal char(10),
  LEC_MotDePasse char(80),
  PRIMARY KEY  (`LEC_NumLecteur`)
);

# Donn�es enregistr�es pour la table `lecteurs` pour les exexercices emples du chapitre 5

INSERT INTO `lecteurs` VALUES ('216', 'Lamy', 'El�na', '7 rue du Paradis', 'Paris', '75012', 'El�na');
INSERT INTO `lecteurs` VALUES ('221', 'Th�os', 'Pablo', '3 passage Secret', 'Paris', '75004', 'Pablo');
INSERT INTO `lecteurs` VALUES ('342', 'Camden',	'Nicolas', '24 av du Papillon', 'Paris', '75013', 'Nicolas');
INSERT INTO `lecteurs` VALUES ('528', 'Line', 'Margo', '22 rue de la Libert�', 'Paris', '75005', 'Margo');




# --------------------------------------------------------

# Structure de la table `livres` pour les exercices du chapitre 5
#

DROP TABLE IF EXISTS `livres`;
CREATE TABLE `livres` (
  LIV_CodeLivre char(255) ,
  LIV_NomAuteur char(255) ,
  LIV_PrenomAuteur char(255) ,
  LIV_Titre char(255) ,
  LIV_Categorie char(255) ,
  LIV_ISBN char(255) ,
  LIV_DejaReserve tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`LIV_CodeLivre`)
);

#
# Donn�es enregistr�es pour la table `livres` pour les exemples du chapitre 5
#

    
INSERT INTO `livres` VALUES ('KaElRo58', 'Kazan', 'Elia', 'L�arrangement', 'Roman', '2234023858', 1);
INSERT INTO `livres` VALUES ('GaJoPh68', 'Gaarder', 'Jostein', 'Le monde de Sophie', 'Philosophie', '2020550768', 1);
INSERT INTO `livres` VALUES ('AsIsSc08', 'Asimov', 'Isaac', 'Fondation', 'Science-fiction', '2070415708', 1);
INSERT INTO `livres` VALUES ('FaPhSc90', 'Farmer', 'Philip Jos�', 'Le monde du Fleuve', 'Science-fiction', '2253061190', 1);
INSERT INTO `livres` VALUES ('DiPhSc43', 'Dick', 'Philip K.', 'Blade Runner', 'Science-fiction', '2290314943', 1);
INSERT INTO `livres` VALUES ('CoAnPh07', 'Comte-Sponville', 'Andr�', 'Trait� du d�sespoir et de la b�atitude', 'Philosophie', '2130529607', 1);
INSERT INTO `livres` VALUES ('WaAlRo37', 'Walker', 'Alice', 'La couleur pourpre', 'Roman', '2290021237', 1);
INSERT INTO `livres` VALUES ('LeGaPo95', 'Leroux', 'Gaston', 'Le myst�re de la chambre jaune', 'Policier', '2253005495', 0);
INSERT INTO `livres` VALUES ('KeDoPo83', 'Kennedy', 'Douglas', 'L�homme qui voulait vivre sa vie', 'Policier', '2266087983', 0);
INSERT INTO `livres` VALUES ('KuMiRo38', 'Kundera', 'Milan', 'La plaisanterie', 'Roman', '2070703738', 0);
INSERT INTO `livres` VALUES ('ZwStRo33', 'Zweig', 'Stefan', 'La confusion des sentiments', 'Roman', '2253061433', 0);
INSERT INTO `livres` VALUES ('BaJaJu63', 'Barrie', 'James M.', 'Peter Pan', 'Junior', '2290333263', 0);
INSERT INTO `livres` VALUES ('VeJuRo22', 'Verne', 'Jules', 'L �le myst�rieuse', 'Roman', '0812966422', 0);
