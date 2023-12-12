create database dwwm;
use dwwm;
show databases;
create table article(
    id integer auto_increment primary key,
    numArticle varchar(20) not null unique,
    designation varchar(250) not null,
    prixUnitaire numeric(10,2)
);
insert into article (numArticle,designationArticle,prixUnitaireArticle) values
    ("BSA001","coca-cola",1.50),
    ("BSA002","fanta",1.60),
    ("BSA003","orangina",1.55),
    ("BSA004","sprite",1.80),
    ("BSA005","pepsi",1.58),
    ("BSA006","dr peper",1.99),
    ("BSA007","limonade",1.750),
    ("BSA008","ice-tea",1.54);
create table client(
    id integer auto_increment primary key,
    numClient varchar(20) not null unique,
    nomClient varchar(250),
    adresseClient varchar(250)
);
insert into client (numClient,nomClient,adresseClient) values
    ("GOT001","Gobert Timothee","Veron"),
    ("AJM001","Ahjam Jamila","Le Cannet des Maures"),
    ("GRA001","Garcia Damien","Basse-Goulaine"),
    ("PLT001","Poillot Jordhan","Malakoff"),
    ("GTR001","Paul Gauthier","Marseille");
create table commande(
    id integer auto_increment primary key,
    numCommande varchar(20) not null unique,
    dateCommande datetime default now() not null,
    client_id int not null,
    foreign key (client_id) references client(id)
);
insert into commande (numCommande, client_id) values
    ("CMD00001",1),
    ("CMD00002",2),
    ("CMD00003",5);
insert into commande (numCommande,dateCommande,client_id) values
    ('CMD00004','2023/01/13',2),
    ('CMD00005','2023/02/28',4),
    ('CMD00006','2023/03/07',5);
create table ligneCommande (
    id integer auto_increment primary key,
    quantite numeric(8,2) default 1,
    commande_id int not null,
    article_id int not null,
    foreign key(commande_id) references commande(id),
    foreign key(article_id) references article(id)
);
insert into ligneCommande(commande_id,article_id,quantite) values
    (1,2,15);,
    (1,2,85),
    (1,3,45),
    (2,1,65),
    (2,5,87),
    (2,5,69),
    (2,4,61),
    (2,5,12),
    (2,1,10),
    (2,6,68),
    (3,4,15),
    (3,2,15),
    (3,4,68),
    (4,5,85),
    (4,3,95),
    (4,2,85);
--- tp 2
select
coalesce(numCommande ,"") "N° Commande",
coalesce(dateCommande ,"") "Date Commande",
nomClient "Nom Client",
adresseClient "Adresse Client"
from
client
left join
commande
on client.id=commande.client_id;
--- tp 3
select
numclient "N° Client",
nomClient "Nom Client",
coalesce(numCommande , "") "N° Commande",
coalesce(dateCommande , "") "Date Commande",
coalesce(numArticle , "") "N° Article",
coalesce(designationArticle , "") "Designation Article",
coalesce(quantite , "") "Qte",
coalesce(sum(quantite*prixUnitaireArticle),"") "Montant"
from
client
left join 
commande 
on 
client.id=commande.client_id
left join
ligneCommande
on 
commande.id=ligneCommande.commande_id
left join
article
on
article.id=lignecommande.article_id
group by numcommande;
+-----------+-----------------+-------------+---------------+------------+---------------------+-------+----------+
| N° Client | Nom Client      | N° Commande | Date Commande | N° Article | Designation Article | Qte   | Montant  |
+-----------+-----------------+-------------+---------------+------------+---------------------+-------+----------+
| GRA001    | Garcia Damien   |             |               |            |                     |       |          |
| GOT001    | Gobert Timothee | CMD00001    | 2023-11-14    | BSA001     | coca-cola           | 15.00 | 347.3500 |
| AJM001    | Ahjam Jamila    | CMD00002    | 2023-11-14    | BSA007     | limonade            | 87.00 | 430.8900 |
| GTR001    | Paul Gauthier   | CMD00003    | 2023-11-14    | BSA008     | ice-tea             | 68.00 | 161.5700 |
| AJM001    | Ahjam Jamila    | CMD00004    | 2023-01-13    | BSA006     | dr peper            | 68.00 | 561.6700 |
| PLT001    | Poillot Jordhan | CMD00005    | 2023-02-28    | BSA002     | fanta               | 45.00 | 260.1800 |
| GTR001    | Paul Gauthier   | CMD00006    | 2023-03-07    |            |                     |       |          |
+-----------+-----------------+-------------+---------------+------------+---------------------+-------+----------+
---tp 4
select
nomClient "Nom Client",
coalesce(numcommande,"")"N° Commande",
coalesce(dateCommande,"")"Date Commande",
coalesce(sum(prixUnitaireArticle*quantite),"") "Achat"
from
client
left join
commande
on 
client.id=commande.client_id
left join
ligneCommande
on
commande.id=lignecommande.commande_id
left join
article
on 
article.id=lignecommande.article_id
group by numcommande;
+-----------------+-------------+---------------+----------+
| Nom Client      | N° Commande | Date Commande | Achat    |
+-----------------+-------------+---------------+----------+
| Garcia Damien   |             |               |          |
| Gobert Timothee | CMD00001    | 2023-11-14    | 347.3500 |
| Ahjam Jamila    | CMD00002    | 2023-11-14    | 430.8900 |
| Paul Gauthier   | CMD00003    | 2023-11-14    | 161.5700 |
| Ahjam Jamila    | CMD00004    | 2023-01-13    | 561.6700 |
| Poillot Jordhan | CMD00005    | 2023-02-28    | 260.1800 |
| Paul Gauthier   | CMD00006    | 2023-03-07    |          |
+-----------------+-------------+---------------+----------+
---tp 5
select
numClient "N° Client",
nomClient "Nom Client",
adresseClient "Adresse Client",
coalesce(round(sum(quantite*prixUnitaireArticle),2) ,"") "Achat"
from
client
left join
commande
on
client.id=commande.client_id
left join
ligneCommande
on 
commande.id=ligneCommande.commande_id
left join
article
on
article.id=ligneCommande.article_id
group by numClient
order by Achat desc;
--tp6
select
numArticle "N° Article",
designationArticle "Désignation Article",
prixUnitaireArticle "PU",
coalesce(round(sum(quantite*prixUnitaireArticle),2) ,"") "CA"
from
article 
left join
ligneCommande
on article.id=lignecommande.article_id
group by numArticle
order by CA desc;
--TP7
---ma méthode
select
year(dateCommande) "Annee",
numArticle "N° Article",
designationArticle "Description Article",
prixUnitaireArticle "PU",
sum(if(month(dateCommande)=1,l.quantite,0)) as Janvier,
sum(if(month(dateCommande)=2,l.quantite,0)) as Fevrier,
sum(if(month(dateCommande)=3,l.quantite,0)) as Mars,
sum(if(month(dateCommande)>3,l.quantite,0)) as Autre,
sum(l.quantite) Total
from 
article a
left join
lignecommande l
on
a.id=l.article_id
left join
commande c
on
c.id=l.commande_id 
group by annee, numArticle;
---méthode avec inner (meilleur lorsqu'il y aura plus de données)
 select
year(dateCommande) "Annee",
numArticle "N° Article",
designationArticle "Description Article",
prixUnitaireArticle "PU",
sum(if(month(dateCommande)=1,l.quantite,0)) as Janvier,
sum(if(month(dateCommande)=2,l.quantite,0)) as Fevrier,
sum(if(month(dateCommande)=3,l.quantite,0)) as Mars,
sum(if(month(dateCommande)>3,l.quantite,0)) as Autre,
sum(l.quantite) Total
from article a left join 
    ( commande c inner join lignecommande l on c.id=l.commande_id  )
on
a.id=l.article_id
group by annee, numArticle;
----test en inversans le sens de la recherche
select
year(c.dateCommande) "Annee",
a.numArticle "N° Article",
a.designationArticle "Description Article",
a.prixUnitaireArticle "PU",
sum(if(month(dateCommande)=1,l.quantite,0)) as Janvier,
sum(if(month(dateCommande)=2,l.quantite,0)) as Fevrier,
sum(if(month(dateCommande)=3,l.quantite,0)) as Mars,
sum(if(month(dateCommande)>3,l.quantite,0)) as Autre,
sum(l.quantite) Total
from commande c left join 
    ( lignecommande l inner join article a on a.id=l.article_id  )
on
c.id=l.commande_id
group by annee, numArticle;
--methode avec une view intermediaire
---aussi simple que la 1er méthode et aussi efficace que la deuxieme
create or replace view vi_stat_article as
select
year(c.datecommande) as annee,
l.article_id,
sum(if(month(c.dateCommande)=1,l.quantite,0)) as Janvier,
sum(if(month(c.dateCommande)=2,l.quantite,0)) as Fevrier,
sum(if(month(c.dateCommande)=3,l.quantite,0)) as Mars,
sum(if(month(c.dateCommande)>3,l.quantite,0)) as Autre,
sum(l.quantite) Total
from 
commande c,
lignecommande l
where
c.id=l.commande_id
group by annee, l.article_id;

select 
coalesce(v.annee,"---") as Annee,
a.numArticle,
a.designationArticle,
a.prixUnitaireArticle,
coalesce(v.Janvier,0) as Janvier,
coalesce(v.Fevrier,0) as Fevrier,
coalesce(v.Mars,0) as Mars,
coalesce(v.Autre,0) as Autre,
coalesce(v.Total,0) as Total
from article a left join vi_stat_article v on a.id= v.article_id
order by Annee, numArticle;

--derniere methode : la même en supprimant la view
--- 1 - on recupere le deuxieme code
select 
coalesce(v.annee,"---") as Annee,
a.numArticle,
a.designationArticle,
a.prixUnitaireArticle PU,
coalesce(v.Janvier,0) as Janvier,
coalesce(v.Fevrier,0) as Fevrier,
coalesce(v.Mars,0) as Mars,
coalesce(v.Autre,0) as Autre,
coalesce(v.Total,0) as Total
from article a left join (
    select
    year(c.datecommande) as annee,
    l.article_id,
    sum(if(month(c.dateCommande)=1,l.quantite,0)) as Janvier,
    sum(if(month(c.dateCommande)=2,l.quantite,0)) as Fevrier,
    sum(if(month(c.dateCommande)=3,l.quantite,0)) as Mars,
    sum(if(month(c.dateCommande)>3,l.quantite,0)) as Autre,
    sum(l.quantite) Total
    from 
    commande c,
    lignecommande l
    where
    c.id=l.commande_id
    group by annee, l.article_id
) v 
on a.id= v.article_id
order by Annee, numArticle;
--- 2 - On remplace la view par le code 

--------------------------------------------
--------------------------------------------
-------  ========= =====     =====   -------
-------      =     =    =   =     =  -------
-------      =     =====     =====   -------
-------      =     =        =     =  -------
-------      =     =         =====   -------
--------------------------------------------
--------------------------------------------

---Sous Requete
select
year(dateCommande) Annee,
article_id,
sum(if(dayofweek(dateCommande)=2,quantite,0)) Lun,
sum(if(dayofweek(dateCommande)=3,quantite,0)) Mar,
sum(if(dayofweek(dateCommande)=4,quantite,0)) Mer,
sum(if(dayofweek(dateCommande)=5,quantite,0)) Jeu,
sum(if(dayofweek(dateCommande)=6,quantite,0)) Ven,
sum(if(dayofweek(dateCommande)=7,quantite,0)) Sam,
sum(if(dayofweek(dateCommande)=1,quantite,0)) Dim,
sum(quantite) Tot
from
commande
left join
ligneCommande
on 
commande.id=ligneCommande.commande_id
group by annee, Article_id;

select
Annee,
numArticle NA,
designationArticle Designation,
prixUnitaireArticle PU,
Lun,
Mar,
Mer,
Jeu,
Ven,
Sam,
Dim,
Tot
from
article
left join (
    select
    year(dateCommande) Annee,
    article_id,
    sum(if(dayofweek(dateCommande)=2,quantite,0)) Lun,
    sum(if(dayofweek(dateCommande)=3,quantite,0)) Mar,
    sum(if(dayofweek(dateCommande)=4,quantite,0)) Mer,
    sum(if(dayofweek(dateCommande)=5,quantite,0)) Jeu,
    sum(if(dayofweek(dateCommande)=6,quantite,0)) Ven,
    sum(if(dayofweek(dateCommande)=7,quantite,0)) Sam,
    sum(if(dayofweek(dateCommande)=1,quantite,0)) Dim,
    sum(quantite) Tot
    from
    commande
    left join
    ligneCommande
    on 
    commande.id=ligneCommande.commande_id
    group by annee, Article_id
) sR
on
article.id=sr.article_id;
+-------+--------+-------------+------+------+--------+------+------+-------+------+------+--------+
| Annee | NA     | Designation | PU   | Lun  | Mar    | Mer  | Jeu  | Ven   | Sam  | Dim  | Tot    |
+-------+--------+-------------+------+------+--------+------+------+-------+------+------+--------+
|  2023 | BSA001 | coca-cola   | 1.50 | 0.00 |  15.00 | 0.00 | 0.00 | 85.00 | 0.00 | 0.00 | 100.00 |
|  2023 | BSA002 | fanta       | 1.60 | 0.00 |  45.00 | 0.00 | 0.00 |  0.00 | 0.00 | 0.00 |  45.00 |
|  2023 | BSA003 | orangina    | 1.55 | 0.00 | 140.00 | 0.00 | 0.00 |  0.00 | 0.00 | 0.00 | 140.00 |
|  2023 | BSA004 | sprite      | 1.80 | 0.00 | 100.00 | 0.00 | 0.00 |  0.00 | 0.00 | 0.00 | 100.00 |
|  2023 | BSA005 | pepsi       | 1.58 | 0.00 |  45.00 | 0.00 | 0.00 | 95.00 | 0.00 | 0.00 | 140.00 |
|  2023 | BSA006 | dr peper    | 1.99 | 0.00 |  76.00 | 0.00 | 0.00 | 68.00 | 0.00 | 0.00 | 144.00 |
|  2023 | BSA007 | limonade    | 1.75 | 0.00 | 203.00 | 0.00 | 0.00 | 85.00 | 0.00 | 0.00 | 288.00 |
|  2023 | BSA008 | ice-tea     | 1.54 | 0.00 |  85.00 | 0.00 | 0.00 |  0.00 | 0.00 | 0.00 |  85.00 |
+-------+--------+-------------+------+------+--------+------+------+-------+------+------+--------+

INSERT INTO article (numArticle, designationArticle, prixUnitaireArticle)
VALUES 
    ('BIE001', 'Biere rousse', 2.75),
    ('VIN001', 'Vin rose', 14.50),
    ('JUS001', 'Jus de peche', 3.99),
    ('EAU001', 'Volvic', 9.25),
    ('BIE002', 'Biere blanche', 2.90),
    ('VIN002', 'Vin petillant', 18.75),
    ('JUS002', 'Jus de cerise', 4.25),
    ('EAU002', 'Christaline', 6.99),
    ('BIE003', 'Biere aromatisee', 3.25),
    ('VIN003', 'Vin sec', 11.99),
    ('JUS003', 'Jus de fraise', 2.75),
    ('EAU003', 'Epart', 8.50),
    ('BIE004', 'Biere ambree', 3.50),
    ('VIN004', 'Vin doux', 13.25),
    ('JUS004', 'Jus de mangue', 4.49),
    ('EAU004', 'Contrex', 10.75),
    ('BIE005', 'Biere fruitee', 2.99),
    ('VIN005', 'Vin leger', 16.00),
    ('JUS005', 'Jus de grenade', 3.25),
    ('EAU005', 'Evian', 7.99),
    ('BIE006', 'Biere exotique', 4.25),
    ('VIN006', 'Vin robuste', 19.99),
    ('JUS006', 'Jus d''ananas', 2.50),
    ('EAU006', 'solveta', 11.50),
    ('BIE007', 'Biere festive', 3.75),
    ('VIN007', 'Vin epice', 14.75),
    ('JUS007', 'Jus de citron', 4.75),
    ('EAU007', 'Perrier', 9.99),
    ('BIE008', 'Biere houblonnee', 2.25),
    ('VIN008', 'Vin corse', 17.50),
    ('JUS008', 'Jus de melon', 3.99),
    ('EAU008', 'Autre article 10', 8.25),
    ('BIE009', 'Biere equilibree', 3.00),
    ('VIN009', 'Vin fruite', 12.99),
    ('JUS009', 'Jus de framboise', 4.25),
    ('EAU009', 'Voss', 10.00),
    ('BIE010', 'Biere legere', 2.75),
    ('VIN010', 'Vin rafraichissant', 15.50),
    ('JUS010', 'Jus de kiwi', 3.75),
    ('EAU010', 'Volvic citron', 7.50),
    ('BIE011', 'Biere petillante', 4.50),
    ('VIN011', 'Vin veloute', 18.25),
    ('JUS011', 'Jus de cassis', 2.99),
    ('EAU011', 'Volvic fraise', 12.25);
INSERT INTO commande (numCommande, dateCommande, client_id) VALUES
    ('CMD00006', '2023-03-15', 3),
    ('CMD00007', '2023-04-02', 1),
    ('CMD00008', '2023-04-10', 5),
    ('CMD00009', '2023-04-22', 2),
    ('CMD00010', '2023-05-05', 4);
INSERT INTO lignecommande (quantite, commande_id, article_id) VALUES
    (2.5, 6, 1), 
    (1.0, 6, 3), 
    (3.0, 7, 2), 
    (1.5, 8, 4),
    (2.0, 9, 5); 

create or replace view vi_stat_boisson as 
select 
year(c.datecommande) annee, 
l.article_id,
l.quantite as biere,
0 vin ,
0 Jus ,
0 Autre
from 
 commande c, article a, lignecommande l 
where l.commande_id=c.id and l.article_id=a.id and left(a.numArticle,2)='BI'

union all

select 
year(c.datecommande) annee, 
l.article_id,
l.quantite as biere,
0 vin ,
0 Jus ,
0 Autre
from 
 commande c, article a, lignecommande l 
where l.commande_id=c.id and l.article_id=a.id and left(a.numArticle,2)='VI'

union all

select 
year(c.datecommande) annee, 
l.article_id,
l.quantite as biere,
0 vin ,
0 Jus ,
0 Autre
from 
 commande c, article a, lignecommande l 
where l.commande_id=c.id and l.article_id=a.id and left(a.numArticle,2)='JU'

union all

select 
year(c.datecommande) annee, 
l.article_id,
l.quantite as biere,
0 vin ,
0 Jus ,
0 Autre
from 
 commande c, article a, lignecommande l 
where l.commande_id=c.id and l.article_id=a.id and left(a.numArticle,2) not in ('BI','VI','JU');

select 
coalesce(v.annee, 'Pas de commande') as Annee, a.numarticle,a.designationArticle,coalesce(a.prixUnitaireArticle,'') as PU,
coalesce(sum(v.biere),'') as Biere,
coalesce(sum(v.vin),'') as Vin,
coalesce(sum(v.jus),'') as Jus,
coalesce(sum(v.autre),'') as Autre,
coalesce(sum(v.biere+v.vin+v.jus+v.autre),'') as Total
from article a left join vi_stat_boisson v on a.id=v.article_id
group by v.annee,a.numarticle;

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
jours dateCommande numcommande client adresseClient

select 
    coalesce(Case dayofweek(cde.datecommande)
        when 1 then 
            case month(cde.datecommande)
                when 1 then concat('Dimanche ',dayofmonth(cde.datecommande),' Jan ',year(cde.datecommande))
                when 2 then concat('Dimanche ',dayofmonth(cde.datecommande),' Fev ',year(cde.datecommande))
                when 3 then concat('Dimanche ',dayofmonth(cde.datecommande),' Mar ',year(cde.datecommande))
                when 4 then concat('Dimanche ',dayofmonth(cde.datecommande),' Avr ',year(cde.datecommande))
                when 5 then concat('Dimanche ',dayofmonth(cde.datecommande),' Mai ',year(cde.datecommande))
                when 6 then concat('Dimanche ',dayofmonth(cde.datecommande),' Juin ',year(cde.datecommande))
                when 7 then concat('Dimanche ',dayofmonth(cde.datecommande),' Juil ',year(cde.datecommande))
                when 8 then concat('Dimanche ',dayofmonth(cde.datecommande),' Out ',year(cde.datecommande))
                when 9 then concat('Dimanche ',dayofmonth(cde.datecommande),' Sep ',year(cde.datecommande))
                when 10 then concat('Dimanche ',dayofmonth(cde.datecommande),' Oct ',year(cde.datecommande))
                when 11 then concat('Dimanche ',dayofmonth(cde.datecommande),' Nov ',year(cde.datecommande))
                when 12 then concat('Dimanche ',dayofmonth(cde.datecommande),' Dec ',year(cde.datecommande))
            end
        when 2 then 
            case month(cde.datecommande)
                when 1 then concat('Lundi ',dayofmonth(cde.datecommande),' Jan ',year(cde.datecommande))
                when 2 then concat('Lundi ',dayofmonth(cde.datecommande),' Fev ',year(cde.datecommande))
                when 3 then concat('Lundi ',dayofmonth(cde.datecommande),' Mar ',year(cde.datecommande))
                when 4 then concat('Lundi ',dayofmonth(cde.datecommande),' Avr ',year(cde.datecommande))
                when 5 then concat('Lundi ',dayofmonth(cde.datecommande),' Mai ',year(cde.datecommande))
                when 6 then concat('Lundi ',dayofmonth(cde.datecommande),' Juin ',year(cde.datecommande))
                when 7 then concat('Lundi ',dayofmonth(cde.datecommande),' Juil ',year(cde.datecommande))
                when 8 then concat('Lundi ',dayofmonth(cde.datecommande),' Out ',year(cde.datecommande))
                when 9 then concat('Lundi ',dayofmonth(cde.datecommande),' Sep ',year(cde.datecommande))
                when 10 then concat('Lundi ',dayofmonth(cde.datecommande),' Oct ',year(cde.datecommande))
                when 11 then concat('Lundi ',dayofmonth(cde.datecommande),' Nov ',year(cde.datecommande))
                when 12 then concat('Lundi ',dayofmonth(cde.datecommande),' Dec ',year(cde.datecommande))
            end
        when 3 then 
            case month(cde.datecommande)
                when 1 then concat('Mardi ',dayofmonth(cde.datecommande),' Jan ',year(cde.datecommande))
                when 2 then concat('Mardi ',dayofmonth(cde.datecommande),' Fev ',year(cde.datecommande))
                when 3 then concat('Mardi ',dayofmonth(cde.datecommande),' Mar ',year(cde.datecommande))
                when 4 then concat('Mardi ',dayofmonth(cde.datecommande),' Avr ',year(cde.datecommande))
                when 5 then concat('Mardi ',dayofmonth(cde.datecommande),' Mai ',year(cde.datecommande))
                when 6 then concat('Mardi ',dayofmonth(cde.datecommande),' Juin ',year(cde.datecommande))
                when 7 then concat('Mardi ',dayofmonth(cde.datecommande),' Juil ',year(cde.datecommande))
                when 8 then concat('Mardi ',dayofmonth(cde.datecommande),' Out ',year(cde.datecommande))
                when 9 then concat('Mardi ',dayofmonth(cde.datecommande),' Sep ',year(cde.datecommande))
                when 10 then concat('Mardi ',dayofmonth(cde.datecommande),' Oct ',year(cde.datecommande))
                when 11 then concat('Mardi ',dayofmonth(cde.datecommande),' Nov ',year(cde.datecommande))
                when 12 then concat('Mardi ',dayofmonth(cde.datecommande),' Dec ',year(cde.datecommande))
            end
        when 4 then 
            case month(cde.datecommande)
                when 1 then concat('Mercredi ',dayofmonth(cde.datecommande),' Jan ',year(cde.datecommande))
                when 2 then concat('Mercredi ',dayofmonth(cde.datecommande),' Fev ',year(cde.datecommande))
                when 3 then concat('Mercredi ',dayofmonth(cde.datecommande),' Mar ',year(cde.datecommande))
                when 4 then concat('Mercredi ',dayofmonth(cde.datecommande),' Avr ',year(cde.datecommande))
                when 5 then concat('Mercredi ',dayofmonth(cde.datecommande),' Mai ',year(cde.datecommande))
                when 6 then concat('Mercredi ',dayofmonth(cde.datecommande),' Juin ',year(cde.datecommande))
                when 7 then concat('Mercredi ',dayofmonth(cde.datecommande),' Juil ',year(cde.datecommande))
                when 8 then concat('Mercredi ',dayofmonth(cde.datecommande),' Out ',year(cde.datecommande))
                when 9 then concat('Mercredi ',dayofmonth(cde.datecommande),' Sep ',year(cde.datecommande))
                when 10 then concat('Mercredi ',dayofmonth(cde.datecommande),' Oct ',year(cde.datecommande))
                when 11 then concat('Mercredi ',dayofmonth(cde.datecommande),' Nov ',year(cde.datecommande))
                when 12 then concat('Mercredi ',dayofmonth(cde.datecommande),' Dec ',year(cde.datecommande))
            end
        when 5 then 
            case month(cde.datecommande)
                when 1 then concat('Jeudi ',dayofmonth(cde.datecommande),' Jan ',year(cde.datecommande))
                when 2 then concat('Jeudi ',dayofmonth(cde.datecommande),' Fev ',year(cde.datecommande))
                when 3 then concat('Jeudi ',dayofmonth(cde.datecommande),' Mar ',year(cde.datecommande))
                when 4 then concat('Jeudi ',dayofmonth(cde.datecommande),' Avr ',year(cde.datecommande))
                when 5 then concat('Jeudi ',dayofmonth(cde.datecommande),' Mai ',year(cde.datecommande))
                when 6 then concat('Jeudi ',dayofmonth(cde.datecommande),' Juin ',year(cde.datecommande))
                when 7 then concat('Jeudi ',dayofmonth(cde.datecommande),' Juil ',year(cde.datecommande))
                when 8 then concat('Jeudi ',dayofmonth(cde.datecommande),' Out ',year(cde.datecommande))
                when 9 then concat('Jeudi ',dayofmonth(cde.datecommande),' Sep ',year(cde.datecommande))
                when 10 then concat('Jeudi ',dayofmonth(cde.datecommande),' Oct ',year(cde.datecommande))
                when 11 then concat('Jeudi ',dayofmonth(cde.datecommande),' Nov ',year(cde.datecommande))
                when 12 then concat('Jeudi ',dayofmonth(cde.datecommande),' Dec ',year(cde.datecommande))
            end
        when 6 then 
            case month(cde.datecommande)
                when 1 then concat('Vendredi ',dayofmonth(cde.datecommande),' Jan ',year(cde.datecommande))
                when 2 then concat('Vendredi ',dayofmonth(cde.datecommande),' Fev ',year(cde.datecommande))
                when 3 then concat('Vendredi ',dayofmonth(cde.datecommande),' Mar ',year(cde.datecommande))
                when 4 then concat('Vendredi ',dayofmonth(cde.datecommande),' Avr ',year(cde.datecommande))
                when 5 then concat('Vendredi ',dayofmonth(cde.datecommande),' Mai ',year(cde.datecommande))
                when 6 then concat('Vendredi ',dayofmonth(cde.datecommande),' Juin ',year(cde.datecommande))
                when 7 then concat('Vendredi ',dayofmonth(cde.datecommande),' Juil ',year(cde.datecommande))
                when 8 then concat('Vendredi ',dayofmonth(cde.datecommande),' Out ',year(cde.datecommande))
                when 9 then concat('Vendredi ',dayofmonth(cde.datecommande),' Sep ',year(cde.datecommande))
                when 10 then concat('Vendredi ',dayofmonth(cde.datecommande),' Oct ',year(cde.datecommande))
                when 11 then concat('Vendredi ',dayofmonth(cde.datecommande),' Nov ',year(cde.datecommande))
                when 12 then concat('Vendredi ',dayofmonth(cde.datecommande),' Dec ',year(cde.datecommande))
            end
        when 7 then 
            case month(cde.datecommande)
                when 1 then concat('Samedi ',dayofmonth(cde.datecommande),' Jan ',year(cde.datecommande))
                when 2 then concat('Samedi ',dayofmonth(cde.datecommande),' Fev ',year(cde.datecommande))
                when 3 then concat('Samedi ',dayofmonth(cde.datecommande),' Mar ',year(cde.datecommande))
                when 4 then concat('Samedi ',dayofmonth(cde.datecommande),' Avr ',year(cde.datecommande))
                when 5 then concat('Samedi ',dayofmonth(cde.datecommande),' Mai ',year(cde.datecommande))
                when 6 then concat('Samedi ',dayofmonth(cde.datecommande),' Juin ',year(cde.datecommande))
                when 7 then concat('Samedi ',dayofmonth(cde.datecommande),' Juil ',year(cde.datecommande))
                when 8 then concat('Samedi ',dayofmonth(cde.datecommande),' Out ',year(cde.datecommande))
                when 9 then concat('Samedi ',dayofmonth(cde.datecommande),' Sep ',year(cde.datecommande))
                when 10 then concat('Samedi ',dayofmonth(cde.datecommande),' Oct ',year(cde.datecommande))
                when 11 then concat('Samedi ',dayofmonth(cde.datecommande),' Nov ',year(cde.datecommande))
                when 12 then concat('Samedi ',dayofmonth(cde.datecommande),' Dec ',year(cde.datecommande))
            end
    end,'') as "Date commande",
    coalesce(cde.numcommande,'') as "N° commande",
    concat(clt.numClient,' - ',clt.nomClient) as client,
    clt.adresseClient
    from client clt left join commande cde on clt.id=cde.client_id;
+----------------------+-------------+--------------------------+----------------------+
| Date commande        | N° commande | client                   | adresseClient        |
+----------------------+-------------+--------------------------+----------------------+
| Mardi 14 Nov 2023    | CMD00001    | GOT001 - Gobert Timothee | Veron                |
| Dimanche 2 Avr 2023  | CMD00007    | GOT001 - Gobert Timothee | Veron                |
| Vendredi 13 Jan 2023 | CMD00004    | AJM001 - Ahjam Jamila    | Le Cannet des Maures |
| Mardi 14 Nov 2023    | CMD00002    | AJM001 - Ahjam Jamila    | Le Cannet des Maures |
| Samedi 22 Avr 2023   | CMD00009    | AJM001 - Ahjam Jamila    | Le Cannet des Maures |
| Mercredi 15 Mar 2023 | CMD00006    | GRA001 - Garcia Damien   | Basse-Goulaine       |
| Mardi 28 Fev 2023    | CMD00005    | PLT001 - Poillot Jordhan | Malakoff             |
| Vendredi 5 Mai 2023  | CMD00010    | PLT001 - Poillot Jordhan | Malakoff             |
| Mardi 14 Nov 2023    | CMD00003    | GTR001 - Paul Gauthier   | Marseille            |
| Lundi 10 Avr 2023    | CMD00008    | GTR001 - Paul Gauthier   | Marseille            |
+----------------------+-------------+--------------------------+----------------------+


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--- Annee || numClient || nomClient || adresseClient || CA_total || CA_Client || %CA_Client ---

create or replace view vi_Stat_Total as
select 
year(c.dateCommande) as ANNEE,
sum(a.prixUnitaireArticle*l.quantite) as ca_total
from
commande c,
ligneCommande l,
article a
where
c.id=l.commande_id
group by
ANNEE
;

create or replace view vi_Stat_Client as
select 
    year(cde.dateCommande) as ANNEE,
    cde.client_id,
    sum(art.prixUnitaireArticle*lcde.quantite) as ca_client
from
    client clt,
    commande cde,
    ligneCommande lcde,
    article art
where
    clt.id=cde.client_id
    and
    cde.id=lcde.commande_id
    and
    art.id=lcde.Article_id
group by
    ANNEE,
    cde.client_id
;

select 
    vc.ANNEE as ANNEE,
    c.numclient as "N° Client",
    c.nomClient as "Nom Client",
    c.adresseClient as "Adresse",
    vt.ca_total as ca_total,
    vc.ca_client,
    round((vc.ca_client/vt.ca_total)*100,2) as "% CA Client"
from
    client c, 
    vi_Stat_Total vt,
    vi_Stat_Client vc
where
    c.id=vc.client_id
    and
    vt.ANNEE=vc.ANNEE
;

--- Affichage avec left join

select
    coalesce(vc.annee,'') as ANNEE,
    c.numClient,
    c.nomClient,
    c.adresseClient,
    coalesce(vt.ca_total,'') as "CA Total",
    coalesce(vc.ca_client,'') as "CA Client",
    concat(coalesce(round((vc.ca_client/vt.ca_total)*100,2),''),' %') as '% CA Client'
from
    client C
    left join
    (vi_stat_total vt inner join vi_Stat_Client vc on vc.annee)
    on
    c.id=vc.client_id
;

--- Avec les sous requetes

select
    coalesce(vc.annee,'') as ANNEE,
    c.numClient,
    c.nomClient,
    c.adresseClient,
    coalesce(vt.ca_total,'') as "CA Total",
    coalesce(vc.ca_client,'') as "CA Client",
    concat(coalesce(round((vc.ca_client/vt.ca_total)*100,2),''),' %') as '% CA Client'
from
    client C
    left join
        ((select 
            year(c.dateCommande) as ANNEE,
            sum(a.prixUnitaireArticle*l.quantite) as ca_total
        from
            commande c,
            ligneCommande l,
            article a
        where
            c.id=l.commande_id
        group by
            ANNEE) vt 
    inner join 
        (select 
            year(cde.dateCommande) as ANNEE,
            cde.client_id,
            sum(art.prixUnitaireArticle*lcde.quantite) as ca_client
        from
            client clt,
            commande cde,
            ligneCommande lcde,
            article art
        where
            clt.id=cde.client_id
            and
            cde.id=lcde.commande_id
            and
            art.id=lcde.Article_id
        group by
            ANNEE,
            cde.client_id) vc 
    on 
        vc.annee)
on
    c.id=vc.client_id
;

--test perso

select
    coalesce(vc.annee,'') as ANNEE,
    numClient,
    nomClient,
    adresseClient,
    coalesce(vt.ca_total,'') as "CA Total",
    coalesce(vc.ca_client,'') as "CA Client",
    concat(coalesce(round((vc.ca_client/vt.ca_total)*100,2),''),' %') as '% CA Client'
from
    client cl
    left join
        ((select 
            year(dateCommande) as ANNEE,
            sum(prixUnitaireArticle*quantite) as ca_total
        from
            commande co,
            ligneCommande l,
            article a
        where
            co.id=l.commande_id
        group by
            ANNEE) vt 
    inner join 
        (select 
            year(co.dateCommande) as ANNEE,
            co.client_id,
            sum(a.prixUnitaireArticle*l.quantite) as ca_client
        from
            client cl,
            commande co,
            ligneCommande l,
            article a
        where
            cl.id=co.client_id
            and
            co.id=l.commande_id
            and
            a.id=l.Article_id
        group by
            ANNEE,
            co.client_id) vc 
    on 
        vc.annee)
on
    cl.id=vc.client_id
;

-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--- numClient || nomClient || adresseClient || 2020 || 2021 || 2022           || Total ---
--- client    || client    || client        || commande*lignecommande*article || lignecommande*article

client cl
commande co       co.id=lc.commande_id
lignecommande lc  cl.id=co.client_id
article a         a.id=lc.article_id


select
    numclient,
    nomclient,
    adresseClient,
    sum(if(year(co.datecommande)=2020,lc.quantite*a.prixUnitaireArticle,'--')) as "2020",
    sum(if(year(co.datecommande)=2021,lc.quantite*a.prixUnitaireArticle,'--')) as "2021",
    sum(if(year(co.datecommande)=2022,lc.quantite*a.prixUnitaireArticle,'--')) as "2022",
    sum(if(year(co.datecommande)=2023,lc.quantite*a.prixUnitaireArticle,'--')) as "2023",
    sum(lc.quantite*a.prixUnitaireArticle) as Total
from
    client cl,
    left join
        commande co on 
    commande co,
    ligneCommande lc,
    article a
where
    co.id=lc.commande_id
    and
    cl.id=co.client_id
    and
    a.id=lc.article_id
;
    
--- numClient || nomClient || adresseClient || 2020 || 2021 || 2022           || Total ---
---               client id                 || commande*lignecommande*article || lignecommande*article


client_id 2020 2021 2022
union all
client_id 2020 2021 2022
union all
client_id 2020 2021 2022
union all

create or replace view vi_Stat_Annuel as
    select 
        cmd.client_id,
        lcm.quantite*art.prixUnitaireArticle as "2021",
        0 as "2022",
        0 as "2023"
    from
        commande cmd,
        lignecommande lcm,
        article art
    where
        lcm.commande_id=cmd.id
        and
        lcm.article_id=art.id
        and
        year(cmd.datecommande)=2021
    union all
    select 
        cmd.client_id,
        0 as "2021",
        lcm.quantite*art.prixUnitaireArticle as "2022",
        0 as "2023"
    from
        commande cmd,
        lignecommande lcm,
        article art
    where
        lcm.commande_id=cmd.id
        and
        lcm.article_id=art.id
        and
        year(cmd.datecommande)=2022
    union all
    select 
        cmd.client_id,
        0 as "2021",
        0 as "2022",
        lcm.quantite*art.prixUnitaireArticle as "2023"
    from
        commande cmd,
        lignecommande lcm,
        article art
    where
        lcm.commande_id=cmd.id
        and
        lcm.article_id=art.id
        and
        year(cmd.datecommande)=2023
;
--exemple de rendu 
+-----------+--------+--------+----------+
| client_id | 2021   | 2022   | 2023     |
+-----------+--------+--------+----------+
|         1 |   2    | 0.0000 |    0     |
|         1 |   2    | 0.0000 |    0     |
|         1 |   3    | 0.0000 |    0     |
|         1 |   4    | 0.0000 |    0     |
|         2 |   4    | 0.0000 |    0     |
|         2 |   7    | 0.0000 |    0     |
|         2 |   9    | 0.0000 |    0     |
|         2 |   9    | 0.0000 |    0     |
|         2 |   5    | 0.0000 |    0     |
|         5 | 0.0000 |   5    |    0     |
|         5 | 0.0000 |   5    |    0     |
|         5 | 0.0000 |   5    |    0     |
|         2 | 0.0000 | 0.0000 |    1     |
|         2 | 0.0000 | 0.0000 |    8     |
|         2 | 0.0000 | 0.0000 |    5     |
|         2 | 0.0000 | 0.0000 |    1     |
|         4 | 0.0000 | 0.0000 |    7     |
|         4 | 0.0000 | 0.0000 |    1     |
|         4 | 0.0000 | 0.0000 |    6     |
|         4 | 0.0000 | 0.0000 |    2     |
+-----------+--------+--------+----------+

select
    clt.numclient,
    clt.nomclient,
    clt.adresseClient,
    coalesce(round(sum(vi.2021),2),'') as "2021",
    coalesce(round(sum(vi.2022),2),'') as "2022",
    coalesce(round(sum(vi.2023),2),'') as "2023",
    coalesce(round(sum(vi.2021+vi.2022+vi.2023),2),'') as "Total"
from
    client clt
    left join
    vi_Stat_Annuel vi
    on
    clt.id=vi.client_id
group by 
    clt.id
;