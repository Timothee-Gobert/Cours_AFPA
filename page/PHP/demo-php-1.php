<a href="demo-php-1.php?action=read&id=2">Afficher id=2</a>

<?php
    require_once("../../service/myFct-1.php");
    if(isset($_GET['action'])){ // tester si $_GET contient comme indice 'action'
        $action=$_GET['action']; // mettre dans une variable $action la valeur de $_GET['action'] 
        if($action=='read'){ // tester si action == 'read'
            $id=$_GET['id']; // mettre dans une variable $id la valeur de $_GET['id']

            /*// on va chercher l'article correspondanr à l'id = $id
            $connexion=connexion(); // valeur retourner par la fonction connexion() du fichier myFct
            $sql="select * from article where id=?"; // ecrire la requete sql correspondante
            $requete=$connexion->prepare($sql); // dire à PHP de préparer la requete sql
            $requete->execute([$id]); // executer la requete avec id = $id
            $article=$requete->fetch(); // Mettre dans $ article l'article trouvé*/

            $article=findByIdTable('article',$id);
            $sousPageHtml="../article/form.html.php";
            $variables=[
                'id'=>$article['id'],
                'numArticle'=>$article['numArticle'],
                'designation'=>$article['designation'],
                'prixUnitaire'=>$article['prixUnitaire'],
                'etat'=>null
            ];
            generatePage($sousPageHtml,$variables,"../base-bs.html.php");
        }
    }
    //print_r($_GET);
?>