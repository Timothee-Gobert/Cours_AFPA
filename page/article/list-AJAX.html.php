<h1 class="titre text-white">LISTE DES ARTICLE</h1>
<a href="#modal_art" id="show_modal_art" class="hidden">Modal</a>
<div class="d-flex justify-content-between mb-4">
      <button class="btn btn-md btn-primary" onclick="creer()">Nouvel Article</button>
      <button class="btn btn-md btn-success" onclick="window.print()">Imprimer</button>
</div>
<table class="w100">
      <thead>
            <tr class='h2em'>
                  <th class='w10 border'>IMAGE</th>
                  <th class='w10 border'>CODE</th>
                  <th class='w50 border'>DESIGNATION</th>
                  <th class='w10 border'>PRIX<br>UNITAIRE</th>
                  <th class='w20 border'>ACTIONS</th>
            </tr>
      </thead>
      <tbody id="tbody_article">
            <?=$rows?>
      </tbody>

      <tfoot>
            <tr class='h2em'>
                  <th colspan="5" class='w100 border center'> Nombre articles: </th>
            </tr>
      </tfoot>
</table>
<div id="modal_art">
      <div id="modal_art_content">
            
            <h1 class="titre text-center">Saisie article</h1>
            <a href="#" id="modal_close">&times</a>
            <div action="">
                  <div class="zone_saisie my-2 text-primary fw-bold">
                        <label for="id" class="lab20">ID</label>
                        <input type="text" id="id" name="id" value="" class="form-control w20">
                  </div>
                  <div class="zone_saisie my-2 text-primary fw-bold">
                        <label for="numArticle" class="lab20">CODE</label>
                        <input type="text" id="numArticle" name="numArticle" value="" class="form-control w80">
                  </div>
                  <div class="zone_saisie my-2 text-primary fw-bold">
                        <label for="designation" class="lab20">Désignation</label>
                        <input type="text" id="designation" name="designation" value="" class="form-control w80">
                  </div>
                  <div class="zone_saisie my-2 text-primary fw-bold">
                        <label for="prixUnitaire" class="lab20">P.U.</label>
                        <input type="text" id="prixUnitaire" name="prixUnitaire" value="" class="form-control w20">
                  </div>
                  <div class="list_btn my-4 flex justify-content-between border-top">
                        <a href="#"><button id="btn_cancel" class="btn btn-md btn-primary">Annuler</button></a>
                        <button id="btn_delete" class="btn btn-md btn-danger" onclick="supprimer()">Supprimer</button>
                        <button id="btn_save" class="btn btn-md btn-success" onclick="enregistrer()">Enregistrer</button>
                  </div>
            </div>
            <div class="spinner-border" role="status" id="loader">
                  <span class="visually-hidden">Loading...</span>
            </div>
            <!-- <img src="" alt="" id="load"> -->
      </div>
</div>
<script>
      function creer(){
            id.disabled=true;
            numArticle.disabled=false;
            designation.disabled=false;
            prixUnitaire.disabled=false;
            btn_save.disabled=false;
            id.value=0;
            numArticle.value="";
            designation.value="";
            prixUnitaire.value="";
            btn_delete.disabled=true;
            show_modal_art.click();
      }
      function supprimer(){
            debutAttente();
            let xhr = new XMLHttpRequest();
            xhr.open("POST","article-ajax.php?action=delete");
            let data = new FormData();
            data.append('id',parseInt(id.value));
            xhr.send(data);
            xhr.onload=function(){
                  setTimeout("finAttente()",2000);
                  let response =xhr.responseText;
                  modal_close.click();
                  rechercher();
                  alert(response);
      }
      
}

function enregistrer(){
      debutAttente();
      let xhr = new XMLHttpRequest();
      xhr.open("POST","article-ajax.php?action=save");
      let data = new FormData();
      data.append('id',parseInt(id.value));
      data.append('numArticle',numArticle.value);
      data.append('designation',designation.value);
      data.append('prixUnitaire',prixUnitaire.value);
      xhr.send(data);
      xhr.onload=function(){
            setTimeout("finAttente()",2000);
            let response =xhr.responseText;
            modal_close.click();
            rechercher();
            alert(response);
      }
}

function touche(event) {
      if (event.keyCode == 13) {
            chercher();
            exit;
      }
}

function rechercher() {
      //alert(mot.value);
      let xhr = new XMLHttpRequest();
      xhr.open("POST", "article-ajax.php?action=search");
      let data = new FormData();
      data.append("mot", mot.value);
      xhr.send(data);
      xhr.onload = function() {
            let response = xhr.responseText;
            tbody_article.innerHTML = response;
      }
}

function modifier(article_id){
      afficher(article_id,1);
}
function afficher(article_id,etat=0) {
      // on créer un objet WMLHTTP et on le met dans xhr
      debutAttente();
      let xhr = new XMLHttpRequest();
      // Syntaxe open("methode d'envoi","adresse url pour le traitement php)
      xhr.open("POST", "article-ajax.php?action=show&id=" + article_id);
      // envoyer l'objet xhr vers php
      xhr.send();
      xhr.onload = function() {
            let response = xhr.responseText;
            response = JSON.parse(response);
            id.value = response.id;
            numArticle.value = response.numArticle;
            designation.value = response.designation;
            prixUnitaire.value = response.prixUnitaire;
            show_modal_art.click();
            // finAttente(); 
            // comme c'est trop rapide on met un timer
            setTimeout("finAttente()",2000);
            //alert(response.id + ' - ' + response.numArticle + ' - ' + response.designation);
            //console.log(response);
            if(etat==0){// etat ==0 affichage
                  id.disabled=true;
                  numArticle.disabled=true;
                  designation.disabled=true;
                  prixUnitaire.disabled=true;
                  btn_delete.disabled=true;
                  btn_save.disabled=true;
            }else{// etat <> 0 cacher
                  id.disabled=true;
                  numArticle.disabled=false;
                  designation.disabled=false;
                  prixUnitaire.disabled=false;
                  btn_delete.disabled=false;
                  btn_save.disabled=false;
            }
      }
}

function debutAttente() {
      let loader = document.getElementById("loader");
      loader.setAttribute("style", "visibility: visible");
}

function finAttente() {
      let loader = document.getElementById("loader");
      loader.setAttribute("style", "visibility: hidden");
}
</script>