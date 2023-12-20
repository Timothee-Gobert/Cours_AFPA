<h1 class="titre text-white">LISTE DES Client</h1>
<a href="#modal_clt" id="show_modal_clt" class="hidden">Modal</a>
<div class="d-flex justify-content-between mb-4">
      <button class="btn btn-md btn-primary" onclick="creer()">Nouveau Client</button>
      <button class="btn btn-md btn-success" onclick="window.print()">Imprimer</button>
</div>
<table class="table table-striped table-hover w100">
      <thead>
            <tr class='h2em'>
                  <th class='w10 border'>IMAGE</th>
                  <th class='w10 border'>N° Client</th>
                  <th class='w10 border'>Nom</th>
                  <th class='w30 border'>Adresse</th>
                  <th class='w20 border'>ACTIONS</th>
            </tr>
      </thead>
      <tbody id="tbody_client">
            <?=$rows?>
      </tbody>

      <tfoot>
            <tr class='h2em'>
                  <th colspan="5" class='w100 border center'> Nombre clients: <span id="nbre_client"><?=$nbre?></span> </th>
            </tr>
      </tfoot>
</table>
<div id="modal_clt">
      <div id="modal_clt_content">
            
            <h1 class="titre text-center">Saisie client</h1>
            <a href="#" id="modal_close">&times</a>
            <div action="">
                  <div class="zone_saisie my-2 text-primary fw-bold">
                        <label for="id" class="lab20">ID</label>
                        <input type="text" id="id" name="id" value="" class="form-control w20">
                  </div>
                  <div class="zone_saisie my-2 text-primary fw-bold">
                        <label for="numClient" class="lab20">N° Client</label>
                        <input type="text" id="numClient" name="numClient" value="" class="form-control w80">
                  </div>
                  <div class="zone_saisie my-2 text-primary fw-bold">
                        <label for="nomClient" class="lab20">Nom</label>
                        <input type="text" id="nomClient" name="nomClient" value="" class="form-control w80">
                  </div>
                  <div class="zone_saisie my-2 text-primary fw-bold">
                        <label for="adresseClient" class="lab20">Adresse</label>
                        <input type="text" id="adresseClient" name="adresseClient" value="" class="form-control w80">
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
            numClient.disabled=false;
            nomClient.disabled=false;
            adresseClient.disabled=false;
            btn_save.disabled=false;
            btn_delete.disabled=true;
            id.value=0;
            numClient.value="";
            nomClient.value="";
            adresseClient.value="";
            show_modal_clt.click();
      }
      function supprimer(){
            debutAttente();
            let xhr = new XMLHttpRequest();
            xhr.open("POST","client-ajax.php?action=delete");
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
      xhr.open("POST","client-ajax.php?action=save");
      let data = new FormData();
      data.append('id',parseInt(id.value));
      data.append('numClient',numClient.value);
      data.append('nomClient',nomClient.value);
      data.append('adresseClient',adresseClient.value);
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
      xhr.open("POST", "client-ajax.php?action=search");
      let data = new FormData();
      data.append("mot", mot.value);
      xhr.send(data);
      xhr.onload = function() {
            let response = xhr.responseText;
            tbody_client.innerHTML = response;
      }
}
function modifier(client_id){
      afficher(client_id,1);
}
function afficher(client_id,etat=0) {
      // on créer un objet WMLHTTP et on le met dans xhr
      debutAttente();
      let xhr = new XMLHttpRequest();
      // Syntaxe open("methode d'envoi","adresse url pour le traitement php)
      xhr.open("POST", "client-ajax.php?action=show&id=" + client_id);
      // envoyer l'objet xhr vers php
      xhr.send();
      xhr.onload = function() {
            let response = xhr.responseText;
            response = JSON.parse(response);
            id.value = response.id;
            numClient.value = response.numClient;
            nomClient.value = response.nomClient;
            adresseClient.value = response.adresseClient;
            show_modal_clt.click();
            // finAttente(); 
            // comme c'est trop rapide on met un timer
            setTimeout("finAttente()",2000);
            //alert(response.id + ' - ' + response.numClient + ' - ' + response.nomClient);
            //console.log(response);
            if(etat==0){
                  id.disabled=true;
                  numClient.disabled=true;
                  nomClient.disabled=true;
                  adresseClient.disabled=true;
                  btn_delete.disabled=true;
                  btn_save.disabled=true;
            }else{
                  id.disabled=true;
                  numClient.disabled=false;
                  nomClient.disabled=false;
                  adresseClient.disabled=false;
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