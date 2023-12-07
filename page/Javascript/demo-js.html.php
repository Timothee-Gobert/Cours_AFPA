<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="./js/demo.js" defer></script>
    <title>Document</title>

    <style>
    .bouton-green {
        width: 220px;
        line-height: 80px;
        border-radius: 5px;
        background: green;
        color: white;
    }
    </style>
</head>

<body>
    <button id="btn1">bleu</button>
    <button id="btn2">Red</button>
    <button id="btn3">Green</button>
    <button id="btn4">Violet</button>
    <br><br>
    <label for="">Nom</label>
    <input type="text" id="nom" name="nom" value="">

    <br><br>

    <button class="bouton-green" onclick="remplir()">Remplir</button>
    <br><br>
    <p id="desc"></p>
    <br><br>

    <button class="" onclick="supprimer()">Supprimer</button>
    <br><br><br><br>
    <label for="">X</label>
    <input type="text" id="x" name="x" value="">
    <br>
    <label for="">Y</label>
    <input type="text" id="y" name="y" value="">
    <br>
    <fieldset>
        <legend>Select an operator:</legend>
        <div>
            <input type="radio" id="plus" name="operator" value="plus" />
            <label for="plus">+</label>
            <br>
            <input type="radio" id="moins" name="operator" value="moins" />
            <label for="moins">-</label>
            <br>
            <input type="radio" id="divi" name="operator" value="divi" />
            <label for="divi">/</label>
        </div>
    </fieldset>
    <br>
    <label for="">Résultat</label>
    <input type="text" id="somme" name="somme" value="">
    <br>
    <button class="bouton-green" onclick="vider()">Vider</button>
    <button class="bouton-green" onclick="valider()">Valider</button>
    <script>
    function valider() {
        let x = parseInt(document.getElementById('x').value);
        let y = parseInt(document.getElementById('y').value);
        let res = 0;
        if (document.getElementById('plus').checked == true) {
            res = x + y;
        }
        if (document.getElementById('moins').checked == true) {
            res = x - y;
        }
        if (document.getElementById('divi').checked == true) {
            res = x / y;
        }
        somme.value = res;
    }
    btn1.onclick = function() {
        document.body.style.background = "blue";
    }
    btn2.onclick = function() {
        document.body.style.background = "red";
    }
    btn3.onclick = function() {
        document.body.style.background = "green";
    }
    btn4.onclick = function() {
        document.body.style.background = "violet";
    }

    function remplir() {
        // alert("Vous avez")
        let myName = prompt("tapez votre nom");
        let nom = document.getElementById('nom');
        nom.value = myName;
        let message = "<h2> N'oubliez pas de souhaiter la bienvenue à M." + myName;
        desc.innerHTML = message;
    }

    function supprimer() {
        let response = confirm("Voulez vous vraiment faire une suppression ?");
        if (response) {
            message = "a";
            desc.innerHTML = message;
            alert("Suppression confirmée !")
        } else {
            alert("Suppression annilée !")
        }
    }
    </script>
</body>

</html>