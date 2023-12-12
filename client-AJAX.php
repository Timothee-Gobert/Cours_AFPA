<?php
    require_once("./service/myFct.php");

    $action='list';
    $sousPageHtml="./page/client/form.html.php";
    extract($_GET);

    switch($action){
        //-------------------AJAX-------------------
        case "save":
            $response_json=json_encode($_POST);
            extract($_POST);
            $connexion=connexion();
            if($id==0){
                $sql="insert into client (numClient,nomClient,adresseClient) value (?,?,?)";
                $requete=$connexion->prepare($sql);
                $requete->execute([$numClient,$nomClient,$adresseClient]);
            }else{
                $sql="update client set numClient=?,nomClient=?,adresseClient=? where id=?";
                $requete=$connexion->prepare($sql);
                $requete->execute([$numClient,$nomClient,$adresseClient,$id]);
            }
            echo $response_json;
            exit;
            break;
        case "search":
            $mot=$_POST['mot'];
            $connexion=connexion();
            $sql="select * from client where numClient like ? or nomClient like ?";
            $requete=$connexion->prepare($sql);
            $requete->execute(["%$mot%","%$mot%"]);
            $client=$requete->fetchAll();
            $nbre=count($client);
            $ligne="";
            foreach($client as $valeur){
                $id=$valeur['id'];
                $numClient=$valeur['numClient'];
                $nomClient=$valeur['nomClient'];
                $adresseClient=$valeur['adresseClient'];
                $actions=
                "<a href='javascript:afficher($id)' class='btn_action bg_navy'>Afficher</a> 
                <a href='javascript:modifier($id)' class='btn_action bg_blue'> Modifier</a> 
                <a href='javascript:supprimer($id)' class='btn_action bg_red'>Supprimer</a>";
                $ligne.="
                    <tr class='h2em'>
                        <td class='border center'><img class='zoom' src='img/bb0001.png' width='20%' alt='' /></td>
                        <td class='border center'>$numClient</td>
                        <td class='border'>$nomClient</td>
                        <td class='border right'>$adresseClient</td>
                        <td class='border flex_space_between'>$actions</td>
                    </tr>
                ";
            }
            echo ($ligne);
            exit;
            break;
        case "show":
            $id=$_GET['id'];
            $client=findByIdTable("client",$id);
            $client_json=json_encode($client);
            echo $client_json; // envoi de message vers ajax-javascript
            exit;
            break;
        //------------------------------------------
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
                $sousPageHtml="./page/client/list.html.php";
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

    $clients=listTable('client');
    $nbre=count($clients);
    $ligne="";
    foreach($clients as $valeur){
        $id=$valeur['id'];
        $numClient=$valeur['numClient'];
        $nomClient=$valeur['nomClient'];
        $adresseClient=$valeur['adresseClient'];
        $actions=
        "<a href='javascript:afficher($id)' class='btn_action bg_navy'>Afficher</a> 
        <a href='javascript:modifier($id)' class='btn_action bg_blue'> Modifier</a> 
        <a href='javascript:supprimer($id)' class='btn_action bg_red'>Supprimer</a>";
        $ligne.="
            <tr class='h2em'>
                <td class='border center'><img class='zoom' src='img/bb0001.png' width='20%' alt='' /></td>
                <td class='border center'>$numClient</td>
                <td class='border'>$nomClient</td>
                <td class='border right'>$adresseClient</td>
                <td class='border flex_space_between'>$actions</td>
             </tr>
        ";
    }
    $sousPageHtml="page/client/list-client-AJAX.html.php";
    $variables=[
        'rows'=>$ligne,
        'nbre'=>$nbre,

    ];
    generatePage($sousPageHtml,$variables);

    // extract($variables);
    // ob_start();
    // require_once("page/client/list.html.php");
    // $content=ob_get_clean();
    // //----------------------------------
    // ob_start();
    // require_once("page/base.html.php");
    // $page=ob_get_clean();
    // echo $page;



?>