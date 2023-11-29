<h1 class="titre text-white">SAISIE ARTICLE</h1>
        <a href="" class="text-white modal_close">&times</a>
        <table class="w100 text-white">
                <tr>
                    <td class="w20 text-1_25em">ID</td>
                    <td><input type="text" class="form-input w20 text-navy" value="<?=$id?>" disabled></td>
                </tr>
                <tr>
                    <td class="w20 text-1_25em obligatoire">CODE</td>
                    <td><input type="text" class="form-input w20" value="<?=$numArticle?>" ></td>
                </tr>
                <tr>
                    <td class="w20 text-1_25em obligatoire">DESIGNATION</td>
                    <td><input type="text" class="form-input w80" value="<?=$designation?>"></td>
                </tr>  
                <tr>
                    <td class="w20 text-1_25em">PU</td>
                    <td><input type="text" class="form-input w20 right" value="<?=$prixUnitaire?>"></td>
                </tr>                              
        </table>
        <div id="div_btn_article" class="flex_space_between border-top-2">
                <a href="" class="btn bg_blue">Annuler</a>
                <a href="" class="btn bg_red">Supprimer</a>
                <a href="" class="btn bg_green">Valider</a>
        </div>