<?php
   include_once("service/myFct.php");  // Charger une seule fois le fichier myFCt.php

    //$connexion=connexion();
    // $sql="select * from article";
    // $requete=$connexion->prepare($sql);
    // $requete->execute();
    // $articles=$requete->fetchAll();
    $articles=listTable('article');
    foreach($articles as $valeur){
        extract($valeur);
        /*$id=$valeur['id'];
        $numArticle=$valeur['numArticle'];
        $designation=$valeur['designation'];
        $prixUnitaire=$valeur['prixUnitaire'];*/

        /*
            $id=$valeur[0];
            $numArticle=$valeur[1];
            $designation=$valeur[2];
            $prixUnitaire=$valeur[3];

        */
        echo "<h1>| $id | $numArticle | $designation | $prixUnitaire |</h1>";

    }
   // printr($articles);



?>