<?php
    $i="Article";
    require_once("service/myFct.php");

    $action='list';
    $sousPageHtml="page/$i/form.html.php";
    extract($_GET);

    switch($action){
        case 'afficher':
            $id=$_GET['id'];
            $$i=findByIdTable($i,$id);
            $variables=[
                'id'=>$$i['id'],
                'num'+$i=>$$i['num'+$i],
                'designation'=>$$i['designation'],
                'prixUnitaire'=>$$i['prixUnitaire'],
                'etat'=>'disabled',
            ];
            generatePage($sousPageHtml,$variables);
            break;
        case 'modifier':
            $id=$_GET['id'];
            $$i=findByIdTable($i,$id);
            $variables=[
                'id'=>$$i['id'],
                'num'+$i=>$$i['num'+$i],
                'designation'=>$$i['designation'],
                'prixUnitaire'=>$$i['prixUnitaire'],
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
                deleteByIdTable($i,$id);
                $sousPageHtml="page/$i/list.html.php";
                generatePage($sousPageHtml);
            }else{
                $sousPageHtml="page/erreur/erreur.html.php";
                $variables=[
                    'message'=>"<h2 class='text-red'>Impossible de supprimer cet $i</h2>",
                ];
            }
            break;
        default:

        break;
    }
    $i="Article";
    $$i=listTable($i);
    $nbre=count($$i);
    $ligne="";
    foreach($$i as $valeur){
        $id=$valeur['id'];
        $numArticle=$valeur['numArticle'];
        $designation=$valeur['designation'];
        $prixUnitaire=$valeur['prixUnitaire'];
        $actions=
        "<a href='$i.php?action=afficher&id=$id' class='btn_action bg_navy'>Afficher</a> 
        <a href='$i.php?action=modifier&id=$id' class='btn_action bg_blue'> Modifier</a> 
        <a href='$i.php?action=supprimer&id=$id' class='btn_action bg_red'>Supprimer</a>";
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
    $sousPageHtml="page/$i/list.html.php";
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