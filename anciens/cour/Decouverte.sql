-- Entrer dans ma base de donnée
mysql -u root -p

-- Afficher les noms des bdd existantes
show databases;

-- Créer ma bdd de nom dwwm
create database dwwm;

-- Entrer dans la bdd dwwm
use dwwm;
--ou
connect dwwm;

-- créer la table article
create table article(
id integer auto_increment primary key,
numArticle VARCHAR(20) not null UNIQUE,
designationArticle VARCHAR(250),
prixUniqueArticle NUMERIC(10,2));

-- Afficher la structure de la table article
desc article;
--ou 
describe article;

-- Insertion de données dans la table article
insert into article values
(null,  'BB001','Bière Castel','2.5'),
(null,  'BB002','Bière Fax','3.60'),
(null, 'BV001','Vin Gevraychambertin clôt de Bèze côte de nuit','350');

-- Inserer des données seulement sur les colonnes numArticle et designationArticle
insert into article (numArticle,designationArticle) values
('BB003','Bière Skool'),
('BB004','Bière HK');

-- Afficher le ontenu de la table article
select * from article;
--Afficher le contenu des colonnes id et numArticle
select id,numArticle from article;
-- Afficher toutes les bières
select * from article where numArticle like 'BB%';
-- Afficher les articles dont la designation contient le mot 'bière'
select * from article where designationArticle like '%bière%'; 
-- Afficher les articles dont l'id > 3
select * from article where id > 3;
-- Afficher les articles dont id vaux 1, 3 et 5
select * from article where id in (1,3,5);
-- Afficher les articles dont id entre 2 et 5
select * from article where id between 2 and 5;

-- Créer une table produit à partir de la table article (juste la structure)
create table produit like article;

-- Copier le contenu de la table article vers produit
insert into produit select * from article;

-- Supprimer la table product
drop table product;

-- Supprimer l'enregistrement dans numArticle=BB001
delete from produit where numArticle='BB001';

-- Supprimer dans la table produit toutes les bières
delete from produit where designationArticle like '%bière%';

-- Vider la table produit
delete from produit;

-- Requete numCommande, dateCommande, numClient, nomClient
select * from commande,client where commande.client_id=client.id;
-- ou
select * from commande cde, client clt where cde.client_id=clt.id;

-- Creation d'une view (création d'une table dynamique)
create view V_Commande_Client as 
select commande.numcommande, commande.dateComande, client.numClient, client.nomClient, client.adresseClient 
from commande,client 
where commande.client_id=client.id;

-- Afficher la creation de la view
show create table v_commande_client;

--creation de la view v_commande_commande
create view V_Commande_Commande as 
select numcommande as commande , dateCommande as date, numArticle as article, designationArticle as designation, prixUniqueArticle as pu, quantite as Q, prixUniqueArticle*quantite as montant
from commande,lignecommande,article 
where lignecommande.commande_id=commande.id and lignecommande.article_id=article.id;

create table t1(id int,valeur varchar(2));
insert into t1 values
(1,'a'),
(2,'b'),
(3,'c'),
(4,'d');

create table t2(id int,valeur varchar(2));
insert into t2 values
(2,'x'),
(4,'y'),
(6,'w'),
(8,'z');

-- Jointure sans condition ou cross join

select * from t1,t2;
--ou
select * from t1 cross join t2;

--avec ORDER
select * from t1,t2 order by t1.id asc;
--ou
select * from t1 cross join t2 order by t1.id asc;

----inner join
select * from t1,t2 where t1.id=t2.id;
--ou
select * from t1 inner join t2 on t1.id=t2.id;

----left join
select * from t1 left join t2 on t1.id =t2.id;

----left join with order (croissant par default)
select * from t1 left join t2 on t1.id =t2.id order by t1.id asc;

----left join with order (decroissant avec desc)
select * from t1 left join t2 on t1.id =t2.id order by t1.id desc;

---- right join
select * from t1 right join t2 on t1.id =t2.id order by t2.id;

---- full join
select * from t1 full join t2 on t1.id =t2.id;
-- ou
select * from t1 left join t2 on t1.id =t2.id
union
select * from t1 right join t2 on t1.id =t2.id;

-- Entrer dans ma base de donnée
mysql -u root -p 

-- Afficher les noms des bdd existantes
show databases;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+

-- Créer ma bdd de nom dwwm
create database dwwm;

Query OK, 1 row affected (0.001 sec)

-- Entrer dans la bdd dwwm
use dwwm;
--ou
connect dwwm;

MariaDB [(none)]> use dwwm;
Database changed
MariaDB [dwwm]>

-- créer la table article
create table article(id integer auto_increment primary key,
numArticle VARCHAR(20) not null UNIQUE,
designationArticle VARCHAR(250),
prixUniqueArticle NUMERIC(10,2));

Query OK, 0 rows affected (0.163 sec)

-- Afficher la structure de la table article
desc article;
--ou 
describe article;

+--------------------+---------------+------+-----+---------+----------------+
| Field              | Type          | Null | Key | Default | Extra          |
+--------------------+---------------+------+-----+---------+----------------+
| id                 | int(11)       | NO   | PRI | NULL    | auto_increment |
| numArticle         | varchar(20)   | NO   | UNI | NULL    |                |
| designationArticle | varchar(250)  | YES  |     | NULL    |                |
| prixUniqueArticle  | decimal(10,2) | YES  |     | NULL    |                |
+--------------------+---------------+------+-----+---------+----------------+

-- Insertion de données dans la table article
insert into article values
(null,  'BB001','Bière Castel','2.5'),
(null,  'BB002','Bière Fax','3.60'),
(null, 'BV001','Vin Gevraychambertin clôt de Bèze côte de nuit','350');

-- Inserer des données seulement sur les colonnes numArticle et designationArticle
insert into article (numArticle,designationArticle) values
('BB003','Bière Skool'),
('BB004','Bière HK');

Query OK, 2 rows affected (0.045 sec)
Records: 2  Duplicates: 0  Warnings: 0

-- Afficher le ontenu de la table article
select * from article;

+----+------------+------------------------------------------------+-------------------+
| id | numArticle | designationArticle                             | prixUniqueArticle |
+----+------------+------------------------------------------------+-------------------+
|  1 | BB001      | Bière Castel                                   |              2.50 |
|  2 | BB002      | Bière Fax                                      |              3.60 |
|  3 | BV001      | Vin Gevraychambertin clôt de Bèze côte de nuit |            350.00 |
|  4 | BB003      | Bière Skool                                    |              NULL |
|  5 | BB004      | Bière HK                                       |              NULL |
+----+------------+------------------------------------------------+-------------------+

--Afficher le contenu des colonnes id et numArticle
select id,numArticle from article;

+----+------------+
| id | numArticle |
+----+------------+
|  1 | BB001      |
|  2 | BB002      |
|  4 | BB003      |
|  5 | BB004      |
|  3 | BV001      |
+----+------------+

-- Afficher toutes les bières
select * from article where numArticle like 'BB%';

+----+------------+--------------------+-------------------+
| id | numArticle | designationArticle | prixUniqueArticle |
+----+------------+--------------------+-------------------+
|  1 | BB001      | Bière Castel       |              2.50 |
|  2 | BB002      | Bière Fax          |              3.60 |
|  4 | BB003      | Bière Skool        |              NULL |
|  5 | BB004      | Bière HK           |              NULL |
+----+------------+--------------------+-------------------+

-- Afficher les articles dont la designation contient le mot 'bière'
select * from article where designationArticle like '%bière%'; 

+----+------------+--------------------+-------------------+
| id | numArticle | designationArticle | prixUniqueArticle |
+----+------------+--------------------+-------------------+
|  1 | BB001      | Bière Castel       |              2.50 |
|  2 | BB002      | Bière Fax          |              3.60 |
|  4 | BB003      | Bière Skool        |              NULL |
|  5 | BB004      | Bière HK           |              NULL |
+----+------------+--------------------+-------------------+

-- Afficher les articles dont l'id > 3
select * from article where id > 3;

+----+------------+--------------------+-------------------+
| id | numArticle | designationArticle | prixUniqueArticle |
+----+------------+--------------------+-------------------+
|  4 | BB003      | Bière Skool        |              NULL |
|  5 | BB004      | Bière HK           |              NULL |
+----+------------+--------------------+-------------------+

-- Afficher les articles dont id vaux 1, 3 et 5
select * from article where id in (1,3,5);

+----+------------+------------------------------------------------+-------------------+
| id | numArticle | designationArticle                             | prixUniqueArticle |
+----+------------+------------------------------------------------+-------------------+
|  1 | BB001      | Bière Castel                                   |              2.50 |
|  3 | BV001      | Vin Gevraychambertin clôt de Bèze côte de nuit |            350.00 |
|  5 | BB004      | Bière HK                                       |              NULL |
+----+------------+------------------------------------------------+-------------------+

-- Afficher les articles dont id entre 2 et 5
select * from article where id between 2 and 5;

+----+------------+------------------------------------------------+-------------------+
| id | numArticle | designationArticle                             | prixUniqueArticle |
+----+------------+------------------------------------------------+-------------------+
|  2 | BB002      | Bière Fax                                      |              3.60 |
|  3 | BV001      | Vin Gevraychambertin clôt de Bèze côte de nuit |            350.00 |
|  4 | BB003      | Bière Skool                                    |              NULL |
|  5 | BB004      | Bière HK                                       |              NULL |
+----+------------+------------------------------------------------+-------------------+

-- Créer une table produit à partir de la table article (juste la structure)
create table produit like article;

Query OK, 0 rows affected (0.145 sec)

-- Copier le contenu de la table article vers produit
insert into produit select * from article;

Query OK, 5 rows affected (0.058 sec)
Records: 5  Duplicates: 0  Warnings: 0

-- Supprimer la table product
drop table product;

-- Supprimer l'enregistrement dans numArticle=BB001
delete from produit where numArticle='BB001';

Query OK, 1 row affected (0.048 sec)

MariaDB [dwwm]> select * from produit;
+----+------------+------------------------------------------------+-------------------+
| id | numArticle | designationArticle                             | prixUniqueArticle |
+----+------------+------------------------------------------------+-------------------+
|  2 | BB002      | Bière Fax                                      |              3.60 |
|  3 | BV001      | Vin Gevraychambertin clôt de Bèze côte de nuit |            350.00 |
|  4 | BB003      | Bière Skool                                    |              NULL |
|  5 | BB004      | Bière HK                                       |              NULL |
+----+------------+------------------------------------------------+-------------------+

-- Supprimer dans la table produit toutes les bières
delete from produit where designationArticle like '%bière%';

Query OK, 3 rows affected (0.033 sec)

MariaDB [dwwm]> select * from produit;
+----+------------+------------------------------------------------+-------------------+
| id | numArticle | designationArticle                             | prixUniqueArticle |
+----+------------+------------------------------------------------+-------------------+
|  3 | BV001      | Vin Gevraychambertin clôt de Bèze côte de nuit |            350.00 |
+----+------------+------------------------------------------------+-------------------+

-- Vider la table produit
delete from produit;

Query OK, 1 row affected (0.037 sec)

MariaDB [dwwm]> select * from produit;
Empty set (0.001 sec)

-- Inserer à nouveau des données dans la table produit
insert into produit (numArticle,designationArticle,prixUniqueArticle) values
('bj00128','Ju d''orange','2.7'),
('BA128600','Rhum charette','15');

Query OK, 2 rows affected (0.089 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [dwwm]> select * from produit
    -> ;
+----+------------+--------------------+-------------------+
| id | numArticle | designationArticle | prixUniqueArticle |
+----+------------+--------------------+-------------------+
|  6 | bj00128    | Ju d''orange        |              2.70 |
|  7 | BA128600   | Rhum charette      |             15.00 |
+----+------------+--------------------+-------------------+

-- On a remarquer que id continue à s'incrémenter à partir de sa dernière valeur
-- Vider la table produit tout en réinitialisant l'id à 1
truncate table produit;

-- Création de la table commande
create table commande (
    id int auto_increment primary key,
    numcommande varchar(250) not null unique,
    dateComande datetime default now(),
    client_id int not null,
    foreign key(client_id) references client(id)
);
-- -- foreign key permet de ne saisir que les valeurs des id de la table client 

-- Insertion de donnée dans la table commande en testant la clause default
insert into commande (numCommande,client_id) values
('CDE00125','1');

Query OK, 1 row affected (0.047 sec)

MariaDB [dwwm]> select * from commande;
+----+-------------+---------------------+-----------+
| id | numcommande | dateComande         | client_id |
+----+-------------+---------------------+-----------+
|  1 | CDE00125    | 2023-11-10 10:04:02 |         1 |
+----+-------------+---------------------+-----------+

-- Test sur foreign key (on va donner une valeur à client_id qui n'appartient pas à la table
-- client)
insert into commande (numCommande,client_id) values
('CDE00126','10');

ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`dwwm`.`commande`, CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`))

-- Test sur l'unicité de la colonne numCommande
-- C'est à dire saisie une nouvelle ligne dont numCommande existe déjà
insert into commande (numCommande,client_id) values
('CDE00125','4');

MariaDB [dwwm]> insert into commande (numCommande,client_id) values
    -> ('CDE00125','4');
ERROR 1062 (23000): Duplicate entry 'CDE00125' for key 'numcommande'

-- Saisie de données avec dateCommande manuelle
insert into commande (numCommande,dateComande,client_id) values('CDE00127','2023-01-10',1),
('CDE00321','2023-02-10',2),
('CDE00522','2023-03-10',3);

Query OK, 3 rows affected (0.073 sec)
Records: 3  Duplicates: 0  Warnings: 0

-- Requete numCommande, dateCommande, numClient, nomClient
select * from commande,client where commande.client_id=client.id;
-- ou
select * from commande cde, client clt where cde.client_id=clt.id;

+----+-------------+---------------------+-----------+----+-----------+-----------------+------------------------------------------+
| id | numcommande | dateComande         | client_id | id | numClient | nomClient       | adresseClient                            |
+----+-------------+---------------------+-----------+----+-----------+-----------------+------------------------------------------+
|  1 | CDE00125    | 2023-11-10 10:04:02 |         1 |  1 | JA001     | Jamel Azouhri   | 1 rue des colombe 33310 LORMONT          |
|  4 | CDE00127    | 2023-01-10 00:00:00 |         1 |  1 | JA001     | Jamel Azouhri   | 1 rue des colombe 33310 LORMONT          |
|  5 | CDE00321    | 2023-02-10 00:00:00 |         2 |  2 | GT001     | Timothée Gobert | 7 rue du petit huis 89510 VERON          |
|  6 | CDE00522    | 2023-03-10 00:00:00 |         3 |  3 | YT001     | Yanick Thomson  | 159B route de fleuri 91170 VIRYCHATILLON |
+----+-------------+---------------------+-----------+----+-----------+-----------------+------------------------------------------+

select commande.numcommande, commande.dateComande, client.numClient, client.nomClient, client.adresseClient 
from commande,client 
where commande.client_id=client.id;

+-------------+---------------------+-----------+-----------------+------------------------------------------+
| numcommande | dateComande         | numClient | nomClient       | adresseClient                            |
+-------------+---------------------+-----------+-----------------+------------------------------------------+
| CDE00125    | 2023-11-10 10:04:02 | JA001     | Jamel Azouhri   | 1 rue des colombe 33310 LORMONT          |
| CDE00127    | 2023-01-10 00:00:00 | JA001     | Jamel Azouhri   | 1 rue des colombe 33310 LORMONT          |
| CDE00321    | 2023-02-10 00:00:00 | GT001     | Timothée Gobert | 7 rue du petit huis 89510 VERON          |
| CDE00522    | 2023-03-10 00:00:00 | YT001     | Yanick Thomson  | 159B route de fleuri 91170 VIRYCHATILLON |
+-------------+---------------------+-----------+-----------------+------------------------------------------+

-- Creation d'une view (création d'une table dynamique)
create view V_Commande_Client as 
select commande.numcommande, commande.dateComande, client.numClient, client.nomClient, client.adresseClient 
from commande,client 
where commande.client_id=client.id;

Query OK, 0 rows affected (0.031 sec)

MariaDB [dwwm]> show tables;
+-------------------+
| Tables_in_dwwm    |
+-------------------+
| article           |
| client            |
| commande          |
| produit           |
| v_commande_client |
+-------------------+

MariaDB [dwwm]> select * from v_cOmMande_cLient;
+-------------+---------------------+-----------+-----------------+------------------------------------------+
| numcommande | dateComande         | numClient | nomClient       | adresseClient                            |
+-------------+---------------------+-----------+-----------------+------------------------------------------+
| CDE00125    | 2023-11-10 10:04:02 | JA001     | Jamel Azouhri   | 1 rue des colombe 33310 LORMONT          |
| CDE00127    | 2023-01-10 00:00:00 | JA001     | Jamel Azouhri   | 1 rue des colombe 33310 LORMONT          |
| CDE00321    | 2023-02-10 00:00:00 | GT001     | Timothée Gobert | 7 rue du petit huis 89510 VERON          |
| CDE00522    | 2023-03-10 00:00:00 | YT001     | Yanick Thomson  | 159B route de fleuri 91170 VIRYCHATILLON |
+-------------+---------------------+-----------+-----------------+------------------------------------------+

-- Afficher la creation de la view
show create table v_commande_client;

+-------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| View              | Create View                                                                                                                                                                                                                                                                                                                                                                                        | character_set_client | collation_connection |
+-------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| v_commande_client | CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_commande_client` AS select `commande`.`numcommande` AS `numcommande`,`commande`.`dateComande` AS `dateComande`,`client`.`numClient` AS `numClient`,`client`.`nomClient` AS `nomClient`,`client`.`adresseClient` AS `adresseClient` from (`commande` join `client`) where `commande`.`client_id` = `client`.`id` | cp850                | cp850_general_ci     |
+-------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+

-- Création de la table ligneCommande
create table ligneCommande (
    id int auto_increment primary key,
    commande_id int not null,
    article_id int not null,
    quantite numeric(10,2) not null,
    foreign key(commande_id) references commande(id),
    foreign key(article_id) references article(id)
);

-- Afficher commande
select*from commande;

+----+-------------+---------------------+-----------+
| id | numcommande | dateCommande        | client_id |
+----+-------------+---------------------+-----------+
|  1 | CDE00125    | 2023-11-10 10:04:02 |         1 |
|  4 | CDE00127    | 2023-01-10 00:00:00 |         1 |
|  5 | CDE00321    | 2023-02-10 00:00:00 |         2 |
|  6 | CDE00522    | 2023-03-10 00:00:00 |         3 |
+----+-------------+---------------------+-----------+

-- Afficher article
select*from article;

+----+------------+------------------------------------------------+-------------------+
| id | numArticle | designationArticle                             | prixUniqueArticle |
+----+------------+------------------------------------------------+-------------------+
|  1 | BB001      | Bière Castel                                   |              2.50 |
|  2 | BB002      | Bière Fax                                      |              3.60 |
|  3 | BV001      | Vin Gevraychambertin clôt de Bèze côte de nuit |            350.00 |
|  4 | BB003      | Bière Skool                                    |              NULL |
|  5 | BB004      | Bière HK                                       |              NULL |
+----+------------+------------------------------------------------+-------------------+

-- Inserer ligne dans ligneCommande
insert into lignecommande(commande_id,article_id,quantite) values
(1,1,26),
(1,2,28),
(1,5,2),
(4,1,29),
(4,3,6),
(5,4,10),
(5,5,6),
(5,2,12),
(6,5,60);

select * from lignecommande;
+----+-------------+------------+----------+
| id | commande_id | article_id | quantite |
+----+-------------+------------+----------+
|  1 |           1 |          1 |     5.00 |
|  2 |           1 |          1 |    26.00 |
|  3 |           1 |          2 |    28.00 |
|  4 |           1 |          5 |     2.00 |
|  5 |           4 |          1 |    29.00 |
|  6 |           4 |          3 |     6.00 |
|  7 |           5 |          4 |    10.00 |
|  8 |           5 |          5 |     6.00 |
|  9 |           5 |          2 |    12.00 |
| 10 |           6 |          5 |    60.00 |
+----+-------------+------------+----------+

select commande.numcommande, commande.dateCommande, article.numArticle, article.designationArticle, article.prixUniqueArticle, lignecommande.quantite, prixUniqueArticle*quantite
from commande,lignecommande,article 
where lignecommande.commande_id=commande.id and lignecommande.article_id=article.id;

+-------------+---------------------+------------+------------------------------------------------+-------------------+----------+----------------------------+
| numcommande | dateCommande        | numArticle | designationArticle                             | prixUniqueArticle | quantite | prixUniqueArticle*quantite |
+-------------+---------------------+------------+------------------------------------------------+-------------------+----------+----------------------------+
| CDE00125    | 2023-11-10 10:04:02 | BB001      | Bière Castel                                   |              2.50 |     5.00 |                    12.5000 |
| CDE00125    | 2023-11-10 10:04:02 | BB001      | Bière Castel                                   |              2.50 |    26.00 |                    65.0000 |
| CDE00125    | 2023-11-10 10:04:02 | BB002      | Bière Fax                                      |              3.60 |    28.00 |                   100.8000 |
| CDE00125    | 2023-11-10 10:04:02 | BB004      | Bière HK                                       |              NULL |     2.00 |                       NULL |
| CDE00127    | 2023-01-10 00:00:00 | BB001      | Bière Castel                                   |              2.50 |    29.00 |                    72.5000 |
| CDE00127    | 2023-01-10 00:00:00 | BV001      | Vin Gevraychambertin clôt de Bèze côte de nuit |            350.00 |     6.00 |                  2100.0000 |
| CDE00321    | 2023-02-10 00:00:00 | BB003      | Bière Skool                                    |              NULL |    10.00 |                       NULL |
| CDE00321    | 2023-02-10 00:00:00 | BB004      | Bière HK                                       |              NULL |     6.00 |                       NULL |
| CDE00321    | 2023-02-10 00:00:00 | BB002      | Bière Fax                                      |              3.60 |    12.00 |                    43.2000 |
| CDE00522    | 2023-03-10 00:00:00 | BB004      | Bière HK                                       |              NULL |    60.00 |                       NULL |
+-------------+---------------------+------------+------------------------------------------------+-------------------+----------+----------------------------+

select numcommande as commande , dateCommande as date, numArticle as article, designationArticle as designation, prixUniqueArticle as pu, quantite as Q, prixUniqueArticle*quantite as montant
from commande,lignecommande,article 
where lignecommande.commande_id=commande.id and lignecommande.article_id=article.id;

+----------+---------------------+---------+------------------------------------------------+--------+-------+-----------+
| commande | date                | article | designation                                    | pu     | Q     | montant   |
+----------+---------------------+---------+------------------------------------------------+--------+-------+-----------+
| CDE00125 | 2023-11-10 10:04:02 | BB001   | Bière Castel                                   |   2.50 |  5.00 |   12.5000 |
| CDE00125 | 2023-11-10 10:04:02 | BB001   | Bière Castel                                   |   2.50 | 26.00 |   65.0000 |
| CDE00125 | 2023-11-10 10:04:02 | BB002   | Bière Fax                                      |   3.60 | 28.00 |  100.8000 |
| CDE00125 | 2023-11-10 10:04:02 | BB004   | Bière HK                                       |   NULL |  2.00 |      NULL |
| CDE00127 | 2023-01-10 00:00:00 | BB001   | Bière Castel                                   |   2.50 | 29.00 |   72.5000 |
| CDE00127 | 2023-01-10 00:00:00 | BV001   | Vin Gevraychambertin clôt de Bèze côte de nuit | 350.00 |  6.00 | 2100.0000 |
| CDE00321 | 2023-02-10 00:00:00 | BB003   | Bière Skool                                    |   NULL | 10.00 |      NULL |
| CDE00321 | 2023-02-10 00:00:00 | BB004   | Bière HK                                       |   NULL |  6.00 |      NULL |
| CDE00321 | 2023-02-10 00:00:00 | BB002   | Bière Fax                                      |   3.60 | 12.00 |   43.2000 |
| CDE00522 | 2023-03-10 00:00:00 | BB004   | Bière HK                                       |   NULL | 60.00 |      NULL |
+----------+---------------------+---------+------------------------------------------------+--------+-------+-----------+
-- ici as permet de renommer la colonne 
-- et si le nom de la colonne est unique pas besoin de préciser la table dans laquelle elle se trouve

--creation de la view v_commande_commande
create view V_Commande_Commande as 
select numcommande as commande , dateCommande as date, numArticle as article, designationArticle as designation, prixUniqueArticle as pu, quantite as Q, prixUniqueArticle*quantite as montant
from commande,lignecommande,article 
where lignecommande.commande_id=commande.id and lignecommande.article_id=article.id;

show tables;
+---------------------+
| Tables_in_dwwm      |
+---------------------+
| article             |
| client              |
| commande            |
| lignecommande       |
| produit             |
| v_commande_client   |
| v_commande_commande |
+---------------------+


select 
 numclient as Client ,
 numcommande as commande, 
 numArticle as article, 
 designationArticle as designation, 
 prixUniqueArticle as pu, 
 quantite as qte, 
 prixUniqueArticle*quantite as montant
from 
 client,
 commande,
 lignecommande,
 article 
where 
 lignecommande.commande_id=commande.id 
 and lignecommande.article_id=article.id 
 and commande.client_id=client.id;

+--------+----------+---------+------------------------------------------------+--------+-------+-----------+
| Client | commande | article | designation                                    | pu     | qte   | montant   |
+--------+----------+---------+------------------------------------------------+--------+-------+-----------+
| JA001  | CDE00125 | BB001   | Bière Castel                                   |   2.50 |  5.00 |   12.5000 |
| JA001  | CDE00125 | BB001   | Bière Castel                                   |   2.50 | 26.00 |   65.0000 |
| JA001  | CDE00125 | BB002   | Bière Fax                                      |   3.60 | 28.00 |  100.8000 |
| JA001  | CDE00125 | BB004   | Bière HK                                       |   NULL |  2.00 |      NULL |
| JA001  | CDE00127 | BB001   | Bière Castel                                   |   2.50 | 29.00 |   72.5000 |
| JA001  | CDE00127 | BV001   | Vin Gevraychambertin clôt de Bèze côte de nuit | 350.00 |  6.00 | 2100.0000 |
| GT001  | CDE00321 | BB003   | Bière Skool                                    |   NULL | 10.00 |      NULL |
| GT001  | CDE00321 | BB004   | Bière HK                                       |   NULL |  6.00 |      NULL |
| GT001  | CDE00321 | BB002   | Bière Fax                                      |   3.60 | 12.00 |   43.2000 |
| YT001  | CDE00522 | BB004   | Bière HK                                       |   NULL | 60.00 |      NULL |
+--------+----------+---------+------------------------------------------------+--------+-------+-----------+

create table t1(id int,valeur varchar(2));
insert into t1 values
(1,'a'),
(2,'b'),
(3,'c'),
(4,'d');

create table t2(id int,valeur varchar(2));
insert into t2 values
(2,'x'),
(4,'y'),
(6,'w'),
(8,'z');

-- Jointure sans condition ou cross join

select * from t1,t2;
--ou
select * from t1 cross join t2;

+------+--------+------+--------+
| id   | valeur | id   | valeur |
+------+--------+------+--------+
|    1 | a      |    2 | x      |
|    2 | b      |    2 | x      |
|    3 | c      |    2 | x      |
|    4 | d      |    2 | x      |
|    1 | a      |    4 | y      |
|    2 | b      |    4 | y      |
|    3 | c      |    4 | y      |
|    4 | d      |    4 | y      |
|    1 | a      |    6 | w      |
|    2 | b      |    6 | w      |
|    3 | c      |    6 | w      |
|    4 | d      |    6 | w      |
|    1 | a      |    8 | z      |
|    2 | b      |    8 | z      |
|    3 | c      |    8 | z      |
|    4 | d      |    8 | z      |
+------+--------+------+--------+

--avec ORDER
select * from t1,t2 order by t1.id asc;
--ou
select * from t1 cross join t2 order by t1.id asc;

+------+--------+------+--------+
| id   | valeur | id   | valeur |
+------+--------+------+--------+
|    1 | a      |    2 | x      |
|    1 | a      |    6 | w      |
|    1 | a      |    4 | y      |
|    1 | a      |    8 | z      |
|    2 | b      |    2 | x      |
|    2 | b      |    6 | w      |
|    2 | b      |    4 | y      |
|    2 | b      |    8 | z      |
|    3 | c      |    2 | x      |
|    3 | c      |    6 | w      |
|    3 | c      |    4 | y      |
|    3 | c      |    8 | z      |
|    4 | d      |    4 | y      |
|    4 | d      |    8 | z      |
|    4 | d      |    2 | x      |
|    4 | d      |    6 | w      |
+------+--------+------+--------+

----inner join
select * from t1,t2 where t1.id=t2.id;
--ou
select * from t1 inner join t2 on t1.id=t2.id;

+------+--------+------+--------+
| id   | valeur | id   | valeur |
+------+--------+------+--------+
|    2 | b      |    2 | x      |
|    4 | d      |    4 | y      |
+------+--------+------+--------+

----left join
select * from t1 left join t2 on t1.id =t2.id;

+------+--------+------+--------+
| id   | valeur | id   | valeur |
+------+--------+------+--------+
|    2 | b      |    2 | x      |
|    4 | d      |    4 | y      |
|    1 | a      | NULL | NULL   |
|    3 | c      | NULL | NULL   |
+------+--------+------+--------+

----left join with order (croissant par default)
select * from t1 left join t2 on t1.id =t2.id order by t1.id asc;

+------+--------+------+--------+
| id   | valeur | id   | valeur |
+------+--------+------+--------+
|    1 | a      | NULL | NULL   |
|    2 | b      |    2 | x      |
|    3 | c      | NULL | NULL   |
|    4 | d      |    4 | y      |
+------+--------+------+--------+


----left join with order (decroissant avec desc)
select * from t1 left join t2 on t1.id =t2.id order by t1.id desc;

+------+--------+------+--------+
| id   | valeur | id   | valeur |
+------+--------+------+--------+
|    4 | d      |    4 | y      |
|    3 | c      | NULL | NULL   |
|    2 | b      |    2 | x      |
|    1 | a      | NULL | NULL   |
+------+--------+------+--------+

---- right join
select * from t1 right join t2 on t1.id =t2.id order by t2.id;

+------+--------+------+--------+
| id   | valeur | id   | valeur |
+------+--------+------+--------+
|    2 | b      |    2 | x      |
|    4 | d      |    4 | y      |
| NULL | NULL   |    6 | w      |
| NULL | NULL   |    8 | z      |
+------+--------+------+--------+

---- full join
select * from t1 full join t2 on t1.id =t2.id;
-- ou
select * from t1 left join t2 on t1.id =t2.id
union
select * from t1 right join t2 on t1.id =t2.id;

+------+--------+------+--------+
| id   | valeur | id   | valeur |
+------+--------+------+--------+
|    2 | b      |    2 | x      |
|    4 | d      |    4 | y      |
|    1 | a      | NULL | NULL   |
|    3 | c      | NULL | NULL   |
| NULL | NULL   |    6 | w      |
| NULL | NULL   |    8 | z      |
+------+--------+------+--------+

--rajout de client
insert into client (numClient,nomClient,adresseClient) values
('SIX1258','Bernard Soubiroux','Rennes'),
('GTR1259','Paul Gauthier','La Rochelle'),
('SUE1008','Ruth Sauce','Dijon'),
('BTO1000','Jean-Pierre Boto','Nantes');


--sujet 2

select
 numcommande as "N° Commande", 
 dateCommande as "Date Commande", 
 nomClient as "Nom Client",
 adresseClient as "Adresse Client"
from 
 client
  left join
 commande
on
 commande.client_id=client.id;

+-------------+---------------------+-------------------+------------------------------------------+
| N? Commande | Date Commande       | Nom Client        | Adresse Client                           |
+-------------+---------------------+-------------------+------------------------------------------+
| CDE00125    | 2023-11-10 10:04:02 | Jamel Azouhri     | 1 rue des colombe 33310 LORMONT          |
| CDE00127    | 2023-01-10 00:00:00 | Jamel Azouhri     | 1 rue des colombe 33310 LORMONT          |
| CDE00321    | 2023-02-10 00:00:00 | Timoth├®e Gobert   | 7 rue du petit huis 89510 VERON          |
| CDE00522    | 2023-03-10 00:00:00 | Yanick Thomson    | 159B route de fleuri 91170 VIRYCHATILLON |
| NULL        | NULL                | Bernard Soubiroux | Rennes                                   |
| NULL        | NULL                | Paul Gauthier     | La Rochelle                              |
| NULL        | NULL                | Ruth Sauce        | Dijon                                    |
| NULL        | NULL                | Jean-Pierre Boto  | Nantes                                   |
+-------------+---------------------+-------------------+------------------------------------------+

--remplacer les valeur null

select
 coalesce(numcommande,'jamais passer de commande') as "N° Commande", 
 coalesce(dateCommande,"") as "Date Commande", 
 nomClient as "Nom Client",
 adresseClient as "Adresse Client"
from 
 client left join commande
  on commande.client_id=client.id;

-- création de requete en 2 étape
---1ere etape créer une view intermediaire
create view v_cde_client_01 as
    select numCommande,dateCommande,nomClient,adresseClient
    from commande,client 
    where commande.client_id=client.id;

+-------------+---------------------+------------------+------------------------------------------+
| numCommande | dateCommande        | nomClient        | adresseClient                            |
+-------------+---------------------+------------------+------------------------------------------+
| CDE00125    | 2023-11-10 10:04:02 | Jamel Azouhri    | 1 rue des colombe 33310 LORMONT          |
| CDE00127    | 2023-01-10 00:00:00 | Jamel Azouhri    | 1 rue des colombe 33310 LORMONT          |
| CDE00321    | 2023-02-10 00:00:00 | Timoth├®e Gobert  | 7 rue du petit huis 89510 VERON          |
| CDE00522    | 2023-03-10 00:00:00 | Yanick Thomson   | 159B route de fleuri 91170 VIRYCHATILLON |
+-------------+---------------------+------------------+------------------------------------------+

---2eme etape rattacher clinet avec v_cde_client_01 via une kinture left sur nomClient
select numCommande,dateCommande,client.nomClient,Client.adresseClient
from client left join v_cde_client_01 on client.nomClient=v_cde_client_01.nomClient;
+-------------+---------------------+-------------------+------------------------------------------+
| numCommande | dateCommande        | nomClient         | adresseClient                            |
+-------------+---------------------+-------------------+------------------------------------------+
| CDE00125    | 2023-11-10 10:04:02 | Jamel Azouhri     | 1 rue des colombe 33310 LORMONT          |
| CDE00127    | 2023-01-10 00:00:00 | Jamel Azouhri     | 1 rue des colombe 33310 LORMONT          |
| CDE00321    | 2023-02-10 00:00:00 | Timoth├®e Gobert   | 7 rue du petit huis 89510 VERON          |
| CDE00522    | 2023-03-10 00:00:00 | Yanick Thomson    | 159B route de fleuri 91170 VIRYCHATILLON |
| NULL        | NULL                | Bernard Soubiroux | Rennes                                   |
| NULL        | NULL                | Paul Gauthier     | La Rochelle                              |
| NULL        | NULL                | Ruth Sauce        | Dijon                                    |
| NULL        | NULL                | Jean-Pierre Boto  | Nantes                                   |
+-------------+---------------------+-------------------+------------------------------------------+
---créer des alias au nom des tables
select 
numCommande,
dateCommande,
c.nomClient,
c.adresseClient
from 
client as c left join v_cde_client_01 as v 
on c.nomClient=v.nomClient;
--- avec l'alias on peu ignorer le as 
select 
v.numCommande,
v.dateCommande,
c.nomClient,
c.adresseClient
from 
client  c left join v_cde_client_01  v 
on c.nomClient=v.nomClient;

-- éviter les dépendance sur les view intermaidiaire
--- 1 mettre la view entre parenthèse
select 
v.numCommande,
v.dateCommande,
c.nomClient,
c.adresseClient
from 
client  c left join (v_cde_client_01)  v 
on c.nomClient=v.nomClient;
--- 2 remplacer son nom dans les () par sa requete
select 
v.numCommande,
v.dateCommande,
c.nomClient,
c.adresseClient
from 
client  c left join (
    select numCommande,dateCommande,nomClient,adresseClient
    from commande,client 
    where commande.client_id=client.id
)  v 
on c.nomClient=v.nomClient;


 -- sujet 3

 select 
 numclient as Client,
 nomClient as Nom,
 numcommande as Commande,
 dateCommande as Date,
 numArticle as article, 
 designationArticle as designation,
 quantite as qte, 
 prixUniqueArticle*quantite as montant
from 
 client
 left join
 commande
 on 
 commande.client_id=client.id
 left join
 lignecommande
 On
 lignecommande.commande_id=commande.id
 left join
 article 
on 
lignecommande.article_id=article.id
 ;

+---------+-------------------+----------+---------------------+---------+---------------------------------------------------+-------+-----------+
| Client  | Nom               | Commande | Date                | article | designation                                       | qte   | montant   |
+---------+-------------------+----------+---------------------+---------+---------------------------------------------------+-------+-----------+
| JA001   | Jamel Azouhri     | CDE00125 | 2023-11-10 10:04:02 | BB001   | Bi├¿re Castel                                      |  5.00 |   12.5000 |
| JA001   | Jamel Azouhri     | CDE00125 | 2023-11-10 10:04:02 | BB001   | Bi├¿re Castel                                      | 26.00 |   65.0000 |
| JA001   | Jamel Azouhri     | CDE00125 | 2023-11-10 10:04:02 | BB002   | Bi├¿re Fax                                         | 28.00 |  100.8000 |
| JA001   | Jamel Azouhri     | CDE00125 | 2023-11-10 10:04:02 | BB004   | Bi├¿re HK                                          |  2.00 |      NULL |
| JA001   | Jamel Azouhri     | CDE00127 | 2023-01-10 00:00:00 | BB001   | Bi├¿re Castel                                      | 29.00 |   72.5000 |
| JA001   | Jamel Azouhri     | CDE00127 | 2023-01-10 00:00:00 | BV001   | Vin Gevraychambertin cl├┤t de B├¿ze c├┤te de nuit    |  6.00 | 2100.0000 |
| GT001   | Timoth├®e Gobert   | CDE00321 | 2023-02-10 00:00:00 | BB003   | Bi├¿re Skool                                       | 10.00 |      NULL |
| GT001   | Timoth├®e Gobert   | CDE00321 | 2023-02-10 00:00:00 | BB004   | Bi├¿re HK                                          |  6.00 |      NULL |
| GT001   | Timoth├®e Gobert   | CDE00321 | 2023-02-10 00:00:00 | BB002   | Bi├¿re Fax                                         | 12.00 |   43.2000 |
| YT001   | Yanick Thomson    | CDE00522 | 2023-03-10 00:00:00 | BB004   | Bi├¿re HK                                          | 60.00 |      NULL |
| SIX1258 | Bernard Soubiroux | NULL     | NULL                | NULL    | NULL                                              |  NULL |      NULL |
| GTR1259 | Paul Gauthier     | NULL     | NULL                | NULL    | NULL                                              |  NULL |      NULL |
| SUE1008 | Ruth Sauce        | NULL     | NULL                | NULL    | NULL                                              |  NULL |      NULL |
| BTO1000 | Jean-Pierre Boto  | NULL     | NULL                | NULL    | NULL                                              |  NULL |      NULL |
+---------+-------------------+----------+---------------------+---------+---------------------------------------------------+-------+-----------+

--Sujet 4 

select 
 nomClient "Nom Client",
 numcommande "N° Commande",
 dateCommande "Date Commande", 
 prixUniqueArticle*quantite Montant
from 
 client clt
 left join
 commande cde
 on 
 cde.client_id=clt.id
 left join
 lignecommande lc
 On
 lc.commande_id=cde.id
 left join
 article art
on 
lc.article_id=art.id
order by montant desc;

+-------------------+----------+---------------------+-----------+
| Nom               | Commande | Date                | montant   |
+-------------------+----------+---------------------+-----------+
| Jamel Azouhri     | CDE00127 | 2023-01-10 00:00:00 | 2100.0000 |
| Jamel Azouhri     | CDE00125 | 2023-11-10 10:04:02 |  100.8000 |
| Jamel Azouhri     | CDE00127 | 2023-01-10 00:00:00 |   72.5000 |
| Jamel Azouhri     | CDE00125 | 2023-11-10 10:04:02 |   65.0000 |
| Timoth├®e Gobert   | CDE00321 | 2023-02-10 00:00:00 |   43.2000 |
| Jamel Azouhri     | CDE00125 | 2023-11-10 10:04:02 |   12.5000 |
| Ruth Sauce        | NULL     | NULL                |      NULL |
| Yanick Thomson    | CDE00522 | 2023-03-10 00:00:00 |      NULL |
| Timoth├®e Gobert   | CDE00321 | 2023-02-10 00:00:00 |      NULL |
| Jamel Azouhri     | CDE00125 | 2023-11-10 10:04:02 |      NULL |
| Jean-Pierre Boto  | NULL     | NULL                |      NULL |
| Bernard Soubiroux | NULL     | NULL                |      NULL |
| Timoth├®e Gobert   | CDE00321 | 2023-02-10 00:00:00 |      NULL |
| Paul Gauthier     | NULL     | NULL                |      NULL |
+-------------------+----------+---------------------+-----------+

select 
 nomClient "Nom Client",
 numcommande "N° Commande",
 dateCommande "Date Commande", 
 sum(lc.quantite*art.prixUniqueArticle) Achat -- avec sum
from 
 client clt
 left join
 commande cde
 on 
 cde.client_id=clt.id
 left join
 lignecommande lc
 On
 lc.commande_id=cde.id
 left join
 article art
on 
lc.article_id=art.id
group by cde.numcommande -- on dois rajouter le group by (ici par numero de commande)
order by Achat desc;

+-------------------+-------------+---------------------+-----------+
| Nom Client        | N? Commande | Date Commande       | Achat     |
+-------------------+-------------+---------------------+-----------+
| Jamel Azouhri     | CDE00127    | 2023-01-10 00:00:00 | 2172.5000 |
| Jamel Azouhri     | CDE00125    | 2023-11-10 10:04:02 |  178.3000 |
| Timoth├®e Gobert   | CDE00321    | 2023-02-10 00:00:00 |   43.2000 |
| Yanick Thomson    | CDE00522    | 2023-03-10 00:00:00 |      NULL |
| Bernard Soubiroux | NULL        | NULL                |      NULL |
+-------------------+-------------+---------------------+-----------+

select 
 nomClient "Nom Client",
 numcommande "N° Commande",
 dateCommande "Date Commande", 
 round(sum(lc.quantite*art.prixUniqueArticle),2) Achat 
from 
 client clt
 left join
 commande cde
 on 
 cde.client_id=clt.id
 left join
 lignecommande lc
 On
 lc.commande_id=cde.id
 left join
 article art
on 
lc.article_id=art.id
group by cde.numcommande; 
order by Achat desc;


-- 4.2
----4.2.1
--Tables
client
article
lignecommande
commande
--Contraintes (nombre de table - 1)
client.id = commande.client_id
commande.id=lignecommande.commande_id
lignecommande.article_id=article.id
----4.2.2
select *
from client, article, lignecommande, commande
where client.id = commande.client_id 
and commande.id=lignecommande.commande_id 
and lignecommande.article_id=article.id;
----4.2.3
select numClient,nomClient,adresseClient,prixUniqueArticle*quantite as Achat
from client, article, lignecommande, commande
where client.id = commande.client_id 
and commande.id=lignecommande.commande_id 
and lignecommande.article_id=article.id;
----4.2.4
select numClient,nomClient,adresseClient,round(sum(prixUniqueArticle*quantite),2) as Achat
from client, article, lignecommande, commande
where client.id = commande.client_id 
and commande.id=lignecommande.commande_id 
and lignecommande.article_id=article.id
group by numClient;
----4.2.5
create view v_sujet4_2_5 as
select numClient,nomClient,adresseClient,round(sum(prixUniqueArticle*quantite),2) as Achat
from client, article, lignecommande, commande
where client.id = commande.client_id 
and commande.id=lignecommande.commande_id 
and lignecommande.article_id=article.id
group by numClient;
----4.2.6

-----Correction
--comme je vais créer une view intermediaire alors je raccourci le tableau en client_id et
--achat seulement
---4.2.1 Correction
select * 
from commande c, lignecommande l , article a
where l.commande_id=c.id and l.article_id=a.id;
---4.2.2 Correction
select c.client_id,sum(l.quantite*a.prixUniqueArticle) as Achat 
from commande c, lignecommande l , article a
where l.commande_id=c.id and l.article_id=a.id
group by client_id;

+-----------+-----------+
| client_id | Achat     |
+-----------+-----------+
|         1 | 2350.8000 |
|         2 |   43.2000 |
|         3 |      NULL |
+-----------+-----------+
---4.2.3 Correction
create view v_sujet_4_2_2_Correction as
select c.client_id,sum(l.quantite*a.prixUniqueArticle) as Achat 
from commande c, lignecommande l , article a
where l.commande_id=c.id and l.article_id=a.id
group by client_id;
---4.2.4 Correction
select *
from client c left join v_sujet_4_2_2_Correction v on c.id=v.client_id;
+----+-----------+-------------------+------------------------------------------+-----------+-----------+
| id | numClient | nomClient         | adresseClient                            | client_id | Achat     |
+----+-----------+-------------------+------------------------------------------+-----------+-----------+
|  1 | JA001     | Jamel Azouhri     | 1 rue des colombe 33310 LORMONT          |         1 | 2350.8000 |
|  2 | GT001     | Timoth├®e Gobert   | 7 rue du petit huis 89510 VERON          |         2 |   43.2000 |
|  3 | YT001     | Yanick Thomson    | 159B route de fleuri 91170 VIRYCHATILLON |         3 |      NULL |
|  4 | SIX1258   | Bernard Soubiroux | Rennes                                   |      NULL |      NULL |
|  5 | GTR1259   | Paul Gauthier     | La Rochelle                              |      NULL |      NULL |
|  6 | SUE1008   | Ruth Sauce        | Dijon                                    |      NULL |      NULL |
|  7 | BTO1000   | Jean-Pierre Boto  | Nantes                                   |      NULL |      NULL |
+----+-----------+-------------------+------------------------------------------+-----------+-----------+
---4.2.5 C
select numclient,nomclient,adresseclient,round(achat,2) as Achat
from client c left join v_sujet_4_2_2_Correction v on c.id=v.client_id;
+-----------+-------------------+------------------------------------------+---------+
| numclient | nomclient         | adresseclient                            | Achat   |
+-----------+-------------------+------------------------------------------+---------+
| JA001     | Jamel Azouhri     | 1 rue des colombe 33310 LORMONT          | 2350.80 |
| GT001     | Timoth├®e Gobert   | 7 rue du petit huis 89510 VERON          |   43.20 |
| YT001     | Yanick Thomson    | 159B route de fleuri 91170 VIRYCHATILLON |    NULL |
| SIX1258   | Bernard Soubiroux | Rennes                                   |    NULL |
| GTR1259   | Paul Gauthier     | La Rochelle                              |    NULL |
| SUE1008   | Ruth Sauce        | Dijon                                    |    NULL |
| BTO1000   | Jean-Pierre Boto  | Nantes                                   |    NULL |
+-----------+-------------------+------------------------------------------+---------+
---4.2.6 C
select numclient,nomclient,adresseclient,coalesce(round(achat,2),0) as Achat
from client c left join v_sujet_4_2_2_Correction v on c.id=v.client_id;
+-----------+-------------------+------------------------------------------+---------+
| numclient | nomclient         | adresseclient                            | Achat   |
+-----------+-------------------+------------------------------------------+---------+
| JA001     | Jamel Azouhri     | 1 rue des colombe 33310 LORMONT          | 2350.80 |
| GT001     | Timoth├®e Gobert   | 7 rue du petit huis 89510 VERON          |   43.20 |
| YT001     | Yanick Thomson    | 159B route de fleuri 91170 VIRYCHATILLON |    0.00 |
| SIX1258   | Bernard Soubiroux | Rennes                                   |    0.00 |
| GTR1259   | Paul Gauthier     | La Rochelle                              |    0.00 |
| SUE1008   | Ruth Sauce        | Dijon                                    |    0.00 |
| BTO1000   | Jean-Pierre Boto  | Nantes                                   |    0.00 |
+-----------+-------------------+------------------------------------------+---------+
---4.2.7 C
create view v_sujet_4_Correction_Finale as
select numclient,nomclient,adresseclient,coalesce(round(achat,2),0) as Achat
from client c left join v_sujet_4_2_2_Correction v on c.id=v.client_id;

---4.3.1
article
lignecommande

articlecommade.article_id= article.id

---4.3.2
select * 
from article, lignecommande
where lignecommande.article_id=article.id;

---4.3.3
select 
numArticle "N° Article",
designationArticle "Designation Article",
prixUniqueArticle "PU",
prixUniqueArticle*quantite "CA"
from 
article, 
lignecommande
where 
lignecommande.article_id=article.id;

---4.3.4
select 
numArticle "N° Article",
designationArticle "Designation Article",
prixUniqueArticle "PU",
prixUniqueArticle*quantite "CA"
from 
article a, 
lignecommande l
where 
l.article_id=a.id;

---4.3.5
select 
numArticle "N° Article",
designationArticle "Designation Article",
prixUniqueArticle "PU",
sum(prixUniqueArticle*quantite) "CA"
from 
article a, 
lignecommande l
where 
l.article_id=a.id
group by numarticle
order by ca desc;

--projet 4-4-1C
article
lignecommande

lignecommande.article_id=article.id

4-4-2
select *
from
article,
ligneCommande
where
lignecommande.article_id=article.id;

4-4-3
select 
numarticle "N° Article",
designationArticle "Designation Article",
prixUniqueArticle "PU",
prixUniqueArticle*quantite "CA"
from
article,
ligneCommande
where
lignecommande.article_id=article.id;

4-4-4
select 
numarticle "N° Article",
designationArticle "Designation Article",
prixUniqueArticle "PU",
sum(prixUniqueArticle*quantite) "CA"
from
article,
ligneCommande
where
lignecommande.article_id=article.id
group by numarticle
order by CA desc;

4-4-5
select 
numarticle "N° Article",
designationArticle "Designation Article",
prixUniqueArticle "PU",
round(sum(prixUniqueArticle*quantite),2) "CA"
from
article,
ligneCommande
where
lignecommande.article_id=article.id
group by numarticle
order by CA desc;

4-4-6
create view v_4_4_6Correction as
select 
numarticle "N° Article",
designationArticle "Designation Article",
prixUniqueArticle "PU",
round(sum(prixUniqueArticle*quantite),2) "CA"
from
article,
ligneCommande
where
lignecommande.article_id=article.id
group by numarticle
order by CA desc;

4-4-7
create view v_4_4_6Correction as
select 
numarticle "N° Article",
designationArticle "Designation Article",
prixUniqueArticle "PU",
coalesce(round(sum(prixUniqueArticle*quantite),2),0) "CA"
from
article
left join
ligneCommande
on
lignecommande.article_id=article.id
group by numarticle
order by CA desc;

insert into article(numarticle,designationArticle,prixUniqueArticle) values
("BB005","Biere cuvee des trol",3.42),
("BB006","Biere chouuuffffe",4.42),
("BB007","Biere lucifere",3.60),
("BB008","Biere damdam",3.99);

1ere view 
article_id CA
create view vi_ca_art as
select article_id, sum(quantite*prixUniqueArticle) as ca
from lignecommande l , article a 
where l.article_id=a.id
group by article_id;

2eme view
select a.numarticle as "N° Article", a.designationArticle,a.prixUniqueArticle as pu,
round(coalesce(v.ca,0),2) as ca
from article a left join vi_ca_art v 
on v.article_id=a.id;













