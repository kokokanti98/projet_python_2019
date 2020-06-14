-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 09, 2019 at 02:03 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `nom_album` varchar(255) NOT NULL,
  `nombre_chansons` int(11) NOT NULL,
  PRIMARY KEY (`id_album`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id_album`, `nom_album`, `nombre_chansons`) VALUES
(1, 'les yeus plus gros', 4),
(2, 'alpha', 4),
(3, 'beta', 3),
(4, 'gamma', 5);

-- --------------------------------------------------------

--
-- Table structure for table `chanson`
--

DROP TABLE IF EXISTS `chanson`;
CREATE TABLE IF NOT EXISTS `chanson` (
  `id_chanson` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chanteur_principal` int(11) DEFAULT NULL,
  `chanteur2` int(11) DEFAULT NULL,
  `chanteur3` int(11) DEFAULT NULL,
  `chanteur4` int(11) DEFAULT NULL,
  `chanteur5` int(11) DEFAULT NULL,
  `parole` text,
  `annee_sortie` year(4) DEFAULT NULL,
  `numero_album` int(11) DEFAULT NULL,
  `numero_categorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_chanson`),
  KEY `chanteur_principal` (`chanteur_principal`),
  KEY `chanteur2` (`chanteur2`),
  KEY `chanteur3` (`chanteur3`),
  KEY `chanteur4` (`chanteur4`),
  KEY `chanteur5` (`chanteur5`),
  KEY `numero_album` (`numero_album`),
  KEY `numero_categorie` (`numero_categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chanson`
--

INSERT INTO `chanson` (`id_chanson`, `titre`, `chanteur_principal`, `chanteur2`, `chanteur3`, `chanteur4`, `chanteur5`, `parole`, `annee_sortie`, `numero_album`, `numero_categorie`) VALUES
(1, 'aladin', 1, NULL, NULL, NULL, NULL, 'HELLO HELLO', 2019, 1, 1),
(3, 'miami', 5, NULL, NULL, NULL, NULL, 'Encore une fois, je creuse l’écart \r\nEncore une fois, y’a pas de bluff, je joue carte sur table \r\nj’entends ces voix tout près de moi qui chuchotent dans mon crâne \r\nLe temps qui passe, les visages fanent, mais je reste imperméable \r\nJe fonce dans l’tas, j’mets les pleins phares \r\nDans le feu de l’action j’attrape mon arme, une balle s’échappe \r\nJ’peux plus rebrousser chemin, trop tard, maintenant qu’j’suis dans l’mal\r\n\r\nJ’allume ma clope au volant de cette spirale infernale \r\nJ’ai fait ce qu’il fallait, même si tout ça m’torture l’esprit \r\n\r\nJ’assume mes erreursJ’ai l’inconscience au bout du fil, ma tête est ailleurs \r\nMe parle pas d’savoir-vivre (ouh, ouh, ouh) \r\nJe suis la preuve vivante que la vie ne tient qu’à un fil \r\nJ’ai fait c’qu’il fallait \r\n(ouh, ouh, ouh) \r\n(ouh, ouh, ouh) \r\n(ouh, ouh, ouh) \r\n\r\nGloire, pouvoir, beauté, souvent ça finit mal \r\nDifficile de voir des larmes à travers les flammes (ouh, ouh, ouh) \r\nGloire, pouvoir, beauté, souvent ça finit mal \r\nDifficile de voir des larmes à travers les flammes (ouh, ouh, ouh) \r\nMon âme à la dérive, l’impression d’être libre \r\n\r\nDans mes yeux tu peux lire, je reste ferme et solide \r\n\r\nEncore une fois, je creuse l’écart \r\nEncore une fois, y’a pas de bluff, je joue carte sur table \r\nj’entends ces voix tout près de moi qui chuchotent dans mon crâne \r\nLe temps qui passe, les visages fanent, mais je reste imperméable \r\nJe fonce dans l’tas, j’mets les pleins phares \r\nDans le feu de l’action j’attrape mon arme, une balle s’échappe \r\nJ’peux plus rebrousser chemin, trop tard, maintenant qu’j’suis dans l’mal \r\nJ’allume ma clope au volant de cette spirale infernale \r\nJ’ai fait ce qu’il fallait, même si tout ça m’torture l’esprit \r\n\r\nJ’assume mes erreursJ’ai l’inconscience au bout du fil, ma tête est ailleurs \r\nMe parle pas d’savoir-vivre (ouh, ouh, ouh) \r\nJe suis la preuve vivante que la vie ne tient qu’à un fil \r\nJ’ai fait c’qu’il fallait \r\n(ouh, ouh, ouh) \r\n(ouh, ouh, ouh) \r\n(ouh, ouh, ouh) \r\n\r\nEncore une fois… (encore une fois) \r\nEncore une fois… (encore une fois) \r\n\r\nJ’ai fait ce qu’il fallait, même si tout ça m’torturent l’esprit \r\nJ’assume mes erreurs \r\nJ’ai l’inconscience au bout du fil, ma tête est ailleurs \r\n\r\nMe parle pas d’savoir-vivre (ouh, ouh, ouh) \r\nJe suis la preuve vivante que la vie ne tient qu’à un fil \r\nJ’ai fait c’qu’il fallait \r\n(ouh, ouh, ouh) \r\n(ouh, ouh, ouh) \r\n(ouh, ouh, ouh)\r\n', 2019, 3, 5),
(4, 'le pire', 5, NULL, NULL, NULL, NULL, 'Le pire, c\'est pas la méchanceté des hommes\r\nMais l\'silence des autres qui font tous semblant d\'hésiter\r\nEt quand les enfants me demandent, \"pourquoi la mer est-elle salée?\"\r\nJe suis obligé de répondre que les poissons ont trop pleuré\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait\r\nJ\'suis posé sur mon divan, j\'regarde la télévision\r\nExplique-moi ce qu\'il se passe, c\'est comme si j\'avais dix ans\r\nAssombrie est ma vision, pourtant l\'soleil est présent\r\nLes gens qui font la morale avec une veste en vison\r\nOu p\'t-être simplement qu\'on a perdu la raison\r\nLa vie, un terrain glissant, mais dans quel monde nous vivons?\r\nStop et, en effet, le mal est fait\r\nMais stop, stop, stop car, en effet, le mal est fait\r\nLe pire, c\'est pas la méchanceté des hommes\r\nMais l\'silence des autres qui font tous semblant d\'hésiter\r\nEt quand les enfants me demandent, \"pourquoi la mer est-elle salée?\"\r\nJe suis obligé de répondre que les poissons ont trop pleuré\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait\r\nJ\'me rassois sur le divan, toujours la télévision\r\nObligé d\'plisser les yeux, rien à l\'horizon\r\nJ\'vais raconter mes problèmes à des gens qui vivent dans l\'aisance\r\nIls vont me prendre au sérieux que si j\'m\'asperge d\'essence\r\nOu p\'t-être que, tout simplement, j\'n\'intéresse pas grand monde\r\nJ\'suis p\'t-être une valeur marchande aux yeux de quelques passants\r\nStop et, en effet, le mal est fait\r\nMais stop, stop, stop car, en effet, le mal est fait\r\nLe pire, c\'est pas la méchanceté des hommes\r\nMais l\'silence des autres qui font tous semblant d\'hésiter\r\nEt quand les enfants me demandent, \"pourquoi la mer est-elle salée?\"\r\nJe suis obligé de répondre que les poissons ont trop pleuré\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait\r\nLe pire, c\'est de ne pas profiter du temps qu\'il nous reste à vivre\r\nLe pire, c\'est de ne pas reconnaître tout ce qui nous arrive\r\nLe pire, c\'est de ne pas profiter du temps qu\'il nous reste à vivre\r\nLe pire, c\'est de ne pas reconnaître tout ce qui nous arrive\r\nLe pire, c\'est pas la méchanceté des hommes\r\nMais l\'silence des autres qui font tous semblant d\'hésiter\r\nEt quand les enfants me demandent, \"pourquoi la mer est-elle salée?\"\r\nJe suis obligé de répondre que les poissons ont trop pleuré\r\nLe pire, c\'est pas la méchanceté des hommes\r\nMais l\'silence des autres qui font tous semblant d\'hésiter\r\nEt quand les enfants me demandent, \"pourquoi la mer est-elle salée?\"\r\nJe suis obligé de répondre que les poissons ont trop pleuré\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait\r\nEh eh eh eh\r\nMais dis-moi c\'qu\'on a fait', 2019, 2, 5),
(5, 'le plus fort du monde', 1, NULL, NULL, NULL, NULL, 'Mon papa à moi c\'est le plus fort du monde\r\nIl vient de loin, il a souffert, si t\'as du temps faut qu\'j\'te raconte\r\nMon papa à moi c\'est le plus fort du monde\r\nIl vient de loin, il a souffert, si t\'as du temps faut qu\'j\'te raconte\r\nAnh, il s\'est battu, contre le monde, il était têtu (têtu)\r\nJ\'peux t\'faire un film sur son vécu (vécu)\r\nQuand il me parle je l\'écoute avec attention et passion\r\nAnh, plus fort que Superman, j\'suis pas objectif\r\nJ\'suis son plus grand supporter, c\'est mon génie\r\nHm, je ne suis rien sans lui, il m\'a, il m\'a tout appris\r\nJe ne vois pas le futur sans mon père, c\'est mon plus grand repère\r\nMon exemple, le daron, le chef, le vrai patron\r\nSans lui je tourne en rond, en rond\r\nMon exemple, le daron, le chef, le vrai patron\r\nSans lui je tourne en rond, en rond\r\nMon papa à moi c\'est le plus fort du monde\r\nIl vient de loin, il a souffert, si t\'as du temps faut qu\'j\'te raconte\r\nMon papa à moi c\'est le plus fort du monde\r\nIl vient de loin, il a souffert, si t\'as du temps faut qu\'j\'te raconte\r\nIl a l\'habitude, il protège mes arrières, c\'est ma sécu\' (sécu\')\r\nLe débrouillard n\'a pas fait d\'études\r\nQuand il me parle, j\'l\'écoute avec attention et passion\r\nAnh, je dors tellement bien quand il est là\r\nParce qu\'il, parce qu\'il est comme mon ange gardien\r\nIl sait me rassurer, à toujours assurer, j\'ai jamais manqué de rien\r\nOui, je l\'aime autant qu\'maman, je resterai toujours son enfant\r\nMon exemple, le daron, le chef, le vrai patron\r\nSans lui je tourne en rond, en rond\r\nMon exemple, le daron, le chef, le vrai patron\r\nSans lui je tourne en rond, en rond\r\nMon papa à moi c\'est le plus fort du monde\r\nIl vient de loin, il a souffert, si t\'as du temps faut qu\'j\'te raconte\r\nMon papa à moi c\'est le plus fort du monde\r\nIl vient de loin, il a souffert, si t\'as du temps faut qu\'j\'te raconte\r\nPersonne ne peut battre papa, personne ne peut battre papa\r\nPersonne ne peut battre papa, personne ne peut battre papa\r\nPersonne ne peut battre papa, personne ne peut battre papa\r\nPersonne ne peut battre papa, personne ne peut battre papa\r\nMon exemple, le daron, le chef, le vrai patron\r\nSans lui je tourne en rond, en rond\r\nMon exemple, le daron, le chef, le vrai patron\r\nSans lui je tourne en rond, en rond\r\nMon papa à moi c\'est le plus fort du monde\r\nIl vient de loin, il a souffert, si t\'as du temps faut qu\'j\'te raconte\r\nMon papa à moi c\'est le plus fort du monde\r\nIl vient de loin, il a souffert, si t\'as du temps faut qu\'j\'te raconte\r\n', 2016, 1, 2),
(6, 'shallow', 6, 7, NULL, NULL, NULL, 'Tell me somethin\', girl\r\nAre you happy in this modern world?\r\nOr do you need more?\r\nIs there somethin\' else you\'re searchin\' for?\r\nI\'m falling\r\nIn all the good times I find myself\r\nLongin\' for change\r\nAnd in the bad times I fear myself\r\nTell me something, boy\r\nAren\'t you tired tryin\' to fill that void?\r\nOr do you need more?\r\nAin\'t it hard keeping it so hardcore?\r\nI\'m falling\r\nIn all the good times I find myself\r\nLonging for change\r\nAnd in the bad times I fear myself\r\nI\'m off the deep end, watch as I dive in\r\nI\'ll never meet the ground\r\nCrash through the surface, where they can\'t hurt us\r\nWe\'re far from the shallow now\r\nIn the shallow, shallow\r\nIn the shallow, shallow\r\nIn the shallow, shallow\r\nWe\'re far from the shallow now\r\nOh, oh, oh, oh\r\nWhoah!\r\nI\'m off the deep end, watch as I dive in\r\nI\'ll never meet the ground\r\nCrash through the surface, where they can\'t hurt us\r\nWe\'re far from the shallow now\r\nIn the shallow, shallow\r\nIn the shallow, shallow\r\nIn the shallow, shallow\r\nWe\'re far from the shallow now\r\n', 2019, 1, 4),
(7, 'diamond heart', 8, 9, NULL, NULL, NULL, 'Hello sweet grief\r\nI know you will be the death of me\r\nFeel like the morning after ecstasy\r\nI am drowning in an endless sea\r\nHello old friend\r\nHere’s the misery that knows no end\r\nSo I am doing everything I can\r\nTo make sure I never love again\r\nI wish that I did not know\r\nWhere all broken lovers go\r\nI wish that my heart was made of stone\r\nYeah if I was bulletproof\r\nI’d love you black and blue\r\nIf I was solid like a jewel\r\nIf I had a diamond heart\r\nOh oh\r\nI’d give you all my love\r\nIf I was unbreakable\r\nIf I had a diamond heart\r\nOh oh\r\nYou could shoot me with a gun of gold\r\nIf I was unbreakable\r\nI’d walk straight through the bullet\r\nBendin’ like a tulip\r\nBlue-eyed and foolish\r\nNever mind the bruises\r\nInto the fire\r\nBreakin’ through the wires\r\nGive you all I’ve got\r\nIf I had a diamond heart\r\nI’d walk straight through the dagger\r\nNever break the pattern\r\nDiamonds don’t shatter\r\nBeautiful and battered\r\nInto the poison\r\nCry you an ocean\r\nGive you all I’ve got\r\nGoodbye, so long\r\nI don’t know if this is right or wrong\r\nAm I giving up where I belong?\r\n\'Cause every station is playing our song\r\nGoodbye my love\r\nYou are everything my dreams made of\r\nYou’ll be Prince and I’m the crying dove\r\nIf I only were unbreakable\r\nI wish that I did not know\r\nWhere all broken lovers go\r\nI wish that my heart was made of stone\r\nYeah if I was bulletproof\r\nI’d love you black and blue\r\nIf I was solid like a jewel\r\nIf I had a diamond heart\r\nOh oh\r\nI’d give you all my love\r\nIf I was unbreakable\r\nIf I had a diamond heart\r\nOh oh\r\nYou could shoot me with a gun of gold\r\nIf I was unbreakable\r\nI’d walk straight through the bullet\r\nBendin’ like a tulip\r\nBlue-eyed and foolish\r\nNever mind the bruises\r\nInto the fire\r\nBreakin’ through the wires\r\nGive you all I’ve got\r\nIf I had a diamond heart\r\nI’d walk straight through the dagger\r\nNever break the pattern\r\nDiamonds don’t shatter\r\nBeautiful and battered\r\nInto the poison\r\nCry you an ocean\r\nGive you all I’ve got\r\nI’d give you all my love\r\nIf I was unbreakable\r\nYou could shoot me with a gun of gold\r\nIf I was unbreakable\r\nI’d walk straight through the bullet\r\nBendin’ like a tulip\r\nBlue-eyed and foolish\r\nNever mind the bruises\r\nInto the fire\r\nBreakin’ through the wires\r\nGive you all I’ve got\r\nI’d walk straight through the dagger\r\nNever break the pattern\r\nDiamonds don’t shatter\r\nBeautiful and battered\r\nInto the poison\r\nCry you an ocean\r\nGive you all I got', 2019, 3, 4),
(8, 'promises', 10, 11, NULL, NULL, NULL, 'Are you drunk enough?\r\nNot to judge what I\'m doin’\r\nAre you high enough?\r\nTo excuse that I\'m ruined\r\n\'Cause I’m ruined\r\nIs it late enough?\r\nFor you to come and stay over\r\n\'Cause we\'re free to love\r\nSo tease me, hmmm\r\nI make no promises, I can\'t do golden rings\r\nBut I\'ll give you everything (tonight)\r\nMagic is in the air, there ain\'t no science here\r\nSo come get your everything (tonight)\r\nI make no promises, I can\'t do golden rings\r\nBut I\'ll give you everything (tonight)\r\nMagic is in the air, there ain’t no science here\r\nSo come get your everything (tonight)\r\nTonight\r\n(You\'re everything tonight)\r\nIs it loud enough?\r\n\'Cause my body is calling for you, calling for you\r\nI need someone, to do the things that I do\r\nI\'m heating up, energy’s taking control\r\nI\'m speeding up\r\nMy heartbeat\'s dancing alone\r\nI make no promises, I can\'t do golden rings\r\nBut I’ll give you everything (tonight)\r\nMagic is in the air, there ain\'t no science here\r\nSo come get your everything (tonight)\r\nI make no promises, I can\'t do golden rings\r\nBut I\'ll give you everything (tonight)\r\nMagic is in the air, there ain\'t no science here\r\nSo come get your everything (tonight)\r\nTonight\r\n(You\'re everything tonight)\r\n\'Cause I need your green light\r\nDay and night, say that you\'re mine\r\n\'Cause I need your green light\r\nDay and night, say that you\'re mine\r\nSay that you\'re mine\r\nSay that you\'re mine\r\nI make no promises, I can\'t do golden rings\r\nBut I\'ll give you everything (tonight)\r\nMagic is in the air, there ain\'t no science here\r\nSo come get your everything (tonight)\r\nI make no promises, I can\'t do golden rings\r\nBut I\'ll give you everything (tonight)\r\nMagic is in the air, there ain\'t no science here\r\nSo come get your everything (tonight)\r\nTonight', 2019, 3, 2),
(9, 'je te le donne', 12, 13, NULL, NULL, NULL, 'Je Te Le Donne\r\nVitaa\r\nJe ne sais pas faire \r\nJ\'ai beau mentir tout me ramène à toi \r\nJe ne sais pas faire quand t\'es pas là \r\nJe ne sais pas faire \r\nJ\'ai beau sourire quand on parle de toi \r\nJe ne sais pas faire quand t\'es pas là \r\nJe n\'ai plus rien à perdre \r\nRien à gagner \r\nJe n\'ai plus de peine \r\nPlus rien à pleurer \r\nRien c\'est déjà trop \r\nTout me semble faux \r\nQuand t\'es pas là \r\nÇa ne compte pas\r\nQuand t\'es pas là, toi \r\nLà, où les mots font s\'aimer les hommes \r\nSi tu l\'entends ça, je te pardonne \r\nQuand t\'es pas là, toi \r\nLà, où les autres ont le cœur qui cogne \r\nSi tu le veux, prends, je te le donne (je te le donne)\r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne, je te le donne \r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne, je te le donne\r\nJ\'ai le spleen de toi, de tes yeux \r\nSans un signe plus rien de nous deux \r\nJe reste digne même si ça fait mal quand t\'es pas là \r\nJe sens ta main posée sur la mienne \r\nEt le son de ta voix qui traîne \r\nJe n\'ai plus le goût de rien \r\nQuand t\'es pas là \r\nJe n\'ai plus rien à perdre \r\nRien à gagner \r\nJe n\'ai plus de peine \r\nPlus rien à pleurer \r\nRien c\'est déjà trop \r\nTout me semble faux \r\nQuand t\'es pas là \r\nÇa ne compte pas\r\nQuand t\'es pas là, toi \r\nLà, où les mots font s\'aimer les hommes \r\nSi tu l\'entends ça, je te pardonne \r\nQuand t\'es pas là, toi \r\nLà où les autres ont le cœur qui cogne \r\nSi tu le veux, prends, je te le donne (je te le donne)\r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne, je te le donne \r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne, je te le donne\r\nJe ne sais pas faire \r\nJ\'ai beau mentir, tout me ramène à toi \r\nJe ne sais pas faire quand t\'es pas là \r\nJe ne sais pas faire \r\nJ\'ai beau sourire quand on parle de toi \r\nJe ne sais pas\r\nOh, quand t\'es pas là, toi \r\nLà, où les mots font s\'aimer les hommes \r\nSi tu l\'entends ça, je te pardonne \r\nQuand t\'es pas là, toi \r\nLà, où les autres ont le cœur qui cogne \r\nSi tu le veux, prends, je te le donne (je te le donne)\r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne, je te le donne \r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne \r\nJe te le donne, donne, donne, je te le donne\r\nJe te le donne, donne \r\nJe te le donne, donne, je te le donne \r\nJe te le donne, je te le donne \r\nJe te le donne, donne, je te le donne \r\nQuand t\'es pas là', 2019, 5, 5),
(10, 'a millions dreams', 14, NULL, NULL, NULL, NULL, 'I close my eyes and I can see\r\nA world that\'s waiting up for me that I call my own\r\nThrough the dark, through the door\r\nThrough where no one\'s been before\r\nBut it feels like home\r\n\r\nThey can say, they can say it all sounds crazy\r\nThey can say, they can say I\'ve lost my mind\r\nI don\'t care, I don\'t care, if they call me crazy\r\nWe can live in a world that we design\r\n\r\n\'Cause every night, I lie in bed\r\nThe brightest colors fill my head\r\nA million dreams are keeping me awake\r\nI think of what the world could be\r\nA vision of the one I see\r\nA million dreams is all it\'s gonna take\r\nOh, a million dreams for the world we\'re gonna make\r\n\r\nThere\'s a house we can build\r\nEvery room inside is filled with things from far away\r\nSpecial things I compile\r\nEach one there to make you smile on a rainy day\r\n\r\nThey can say, they can say it all sounds crazy\r\nThey can say, they can say we\'ve lost our minds\r\nSee, I don\'t care, I don\'t care if they call us crazy\r\nRun away to a world that we design\r\n\r\n\'Cause every night, I lie in bed\r\nThe brightest colors fill my head\r\nA million dreams are keeping me awake\r\nI think of what the world could be\r\nA vision of the one I see\r\nA million dreams is all it\'s gonna take\r\nOh, a million dreams for the world we\'re gonna make\r\n\r\nHowever big, however small\r\nLet me be part of it all\r\nShare your dreams with me\r\nWe may be right, we may be wrong\r\nBut I wanna bring you along to the world I see\r\nTo the world we close our eyes to see\r\nWe close our eyes to see\r\n\r\nEvery night, I lie in bed\r\nThe brightest colors fill my head\r\nA million dreams are keeping me awake\r\nI think of what the world could be\r\nA vision of the one I see\r\nA million dreams is all it\'s gonna take\r\nA million dreams for the world we\'re gonna make\r\n\r\nFor the world we\'re gonna make\r\n', 2019, 2, 3),
(11, 'thunderclouds', 15, 16, NULL, NULL, NULL, 'LSD\r\nAll I need is one\r\nOne old man is enough\r\nBabe, you got it wrong\r\nPlease, turn your fears into trust, to trust\r\nWhere\'d the love go?\r\nWhen all is said and done\r\nHey now I got your hands in the air\r\nI\'mma go through your stuff\r\nWhere\'d the love go?\r\nYou put the running into run\r\nYou asking me to stay\r\nBut I never met a girl I could trust\r\nYou\'re sayin\' those words\r\nLike you hate me, now (whoa-whoa-oh)\r\nOur house is burning\r\nWhen you\'re raised in hell (whoa-whoa-oh)\r\nHere in the ashes your soul cries out (ah-ah-ah)\r\nBut don\'t be afraid of these thunderclouds\r\nThese thunderclouds, oh, no\r\nThese thunderclouds, oh, no, no\r\nAll I need is love (da-dum, dum, dum)\r\nAll I need is a word (da-dum, dum, dum)\r\nAll I need is us (da-dum, dum, dum)\r\nYou turned nouns into verbs, to verbs\r\nWhere\'d the love go?\r\nWhen all is said and…\r\nHey now put your hands in the air\r\nI\'mma go through your stuff\r\nWhere\'d the love go?\r\nYou put the running into run\r\nYou\'re asking me to stay\r\nBut I never met a man I could trust\r\nYou\'re sayin\' those words\r\nLike you hate me, now (whoa-whoa-oh)\r\nOur house is burning\r\nWhen you\'re raising hell (whoa-whoa-oh)\r\nHere in the ashes your soul cries out (ah-ah-ah)\r\nBut don\'t be afraid of these thunderclouds\r\nThese thunderclouds, oh, no\r\nThese thunderclouds, oh, no, no\r\nThese thunderclouds, oh, no\r\nThese thunderclouds, oh, no, no\r\nThese thunderclouds, oh...\r\nThese thunderclouds, oh...\r\nThese thunder clouds, oh...', 2019, 1, 3),
(12, 'a nos souvenirs', 17, NULL, NULL, NULL, NULL, 'Comment puis-je oublier\r\nce coin de paradis?\r\nCe petit bout de terre\r\noù vit encore mon père,\r\nComment pourrais-je faire\r\npour me séparer d\'elle?\r\nOublier qu\'on est frères,\r\nbelle Corrèze charnelle,\r\nOublier ce matin que tu es parisien,\r\nQue t\'as de l\'eau dans le vin,\r\nQue tu es parti loin?\r\nCe n\'était pas ma faute,\r\nOn jour des fausses notes,\r\nOn se trompe de chemin,\r\net on a du chagrin.\r\nOn se joue tout un drame,\r\nOn a des vagues à l\'âme,\r\nTu as du mal au coeur,\r\nTu as peur du bonheur.\r\nAcheter des tableaux,\r\nEt des vaches en photo,\r\nC\'est tout c\'que t\'as trouvé\r\nPour te la rappeler.\r\nVous me trouvez un peu con,\r\nVous n\'aimez pas ma chanson,\r\nVous me croyez bizarre,\r\nUn peu patriotard,\r\nLe fruit de ma réflexion\r\nne touchera personne,\r\nSi vos pas ne résonnent\r\njamais dans ma région,\r\nC\'est pire qu\'une religion,\r\nAu-delà d\'une confession,\r\nJe l\'aime à en mourir,\r\nPour le meilleur et pour le pire.\r\nEt si je monte au ciel,\r\nIl y aura peut être Joel,\r\nGuillaume et Jeremy,\r\net mon cousin Piedri,\r\nYoan sera en voyage,\r\ndans un autre pays,\r\nAllez fais tes bagages,\r\nViens rejoindre tes amis:\r\nOn veut du Claudie musette,\r\nA en perdre la tête,\r\nOn veut un dernier chabrol,\r\nUn petit coup de niole,\r\nLes yeux de nos grands mères,\r\nLa voix de nos grands pères,\r\nL\'odeur de cette terre,\r\nVue sur les Monédières,\r\nC\'est pire qu\'un testament,\r\nAu delà d\'une confidence,\r\nOn est des petits enfants\r\nde ce joli coin de France.\r\nEnterrez nous vivants,\r\nBayonnez (bayonnais) s\'il le faut,\r\nMais prenez soin avant,\r\nDe remplir notre chapeau,\r\nLa relève est pour toi,\r\nnotre petit Lucas,\r\nOn t\'laisse en héritage la piste,\r\nNous on dégage.\r\nLe temps nous a gâté,\r\nOn en a bien profité,\r\nOn a des souvenirs en tête,\r\nCe soir, faisons la fête!\r\nAcceptez ma rengaine,\r\nElle veut juste \"je t\'aime\"\r\nSoyez surs, j\'en suis fier,\r\nJ\'ai la Corrèze dans l\'cathéter,\r\nD\'être avec vous ce soir,\r\nJ\'ai le coeur qui pétille,\r\nMimi sers nous à boire,\r\nOn a les yeux qui brillent...\r\n', 2019, 2, 4),
(13, 'taki taki', 18, 19, 20, 21, NULL, 'Wo-oh, oh-oh\r\nBáilame como si fuera la última vez\r\nY enséñame ese pasito que no sé\r\nUn besito bien suavecito, bebé\r\nTaki taki\r\nTaki taki, rumba\r\nWo-oh, oh-oh\r\nHi Music Hi Flow (DJ Snake!)\r\nBáilame como si fuera la última vez\r\nY enséñame ese pasito que no sé\r\nUn besito bien suavecito, bebé\r\nTaki taki\r\nTaki taki\r\nTaki taki, quieres un besito o un ñaqui\r\nBooty explota como Nagasaki\r\nPrende los motores, Kawasaki\r\nQue la disco está llena y llegaron los Anunnakis\r\nNo le baje, el booty sobresale de tu traje\r\nNo trajo pantiesito pa\' que el nene no trabaje\r\nEs que yo me sé lo que ella cree que ella se sabe\r\nCuenta que no quiere pero me tiene espionaje (eh-eh)\r\nEl booty sobresale de tu traje\r\nNo trajo pantiesito pa’ que el nene no trabaje\r\nEs que yo me sé lo que ella cree que ella se sabe\r\nCuenta que no quiere pero me tiene espionaje (eh-eh)\r\nBáilame como si fuera la última vez\r\nY enséñame ese pasito que no sé\r\nUn besito bien suavecito, bebé\r\nTaki taki\r\nTaki taki, rumba\r\nWo-oh, oh-oh\r\nHi Music Hi Flow\r\nBardi (Cardi)\r\nHe say he wanna touch it, and tease it, and squeeze it\r\nWhile my piggy bank is hungry, my nigga, you need to feed it\r\nIf the text ain\'t freaky, I don\'t wanna read it\r\nAnd just to let you know this punani is undefeated, ay\r\nHe say he really want to see me more\r\nI said we should have a date, where? At the Lamborghini store\r\nI’m kinda scary, hard to read, I\'m like a ouija board\r\nBut I\'ma boss, bitch, who you gonna leave me for?\r\nYou hoes got no class, you bitches is broke still\r\nI\'ll be talkin\' cash while I\'m poppin\' my gold grill (uh)\r\nI\'m a hoe, rich bitch and I work like I\'m broke still (Cardi)\r\nBut they love be so fake, but they hate be so real (uh)\r\nEl booty sobresale de mi traje\r\nNo traje pantiesito pa’ que el nene no trabaje\r\nEs que yo me sé lo que tú cree que tú no sabe\r\nDice que no quiere pero se quiere comer el equipaje\r\nBáilame como si fuera la última vez\r\nY enséñame ese pasito que no sé\r\nUn besito bien suavecito, bebé\r\nTaki taki\r\nTaki taki, rumba\r\nWo-oh, oh-oh\r\nDJ Snake\r\nCareful when you come through my way\r\nMy body already know how to play\r\nWork it, keep it tight every day\r\nAnd I, I, I know you need a taste\r\nWhen I ooh, you\'re fallin’ in love\r\nGive a little ooh-ooh, get it well done\r\nDancing on my ooh, make your girl wanna run\r\nWe keep moving ’til the sun come up\r\nPorque I am the party, yo soy fiesta\r\nBlow out your candles, have a siesta\r\nYou can try pero no one can stop me\r\nWhat my taki taki wants, yeah, my taki taki gets, uh\r\nBáilame como si fuera la última vez\r\nY enséñame ese pasito que no sé\r\nUn besito bien suavecito, bebé\r\nTaki taki\r\nTaki taki, rumba\r\nWo-oh, oh-oh\r\nHi Music Hi Flow\r\nTaki taki\r\nTaki taki', 2019, 4, 5),
(14, 'tiago', 22, NULL, NULL, NULL, NULL, 'Depuis qu’on est des mômes\r\nMon ami, on a ramé\r\nMais tant qu’on est des hommes\r\nLes rames je veux ranger\r\nSi te viennent des larmes\r\nViens donc me les donner\r\nLes gitans, les gitanes\r\nC’est pour ça qu’on est fait\r\nTiago, j’ai pris, le temps de t’écrire\r\nUne mélodie, en mille sourires\r\nTiago, j’ai mis le temps pour le dire\r\nMais mon ami, je suis là pour le pire\r\nQui se moque de toi\r\nSe moque aussi de moi\r\nDans vingt ans tu verras\r\nOn en rigolera\r\nSi ça part en bagarre\r\nOn jouera quatre mains\r\nLes gitans, les gitanes\r\nDieu nous donna des poings\r\nTiago, j’ai pris, le temps de t’écrire\r\nUne mélodie, en mille sourires\r\nTiago, j’ai mis le temps pour le dire\r\nMais mon ami, je suis là pour le pire\r\nMon ami mon ami mon ami, Tiago\r\nMon ami mon ami mon ami, Tiago\r\nMon ami mon ami mon ami, Tiago\r\nTiago\r\nLa copine qui part\r\nMais ne reviendra pas\r\nC’est du temps pour se voir, oui\r\nPour qu’on parle de toi\r\nSi ton cœur est en panne\r\nApporte-le dans l’heure\r\nLes gitans, les gitanes\r\nOn est bons bricoleurs\r\nTiago, j’ai pris, le temps de t’écrire\r\nUne mélodie, en mille sourires\r\nTiago, j’ai mis le temps pour le dire\r\nMais mon ami, Tiago\r\nTiago, j’ai pris, le temps de t’écrire\r\nUne mélodie, en mille sourires\r\nTiago, j’ai mis le temps pour le dire\r\nMais mon ami, je suis là pour le pire\r\nTiago\r\nTiago\r\nTiago\r\nTiago', 2019, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `chanteur`
--

DROP TABLE IF EXISTS `chanteur`;
CREATE TABLE IF NOT EXISTS `chanteur` (
  `id_chanteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_artiste` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `homme` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_chanteur`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chanteur`
--

INSERT INTO `chanteur` (`id_chanteur`, `nom_artiste`, `homme`) VALUES
(1, 'black m', 1),
(5, 'maitre gims ', 1),
(6, 'lady gaga', 0),
(7, 'bradley cooper', 1),
(8, 'alan walker', 0),
(9, 'sofia somajo', 0),
(10, 'calvin harris', 1),
(11, 'sam smith', 1),
(12, 'vitaa', 0),
(13, 'Slimane', 1),
(14, 'pink', 0),
(15, 'sia', 0),
(16, 'diplo', 1),
(17, 'trois cafés gourmands', 1),
(18, 'dj snake', 1),
(19, 'ozuna', 0),
(20, 'cardi b', 0),
(21, 'selena gomez', 0),
(22, 'kendji girac', 1);

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
CREATE TABLE IF NOT EXISTS `conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Question` varchar(255) DEFAULT NULL,
  `Reponse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conversation`
--

INSERT INTO `conversation` (`id`, `Question`, `Reponse`) VALUES
(2, 'bonjour', 'bonjour toi'),
(58, 'url base sur chatbot', 'http://www.ecouter-musique-gratuite.com/top-50-musiques-les-plus-ecoutees.php'),
(54, 'qui est tu?', 'je suis un chatbot'),
(55, 'fuck you', 'dumb ass'),
(56, 'quel est ton but?', 'c\'est de vous montrez un chanson des top 10 les plus ecoutez que vous voulez'),
(57, 'site concerne pour le bot', 'http://www.ecouter-musique-gratuite.com/top-50-musiques-les-plus-ecoutees.php'),
(53, 'bien', 'cool'),
(52, 'encule', 'toi meme'),
(51, 'ca va', 'bien et toi?'),
(59, 'notre prof c est qui?', 'Fabrice Lenoble'),
(60, 'ca va?', 'tres bien'),
(61, 'punaise', 'parole special de homer simpson'),
(62, 'pute', 'va te faire champoigner by bart simpson'),
(63, 'suce moi', 'fa te faire foutre'),
(64, 'suce moi la bite', 'va te faire foutre'),
(65, 'quel est ton but', 'http://www.ecouter-musique-gratuite.com/top-50-musiques-les-plus-ecoutees.php'),
(66, 'quel est votre but', 'http://www.ecouter-musique-gratuite.com/top-50-musiques-les-plus-ecoutees.php'),
(67, 'createur', 'Bien ce sont: Kanty,Mike,et Rockhaya'),
(68, 'createurs', 'Bien ce sont: Kanty,Mike,et Rockhaya'),
(69, 'je t aime', 'ah oui?'),
(70, 'je t adore', 'c est gentil'),
(71, 'putain', 'toi meme vieux');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id_type`, `nom_type`) VALUES
(1, 'POPY'),
(2, 'hip hop'),
(3, 'slow'),
(4, 'rock n roll'),
(5, 'rap');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
