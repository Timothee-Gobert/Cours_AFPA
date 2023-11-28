<?php
    require_once("service/myFct.php");
    $articles=listTable('article');
    $nbre=count($articles);
    $ligne="";
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
    $file="page/article/list.html.php";
    $variables=[
        'rows'=>$ligne,
        'nbre'=>$nbre,

    ];
    generatePage($file,$variables);

    // extract($variables);
    // ob_start();
    // require_once("page/article/list.html.php");
    // $content=ob_get_clean();
    // //----------------------------------
    // ob_start();
    // require_once("page/base.html.php");
    // $page=ob_get_clean();
    // echo $page;



?>