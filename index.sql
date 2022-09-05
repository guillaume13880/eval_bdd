--Création de la base de données
CREATE DATABASE bdd_eval
    DEFAULT CHARACTER SET = 'utf8mb4';
--Connexion a la base
USE bdd_eval;
--CREATION TABLE ADMINS
CREATE TABLE IF NOT EXISTS admins (
    id_admin INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    pass_word CHAR(30) NOT NULL
);
INSERT INTO admins (firstname, lastname, pass_word) VALUES ('Jean', 'DUPONT', 'azerty');
INSERT INTO admins (firstname, lastname, pass_word) VALUES ('Jeanne', 'SMITCH', 'ytreza');

--CREATION TABLE CINEMAS AVEC RELATION
CREATE TABLE IF NOT EXISTS cinemas (
    id_cinema INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_cine VARCHAR(50) NOT NULL,
    address_cine VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    works_for INT NOT NULL,
    FOREIGN KEY (works_for) REFERENCES admins(id_admin)
);
INSERT INTO cinemas (name_cine, address_cine, city, works_for) VALUES ('Les Lumieres', '2 rue st andre', 'VITROLLES', '1');
INSERT INTO cinemas (name_cine, address_cine, city, works_for) VALUES ('Pathé', '54 rue du liere', 'ROGNAC', '2');
INSERT INTO cinemas (name_cine, address_cine, city, works_for) VALUES ('CGR', '21 rue st cyr', 'MARSEILLE', '1');

--CREATION TABLE DES UTILISATEURS
CREATE TABLE IF NOT EXISTS users (
    id_user INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    user_cine INT NOT NULL,
    FOREIGN KEY (user_cine) REFERENCES cinemas(id_cinema)
);
INSERT INTO users (firstname, lastname, age, user_cine) VALUES ('Marc', 'BILK', '31', '2');
INSERT INTO users (firstname, lastname, age, user_cine) VALUES ('Robert', 'CHYLOUA', '18', '1');
INSERT INTO users (firstname, lastname, age, user_cine) VALUES ('Sophie', 'TRIBRIA', '12', '3');


--CREATION TABLE FILMS
CREATE TABLE IF NOT EXISTS films (
    id_film INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title_film VARCHAR(50) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    auteur VARCHAR(50) NOT NULL,
    durée TIME NOT NULL
);
INSERT INTO films (title_film, genre, auteur, durée) VALUES ('les Minions 2 il etait une fois Gru', 'Action, comédie, Famille', 'Kyle Balda, Brad Ableson', '01:28:00');
INSERT INTO films (title_film, genre, auteur, durée) VALUES ('TOPGUN Maverick', 'Action', 'Joseph Kosinski', '02:11:00');
INSERT INTO films (title_film, genre, auteur, durée) VALUES ('Ducobu président!', 'Comédie', 'Elie Semoun', '01:26:00');


--CREATION TABLE DES SEANCES
CREATE TABLE IF NOT EXISTS seances (
    id_seance INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title_film VARCHAR(50) NOT NULL,
    date_seance DATETIME NOT NULL,
    nbplace INT NOT NULL,
    cine_dif INT NOT NULL,
    films_dif INT NOT NULL,
    FOREIGN KEY (cine_dif) REFERENCES cinemas(id_cinema),
    FOREIGN KEY (films_dif) REFERENCES films(id_film)
);
INSERT INTO seances (title_film, date_seance, nbplace, cine_dif, films_dif) VALUES ('TOPGUN Maverick', '2022-04-16 14:30:00', '48', '2', '2');
INSERT INTO seances (title_film, date_seance, nbplace, cine_dif, films_dif) VALUES ('les Minions 2 il etait une fois Gru', '2022-04-16 15:00:00', '40', '2', '1');
INSERT INTO seances (title_film, date_seance, nbplace, cine_dif, films_dif) VALUES ('Ducobu président!', '2022-04-16 16:00:00', '30', '1', '3');

--CREATION TABLE TARIFS
CREATE TABLE IF NOT EXISTS tarifs (
    id_tarif INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    description_promo VARCHAR(250) NOT NULL,
    price_plein FLOAT NOT NULL,
    price_etu FLOAT NOT NULL,
    price_14 FLOAT NOT NULL,
    seance_in INT NOT NULL,
    FOREIGN KEY (seance_in) REFERENCES seances(id_seance)
);
INSERT INTO tarifs (description_promo, price_plein, price_etu, price_14, seance_in) VALUES ('Nous proposons une offre pour les étudiants est les enfants de moins de 14 ans !', '11.20', '8.20', '5.90', '1');
INSERT INTO tarifs (description_promo, price_plein, price_etu, price_14, seance_in) VALUES ('Nous proposons une offre pour les étudiants est les enfants de moins de 14 ans !', '11.20', '8.20', '5.90', '2');
INSERT INTO tarifs (description_promo, price_plein, price_etu, price_14, seance_in) VALUES ('Nous proposons une offre pour les étudiants est les enfants de moins de 14 ans !', '11.20', '8.20', '5.90', '3');
-- CREATION d'un erreur sur la dernier insertion vue qu'il ny a que 3 seance qui peuvent contenir les tarifs la 4eme n'existe pas
INSERT INTO tarifs (description_promo, price_plein, price_etu, price_14, seance_in) VALUES ('Nous proposons une offre pour les étudiants est les enfants de moins de 14 ans !', '11.20', '8.20', '5.90', '4');