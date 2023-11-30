<h1 class="titre text-white">LISTE DES Clients</h1>
<?php
    $i="client"
?>
<table class="w100">
    <thead>
        <tr class='h2em'>
            <th class='w10 border'>N° Client</th>
            <th class='w10 border'>Nom Client</th>
            <th class='w40 border'>Adresse Client</th>
            <th class='w40 border'>ACTIONS</th>
        </tr>
    </thead>
    <tbody>
        <?=$rows?>
    </tbody>

    <tfoot>
        <tr class='h2em'>
            <th colspan="5" class='w100 border center'> Nombre <?=$i?>:<?=$nbre?> </th>
        </tr>      
    </tfoot>
</table>

