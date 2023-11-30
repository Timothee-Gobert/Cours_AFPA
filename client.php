<?php
    require_once("service/myFct.php");

    $action='list';
    $sousPageHtml="page/client/form.html.php";
    extract($_GET);

    switch($action){
        case 'afficher':
            $id=$_GET['id'];
            $client=findByIdTable('client',$id);
            $variables=[
                'id'=>$client['id'],
                'numClient'=>$client['numClient'],
                'nomClient'=>$client['nomClient'],
                'adresseClient'=>$client['adresseClient'],
                'etat'=>'disabled',
            ];
            generatePage($sousPageHtml,$variables);
            break;
        case 'modifier':
            $id=$_GET['id'];
            $client=findByIdTable('client',$id);
            $variables=[
                'id'=>$client['id'],
                'numClient'=>$client['numClient'],
                'nomClient'=>$client['nomClient'],
                'adresseClient'=>$client['adresseClient'],
                'etat'=>'',
            ];
            generatePage($sousPageHtml,$variables);
            break;
        case 'creer':
            $variables=[
                'id'=>'',
                'numClient'=>'',
                'nomClient'=>'',
                'adresseClient'=>'',
                'etat'=>'',
            ];
            generatePage($sousPageHtml,$variables);
            break;
        case 'supprimer':
            $id=$_GET['id'];
            $test=testDelete($id);
            if($test){
                deleteByIdTable('client',$id);
                $sousPageHtml="page/client/list.html.php";
                generatePage($sousPageHtml);
            }else{
                $sousPageHtml="page/erreur/erreur.html.php";
                $variables=[
                    'message'=>"<h2 class='text-red'>Impossible de supprimer ce client</h2>",
                ];
            }
            break;
        default:

        break;
    }

    $client=listTable('client');
    $nbre=count($client);
    $ligne="";
    foreach($client as $valeur){
        $id=$valeur['id'];
        $numClient=$valeur['numClient'];
        $nomClient=$valeur['nomClient'];
        $adresseClient=$valeur['adresseClient'];
        $actions=
        "<a href='client.php?action=afficher&id=$id' class='btn_action bg_navy'>Afficher</a> 
        <a href='client.php?action=modifier&id=$id' class='btn_action bg_blue'> Modifier</a> 
        <a href='client.php?action=supprimer&id=$id' class='btn_action bg_red'>Supprimer</a>";
        $ligne.="
            <tr class='h2em'>
                <td class='border center'>$numClient</td>
                <td class='border'>$nomClient</td>
                <td class='border right'>$adresseClient</td>
                <td class='border flex_space_between'>$actions</td>
             </tr>
        ";
    }
    $sousPageHtml="page/client/list.html.php";
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