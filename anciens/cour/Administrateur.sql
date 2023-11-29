-- Sauvegarder une bdd dans un fichier C:\[Path]\[NOM_FICHIER].sql
[user@pc>] mysqldump -u root -p [bdd à copier] > C:\test\[NOM_FICHIER_Sauvegarde].sql


----Restaurer dans une nouvelle bdd le contenue du fichier sauvegarder par la commande (dump)

--1ere étape :créer la bdd dwwm_copie
|MariaDB| create database [NOM DATABASE];

--2eme étape : taper la commande suivante
|user@pc>| mysql -u root -p [NOM DATABASE] < c:\[path]\[NOM_FICHIER_Sauvegarde].sql

---- voir les utilisateurs
select * from mysql.user;
+-----------+------+----------+-------------+-------------+-------------+-------------+-------------+-----------+-------------+---------------+--------------+-----------+------------+-----------------+------------+------------+--------------+------------+-----------------------+------------------+--------------+-----------------+------------------+------------------+----------------+---------------------+--------------------+------------------+------------+--------------+------------------------+---------------------+----------+------------+-------------+--------------+---------------+-------------+-----------------+----------------------+-----------------------+-----------------------+------------------+---------+--------------+--------------------+
| Host      | User | Password | Select_priv | Insert_priv | Update_priv | Delete_priv | Create_priv | Drop_priv | Reload_priv | Shutdown_priv | Process_priv | File_priv | Grant_priv | References_priv | Index_priv | Alter_priv | Show_db_priv | Super_priv | Create_tmp_table_priv | Lock_tables_priv | Execute_priv | Repl_slave_priv | Repl_client_priv | Create_view_priv | Show_view_priv | Create_routine_priv | Alter_routine_priv | Create_user_priv | Event_priv | Trigger_priv | Create_tablespace_priv | Delete_history_priv | ssl_type | ssl_cipher | x509_issuer | x509_subject | max_questions | max_updates | max_connections | max_user_connections | plugin                | authentication_string | password_expired | is_role | default_role | max_statement_time |
+-----------+------+----------+-------------+-------------+-------------+-------------+-------------+-----------+-------------+---------------+--------------+-----------+------------+-----------------+------------+------------+--------------+------------+-----------------------+------------------+--------------+-----------------+------------------+------------------+----------------+---------------------+--------------------+------------------+------------+--------------+------------------------+---------------------+----------+------------+-------------+--------------+---------------+-------------+-----------------+----------------------+-----------------------+-----------------------+------------------+---------+--------------+--------------------+
| localhost | root |          | Y           | Y           | Y           | Y           | Y           | Y         | Y           | Y             | Y            | Y         | Y          | Y               | Y          | Y          | Y            | Y          | Y                     | Y                | Y            | Y               | Y                | Y                | Y              | Y                   | Y                  | Y                | Y          | Y            | Y                      | Y                   |          |            |             |              |             0 |           0 |               0 |                    0 |                       |                       | N                | N       |              |           0.000000 |
| 127.0.0.1 | root |          | Y           | Y           | Y           | Y           | Y           | Y         | Y           | Y             | Y            | Y         | Y          | Y               | Y          | Y          | Y            | Y          | Y                     | Y                | Y            | Y               | Y                | Y                | Y              | Y                   | Y                  | Y                | Y          | Y            | Y                      | Y                   |          |            |             |              |             0 |           0 |               0 |                    0 |                       |                       | N                | N       |              |           0.000000 |
| ::1       | root |          | Y           | Y           | Y           | Y           | Y           | Y         | Y           | Y             | Y            | Y         | Y          | Y               | Y          | Y          | Y            | Y          | Y                     | Y                | Y            | Y               | Y                | Y                | Y              | Y                   | Y                  | Y                | Y          | Y            | Y                      | Y                   |          |            |             |              |             0 |           0 |               0 |                    0 |                       |                       | N                | N       |              |           0.000000 |
| localhost | pma  |          | N           | N           | N           | N           | N           | N         | N           | N             | N            | N         | N          | N               | N          | N          | N            | N          | N                     | N                | N            | N               | N                | N                | N              | N                   | N                  | N                | N          | N            | N                      | N                   |          |            |             |              |             0 |           0 |               0 |                    0 | mysql_native_password |                       | N                | N       |              |           0.000000 |
+-----------+------+----------+-------------+-------------+-------------+-------------+-------------+-----------+-------------+---------------+--------------+-----------+------------+-----------------+------------+------------+--------------+------------+-----------------------+------------------+--------------+-----------------+------------------+------------------+----------------+---------------------+--------------------+------------------+------------+--------------+------------------------+---------------------+----------+------------+-------------+--------------+---------------+-------------+-----------------+----------------------+-----------------------+-----------------------+------------------+---------+--------------+--------------------+
select user,host,password from mysql.user;
+------+-----------+----------+
| User | Host      | Password |
+------+-----------+----------+
| root | localhost |          |
| root | 127.0.0.1 |          |
| root | ::1       |          |
| pma  | localhost |          |
+------+-----------+----------+

root:MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| dwwm               |
| dwwm_cmfp          |
| dwwm_formateur     |
| dwwm_tim           |
| information_schema |
| mysql              | --- c'est ce qui nous interresse
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
----- Création d'utilisateur
-- Créer un utilisateur marie en local
create user marie@localhost identified by  '1234'
--pour se connecter en tant que marie
C:\> mysql -u marie -p
marie@localhost> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| test               |
+--------------------+

-- Pour donner les droits a marie
root > Grant select on dwwm.article to marie@localhost;

marie@localhost> show databases;
+--------------------+
| Database           |
+--------------------+
| dwwm               |
| information_schema |
| test               |
+--------------------+

-- Afficher les table visible par Marie
marie@localhost> show databases;
+--------------------+
| Database           |
+--------------------+
| dwwm               |
| information_schema |
| test               |
+--------------------+
marie@localhost> use dwwm;
marie@localhost> show tables;
+----------------+
| Tables_in_dwwm |
+----------------+
| article        |
+----------------+

--creer un utilisateur marie@127.0.0.1 et donner tout les droits select et insert 
-- à toutes les tables de la BDD dwwm

create user marie@'127.0.0.1' identified by '4321';
grant select,insert on dwwm.* to marie@127.0.0.1;

-- pour se connecter avec marie a l'adresse IP 127.0.0.1
c:\> mysql -u marie -h 127.0.0.1 -p

-- creation d'un admin
root> create user admin@localhost identified by "admin";
-- lui donner tout les droits
root> grant all privileges on *.* to admin@localhost;

root> set password for root@localhost=password("root");

--on peut creer en meme temps que de donner les droits 
root> grant select,insert on dwwm.* to paul@localhost identified by "paul";

--pour enlever le droit select a paul
root> revoke select on dwwm.* from paul@localhost;

--afficher les droit de paul
root> show grants for paul@localhost;

+-------------------------------------------------------------------------------------------------------------+
| Grants for paul@localhost                                                                                   |
+-------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `paul`@`localhost` IDENTIFIED BY PASSWORD '*8FE0E9C2C716ADE93D41A0C0C0E1550E142544AF' |
| GRANT INSERT ON `dwwm`.* TO `paul`@`localhost`                                                              |
+-------------------------------------------------------------------------------------------------------------+

--creation d'un groupe d'utilisation via role
create role caisse;

--donner des droits au groupe caisse
grant insert, update on dwwm.commande to caisse ;
grant select on dwwm.client to caisse;

grant select on dwwm.article to caisse;
grant select on dwwm.client to caisse;

-- creer et assigner claude au groupe caisse
grant caisse to claude@localhost identified by "claude"
--Activer le groupe caisse
set role caisse;
--Afficher le groupe en cours
select current_role;
--Desactiver le groupe en cours
set role none;