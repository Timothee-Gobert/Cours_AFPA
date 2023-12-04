<?php
require_once("config.php");
// nouvelle facon de se connecter avec filezilla

function connexion($host=HOST,$dbname=DBNAME,$user=USER,$password=PASSWORD){
    $dns="mysql:host=$host;dbname=$dbname;charset=utf8";
    try{
        $connexion=new PDO($dns,$user,$password);
    }catch(Exception $e){
        echo "<h1> Connexion impossible ! Verifiez les paramètres !</h1>";
        die;
    }
    return $connexion;
}

/* encienne facon de se connecter sans file zilla (sans etre a distance)

function connexion(){
    $dns="mysql:host=localhost;dbname=dwwm;charset=utf8";
    try{
        $connexion=new PDO($dns,'root','root');
    }catch(Exception $e){
        echo "<h1> Connexion impossible ! Verifiez les paramètres !</h1>";
        die;
    }
    return $connexion;
}

function printr($tableau){
    echo "<pre>";
    print_r($tableau);
    echo "</pre>";
}
*/

function findByIdTable($nomTable,$id){
    $connexion=connexion(); // valeur retourner par la fonction connexion() du fichier myFct
    $sql="select * from $nomTable where id=?"; // ecrire la requete sql correspondante
    $requete=$connexion->prepare($sql); // dire à PHP de préparer la requete sql
    $requete->execute([$id]); // executer la requete avec id = $id
    $resultat=$requete->fetch(); // Mettre dans $ article l'article trouvé
    return $resultat;
}

function deleteByIdTable($nomTable,$id){
    $connexion=connexion();
    $sql="delete from $nomTable where id=?";
    $requete=$connexion->prepare($sql);
    $requete->execute([$id]);
    return true;
}

function generatePage($file,$variables=[],$base="page/base.html.php"){  // generation d'une page
    // $file  : fichier html
    //$variables  : une variable en tableau qui contnient comme indices les noms des variables utilisées par $file
    //Exemple ['x'=>2,'y'=>5,'z'=>10]   . avec extract($variables) , on a $x=2;  $y=5 et $z=10
    if(file_exists($file)){   // if faut verifier si le $file existe ou non
        //cas de $file existe
        extract($variables);
        ob_start();   // Ouvrir   la memoire tampon pour contenir lfichier $file à transformer en texte
        require_once($file);
        $content=ob_get_clean();
        //------------
        //---Ouvrir à nouveau la memoir tampon pour recevoir le fichier $base ave la variable $content
        ob_start();
        require_once($base);
        $page=ob_get_clean();
        echo $page;
    }else{
        // cas où le fichier $file n'existe pas
        echo "<h1>Desolé! Le fichier $file n'existe pas!</h1>"; 
        die;
    }
}

function printr($tableau){
    echo "<pre>";
    print_r($tableau);
    echo "</pre>";
}

function listTable($nomTable){
    $sql="select * from $nomTable";
    $connexion=connexion();
    $requete=$connexion->prepare($sql);
    $requete->execute();
    $tables=$requete->fetchAll();
    return $tables;
}

function testDelete($id){
    $connexion=connexion();
    $sql="select * from ligneCommande where article_id=?";
    $requete=$connexion->prepare($sql);
    $requete->execute([$id]);
    $resultat=$requete->fetch();
    if($resultat){
        return false;
    }else{
        return true;
    }
}
?>