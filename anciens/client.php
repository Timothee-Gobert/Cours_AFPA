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
    <div id="header">
        <ul class="niveau-h1">
            <li><a href="index.php">Accueil</a></li>
            <li><a href="article.php">Article</a></li>
            <li><a href="client.php">Client</a></li>
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
            <a href="#modal">Saisie client</a>
        </div>
    </div>
    <div id="footer">
    <h2>&copy Copyright DWWM 2023</h2>
    </div>
    <div id="modal">
            <div id="modal_client">
                <h1 class="titre text-white">SAISIE CLIENT</h1>
                <a href="" class="modal_close text-white">&times</a>
                <form action="" class="w100">
                    <div class="line-input">
                        <label for="" class="lab20">ID</label>
                        <input type="text"  class="form-input w10" disabled>
                    </div>
                    <div class="line-input">
                        <label for="" class="lab20 obligatoire">CODE</label>
                        <input type="text" class="form-input w20" required>
                    </div>
                    <div class="line-input">
                        <label for="" class="lab20 ">NOM <span class='text-red'>*</span></label>
                        <input type="text" class="form-input w70" required>
                    </div>
                    <div class="line-input">
                        <label for="" class="lab20">ADRESSE</label>
                        <input type="text" class="form-input w70">
                    </div>  
                    <div id="div_btn_client" class="flex_space_between border-top-4">
                        <input type="reset" class="btn bg_blue" name="" id="" value="Annuler">
                        <a href="" class="btn bg_red">Supprimer</a>
                        <input type="submit" class="btn bg_green" name="" id="" value="Valider">
                    </div>                                     
                </form>
            </div>



    </div>
</body>
</html>