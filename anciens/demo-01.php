<?php
//----variable tableau 
$jours=['Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi','Dimanche'];

echo $jours[0];

foreach($jours as $valeur){
    echo "<h1>$valeur</h1>";
}


die;
//------------------
    $ligne="<table style='border-collapse:collapse;width:100%;'>";
    $ligne.="
        <tr>
            <th style='border:1px solid black;width:10%;'>IMAGE</th>
            <th style='border:1px solid black;width:10%;'>CODE</th>
            <th style='border:1px solid black;'>DESIGNATION</th>
            <th style='border:1px solid black;width:10%'>PU</th>            
        </tr>
    ";
    $ligne.="
        <tr>
            <td style='border:1px solid black;text-align:center;'><img src='img/bb0001.png' width='25%' alt='' /></td>
            <td style='border:1px solid black;'>BB0001</td>
            <td style='border:1px solid black;'>Biere castel 350ml</td>
            <td style='border:1px solid black;'>2.50</td>            
        </tr>
    ";
    $ligne.="</table>";
    echo $ligne;

die;

//-----
    $ligne="<table>";
    $ligne=$ligne."
        <tr>
            <th>IMAGE</th>
            <th>CODE</th>
            <th>DESIGNATION</th>
            <th>PU</th>            
        </tr>
    ";
    $ligne=$ligne."
        <tr>
            <td></td>
            <td>BB0001</td>
            <td>Biere castel 350ml</td>
            <td>2.50</td>            
        </tr>
    ";
    $ligne=$ligne."</table>";
    echo $ligne;


    die;
    //------
    $nom="Dupont";
    $prenom="Charles"; 

    echo "<h2 style='color:red;'>Bonjour Monsieur $nom $prenom</h2>";
    die;
 //--------------
    $x=10;
    $y=20;
    $z=$x+$y;
    //$z="<h1>".$x." + " .$y." = ".$x+$y."</h1>";
    $w ="<h1> $x + $y = $z  </h1>";
    echo $w;


?>