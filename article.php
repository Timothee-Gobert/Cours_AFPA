<?php
    require_once("service/myFct.php");

    $action='list';
    $sousPageHtml="page/article/form.html.php";
    extract($_GET);

    switch($action){
        case 'afficher':
            $id=$_GET['id'];
            $article=findByIdTable('article',$id);
            $variables=[
                'id'=>$article['id'],
                'numArticle'=>$article['numArticle'],
                'designation'=>$article['designation'],
                'prixUnitaire'=>$article['prixUnitaire'],
                'etat'=>'disabled',
            ];
            generatePage($sousPageHtml,$variables);
            break;
        case 'modifier':
            $id=$_GET['id'];
            $article=findByIdTable('article',$id);
            $variables=[
                'id'=>$article['id'],
                'numArticle'=>$article['numArticle'],
                'designation'=>$article['designation'],
                'prixUnitaire'=>$article['prixUnitaire'],
                'etat'=>'',
            ];
            generatePage($sousPageHtml,$variables);
            break;
        case 'creer':
            $variables=[
                'id'=>'',
                'numArticle'=>'',
                'designation'=>'',
                'prixUnitaire'=>'',
                'etat'=>'',
            ];
            generatePage($sousPageHtml,$variables);
            break;
        case 'supprimer':
            $id=$_GET['id'];
            $test=testDelete($id);
            if($test){
                deleteByIdTable('article',$id);
                $sousPageHtml="page/article/list.html.php";
                generatePage($sousPageHtml);
            }else{
                $sousPageHtml="page/erreur/erreur.html.php";
                $variables=[
                    'message'=>"<h2 class='text-red'>Impossible de supprimer cet article</h2>",
                ];
            }
            break;
        default:

        break;
    }

    $articles=listTable('article');
    $nbre=count($articles);
    $ligne="";
    foreach($articles as $valeur){
        $id=$valeur['id'];
        $numArticle=$valeur['numArticle'];
        $designation=$valeur['designation'];
        $prixUnitaire=$valeur['prixUnitaire'];
        $actions=
        "<a href='article.php?action=afficher&id=$id' class='btn_action bg_navy'>Afficher</a> 
        <a href='article.php?action=modifier&id=$id' class='btn_action bg_blue'> Modifier</a> 
        <a href='article.php?action=supprimer&id=$id' class='btn_action bg_red'>Supprimer</a>";
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
    $sousPageHtml="page/article/list.html.php";
    $variables=[
        'rows'=>$ligne,
        'nbre'=>$nbre,

    ];
    generatePage($sousPageHtml,$variables);

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