<h1 class="titre text-white">SAISIE CLIENT</h1>
<a href="" class="text-white modal_close">&times</a>
<a href="client.php?action=creer" class="btn bg-green"></a>
<table class="w100 text-white">
    <tr>
        <td class="w20 text-1_25em">ID</td>
        <td><input type="text" class="form-input w20 text-navy" value="<?=$id?>" disabled></td>
    </tr>
    <tr>
        <td class="w20 text-1_25em obligatoire">N° Client</td>
        <td><input type="text" class="form-input w20" value="<?=$numClient?>" <?=$etat?>></td>
    </tr>
    <tr>
        <td class="w20 text-1_25em obligatoire">Nom Client</td>
        <td><input type="text" class="form-input w80" value="<?=$nomClient?>" <?=$etat?>></td>
    </tr>
    <tr>
        <td class="w20 text-1_25em">PU</td>
        <td><input type="text" class="form-input w20 right" value="<?=$adresseClient?>" <?=$etat?>></td>
    </tr>
</table>
<div id="div_btn_client" class="flex_space_between border-top-2">
    <a href="client.php" class="btn bg_green">Retour à la liste</a>
    <a href="" class="btn bg_blue">Annuler</a>
    <a href="" class="btn bg_red" <?=$etat?>>Supprimer</a>
    <input type="submit" class="btn bg_green" <?=$etat?> value="Valider">
</div>