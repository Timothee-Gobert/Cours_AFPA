<?php
//------------tableau associatif---
$groupes=[
    ['nom'=>'Paul','prenom'=>'René','age'=>20,'grade'=>'Sergent'],
    ['nom'=>'Paul','prenom'=>'Marie','age'=>21,'grade'=>'Sergent'],
    ['nom'=>'Paul','prenom'=>'Brigitte','age'=>25,'grade'=>'Sergent'],
    ['nom'=>'Dupont','prenom'=>'Bernard','age'=>32,'grade'=>'Sergent'],
    ['nom'=>'Dupont','prenom'=>'Georges','age'=>34,'grade'=>'Sergent']
];
printr($groupes);
die;

//------------
$groupes=[
    ['Paul','René',20,'Sergent'],
    ['Paul','Marie',21,'Sergent'],
    ['Paul','Brigitte',25,'Sergent'],
    ['Dupont','Bernard',32,'Sergent'],
    ['Dupont','Georges',34,'Sergent']
];

printr($groupes);

die;

//-----------------------------------
    $stagiaires=['Paul','René',20,'Sergent'];
    foreach($stagiaires as $valeur){
        echo "<h1>$valeur</h1>";
    }
    var_dump($stagiaires);
    echo "<br>";
    print_r($stagiaires);

    printr($stagiaires);
    // echo "<pre>";
    // print_r($stagiaires);
    // echo "</pre>";

    function printr($tableau){
        echo "<pre>";
        print_r($tableau);
        echo "</pre>";

    }

?>