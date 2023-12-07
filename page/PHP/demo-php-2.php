<a href="demo.php?action=read&id=2">Afficher id=2</a>
<a href="demo.php?action=update&id=4">Modifier id=4</a>
<a href="demo.php?action=delete&id=5">Supprimer id=5</a>

<?php
    require_once("../../service/myFct.php");
    if(isset($_GET['action'])){ // tester si $_GET contient comme indice 'action'
        $action=$_GET['action']; // mettre dans une variable $action la valeur de $_GET['action'] 
        switch($action){
            case'read':
                $id=$_GET['id']; // mettre dans une variable $id la valeur de $_GET['id']
                $article=findByIdTable('article',$id);
                $sousPageHtml="page/article/form.html.php";
                $variables=[
                    'id'=>$article['id'],
                    'numArticle'=>$article['numArticle'],
                    'designation'=>$article['designation'],
                    'prixUnitaire'=>$article['prixUnitaire'],
                    'etat'=>'disabled',
                ];
                generatePage($sousPageHtml,$variables);
                break;
            case'update':
                $id=$_GET['id']; // mettre dans une variable $id la valeur de $_GET['id']
                $article=findByIdTable('article',$id);
                $sousPageHtml="page/article/form.html.php";
                $variables=[
                    'id'=>$article['id'],
                    'numArticle'=>$article['numArticle'],
                    'designation'=>$article['designation'],
                    'prixUnitaire'=>$article['prixUnitaire'],
                    'etat'=>'',
                ];
                generatePage($sousPageHtml,$variables);
                break;
            case'delete':
                $id=$_GET['id']; // mettre dans une variable $id la valeur de $_GET['id']
                $test=testDelete($id);
                    if($test){
                        deleteByIdTable('article',$id);
                        $sousPageHtml="page/article/form.html.php";
                        generatePage($sousPageHtml);
                    }else{
                        $sousPageHtml="page/erreur/erreur.html.php";
                        $variables=[
                            'message'=>"Impossible de supprimer cet article !",
                        ];
                        generatePage($sousPageHtml,$variables);
                    }
                break;
            case'list':
                $sousPageHtml="page/article/form.html.php";
                generatePage($sousPageHtml);
                break;
        }
    }    

    //---------- MES FONCTIONS ---------------------



        /*if($action=='read'){ // tester si action == 'read'
            $id=$_GET['id']; // mettre dans une variable $id la valeur de $_GET['id']

            
            $article=findByIdTable('article',$id);
            $sousPageHtml="page/article/form.html.php";
            $variables=[
                'id'=>$article['id'],
                'numArticle'=>$article['numArticle'],
                'designation'=>$article['designation'],
                'prixUnitaire'=>$article['prixUnitaire']
            ];
            generatePage($sousPageHtml,$variables);
        }*/
    
    //print_r($_GET);
?>