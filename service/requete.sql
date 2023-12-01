---- Création de la table article

create table got_article(
    id int auto_increment primary key,
    numArticle varchar(20) not null,
    designation varchar(250),
    prixUnitaire decimal(10,2)
);
-- Insertion de données
insert into got_article (numArticle,designation,prixUnitaire) values
    ('BB0001','Biere castel 230ml',3.50),
    ('BB0002','Biere Pheonix 230ml',2.50),
    ('BJ0001','Jus d''ananas 1l',1.50),
    ('BV0001','Vin Listel gis 75cl',4.50);

--- connexion au serveur ovh
https://phpmyadmin-gra1.hosting.ovh.net 
serveur: lcjimyqcmfp.mysql.db
Utilisateur: lcjimyqcmfp0
Mot de passe: Developpeur2023

