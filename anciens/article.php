<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Document</title>
</head>
<body>
    <?php  require_once("service/myFct.php"); ?>
    <div id="header">
        <ul class="niveau-h1">
            <li><a href="index.php">Accueil</a></li>
            <li><a href="">Article</a></li>
            <li><a href="">Client</a></li>
            <li><a href="">Commande <span>&#9660;</span></a>
                <ul class="niveau-h2">
                    <li><a href="">Facture</a></li>
                    <li><a href="">Appro</a></li>
                    <li><a href="">Devis</a></li>
                </ul>
            </li>
            <li><a href="">Parametre</a></li>
        </ul>
    </div>
    <div id="main">
        <div id="aside">
            <div class="center" id="logo">
             <img src="img/Logo_Afpa.jpg" width="75%" alt="">
            </div>
            <ul class="niveau-v1">
                <li><a href="">Caisse</a></li>
                <li><a href="">Controle<span>&#9660;</span></a>
                    <ul class="niveau-v2">
                        <li><a href="">Caisse</a></li>
                        <li><a href="">Stock</a></li>
                        <li><a href="">Cheque</a></li>
                    </ul>
            
                </li>
                <li><a href="">Inventaire</a></li>
                <li><a href="">Fermerture</a></li>
            </ul>
            
        </div>
        <div id="section">
            <?php
                $id=3; // par exemple
                $connexion=connexion();
                $sql="select * from article where id=?";
                $requete=$connexion->prepare($sql);
                $requete->execute([$id]);
                $article=$requete->fetch();
                extract($article);
                // $id=$article['id'];
                // $numArticle=$article['numArticle'];
                // $designation=$article['designation'];
                // $prixUnitaire=$article['prixUnitaire'];

            
            ?>
            <a href="#modal_article">Modal</a>
            <h1 class='titre' >LISTE ARTICLE</h1>
            <div class="flex_space_between">
                <a href="" class='btn bg_navy'>Nouvel article</a>
                <a href="" class='btn bg_navy' onclick="window.print()">Imprimer</a>
            </div>
            <?php
                $articles=listTable('article');
                $ligne="
                    <table class='w100'>
                        <tr class='h2em'>
                            <th class='w10 border'>IMAGE</th>
                            <th class='w10 border'>CODE</th>
                            <th class='w50 border'>DESIGNATION</th>
                            <th class='w10 border'>PRIX<br>UNITAIRE</th>
                            <th class='w20 border'>ACTIONS</th>
                        </tr>
                ";

                foreach($articles as $valeur){
                    $numArticle=$valeur['numArticle'];
                    $designation=$valeur['designation'];
                    $prixUnitaire=$valeur['prixUnitaire'];
                    $actions="<a href='' class='btn_action bg_navy'>Afficher</a> <a href='' class='btn_action bg_blue'> Modifier</a> <a href='' class='btn_action bg_red'>Supprimer</a>";
                    $ligne.="
                        <tr class='h2em'>
                            <td class='border center'><img class='zoom' src='img/bb0001.png' width='20%' alt='' /></td>
                            <td class='border center'>$numArticle</td>
                            <td class='border'>$designation</td>
                            <td class='border right'>$prixUnitaire</td>
                            <td class='border flex_space_between'>$actions</td>
                         </tr>
                    ";
                }
                $ligne.="</table>";
                echo $ligne;
            ?>
            <?php
                $id=2; // par exemple
                $connexion=connexion();
                $sql="select * from article where id=?";
                $requete=$connexion->prepare($sql);
                $requete->execute([$id]);
                $article=$requete->fetch();
                extract($article);
                // $id=$article['id'];
                // $numArticle=$article['numArticle'];
                // $designation=$article['designation'];
                // $prixUnitaire=$article['prixUnitaire'];

            
            ?>
        </div>
    </div>
    <div id="footer">
    <h2>Footer</h2>
    </div>
    <div id="modal_article">
        <h1 class="titre text-white">SAISIE ARTICLE</h1>
        <a href="" class="text-white modal_close">&times</a>
        <table class="w100 text-white">
                <tr>
                    <td class="w20 text-1_25em">ID</td>
                    <td><input type="text" class="form-input w20 text-navy" value="<?=$id?>" disabled></td>
                </tr>
                <tr>
                    <td class="w20 text-1_25em obligatoire">CODE</td>
                    <td><input type="text" class="form-input w20" value="<?=$numArticle?>" ></td>
                </tr>
                <tr>
                    <td class="w20 text-1_25em obligatoire">DESIGNATION</td>
                    <td><input type="text" class="form-input w80" value="<?=$designation?>"></td>
                </tr>  
                <tr>
                    <td class="w20 text-1_25em">PU</td>
                    <td><input type="text" class="form-input w20 right" value="<?=$prixUnitaire?>"></td>
                </tr>                              
        </table>
        <div id="div_btn_article" class="flex_space_between border-top-2">
                <a href="" class="btn bg_blue">Annuler</a>
                <a href="" class="btn bg_red">Supprimer</a>
                <a href="" class="btn bg_green">Valider</a>
        </div>
    </div>
</body>
</html>