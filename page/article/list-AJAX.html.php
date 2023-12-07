<h1 class="titre text-white">LISTE DES ARTICLE</h1>
<a href="#modal_art" id="show_modal_art">Modal</a>
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
                  <th colspan="5" class='w100 border center'> Nombre articles:6 </th>
            </tr>
      </tfoot>
</table>
<div id="modal_art">
      <div id="modal_art_content">
            <h1 class="titre text-center">Saisie article</h1>
            <a href="#" id="modal_close">&times</a>
            <form action="">
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
                        <button class="btn btn-md btn-primary">Annuler</button>
                        <button class="btn btn-md btn-danger">Supprimer</button>
                        <button class="btn btn-md btn-success">Enregistrer</button>
                  </div>
            </form>
      </div>
</div>
<script>
    function touche(event){
        if(event.keyCode==13){
            chercher();
            exit;
        }
    }
function rechercher() {
    //alert(mot.value);
    let xhr=new XMLHttpRequest();
    xhr.open("POST","article-ajax.php?action=search");
    let data=new FormData();
    data.append("mot",mot.value);
    xhr.send(data);
    xhr.onload=function(){
        let response=xhr.responseText;
        tbody_article.innerHTML=response;
    }
}

function afficher(article_id) {
      // on créer un objet WMLHTTP et on le met dans xhr
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

            //alert(response.id + ' - ' + response.numArticle + ' - ' + response.designation);
            //console.log(response);
      }
}
</script>