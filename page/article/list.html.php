<h1 class="titre text-white">LISTE DES ARTICLE</h1>
<table class="w100">
    <thead>
        <tr class='h2em'>
            <th class='w10 border'>IMAGE</th>
            <th class='w10 border'>CODE</th>
            <th class='w20 border'>DESIGNATION</th>
            <th class='w10 border'>PRIX<br>UNITAIRE</th>
            <th class='w20 border'>ACTIONS</th>
        </tr>
    </thead>
    <tbody>
        <?=$rows?>
    </tbody>

    <tfoot>
        <tr class='h2em'>
            <th colspan="5" class='w100 border center'> Nombre articles:<?=$nbre?> </th>
        </tr>      
    </tfoot>
</table>

