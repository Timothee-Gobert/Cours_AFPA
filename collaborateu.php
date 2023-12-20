<?php
    require_once("service/myFct.php");
    $base="page/base-bs-no-aside.html.php";
    $action="";
    extract($_GET);
    switch($action){
        case "show":
            $file="page/collaborateur/form.html.php";
            $id=1; // un exemple
            $collaborateur=findByIdTable('collaborateur',$id);
            //$variables=[];
            generatePage($file,$collaborateur,$base);
            break;
        default:
        $file="page/collaborateur/list.html.php";
        /* on aurait du faire 
        $variables=[
            'nom'=>'RABE',
            'prenom'=>'Randria',
        ];*/
        $variables=getDescribeTable('collaborateur');
        generatePage($file,$variables,$base);
        break;
    }
?>