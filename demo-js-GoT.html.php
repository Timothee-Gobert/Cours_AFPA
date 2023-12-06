<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style-demo-js-GoT.css">
    <title>Document</title>

</head>

<body>
    <div class="wrapper">
        <span class="icon-close">
            <ion-icon name="close"></ion-icon>
        </span>
        <div class="form-box login">
            <h2>Operator</h2>
            <form action="#">
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="X"></ion-icon>
                    </span>
                    <input id='X' type="X" required>
                    <label>X</label>
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="Y"></ion-icon>
                    </span>
                    <input id='Y' type="Y" required>
                    <label>Y</label>
                </div>

                <legend class="legende">Select an operator:</legend>
                <div class="div-ratio">
                    <input type="radio" id="plus" name="operator" value="plus" />
                    <label for="plus">+</label>
                    <br>
                    <input type="radio" id="moins" name="operator" value="moins" />
                    <label for="moins">-</label>
                    <br>
                    <input type="radio" id="divi" name="operator" value="divi" />
                    <label for="divi">/</label>
                </div>

                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="Résultat"></ion-icon>
                    </span>
                    <input id='somme' type="Résultat" required>
                    <label>Résultat</label>
                </div>
                <button class="btn-calc" onclick="valider()">Calculer</button>
            </form>
        </div>
        <br>
    </div>

    <script>
    // sélectionner le groupe radio à l'aide de la document.querySelectorAll()
    var radios = document.querySelectorAll('input[type=radio][name="operator"]');
    // gérer l'événement de changement avec EventTarget.addEventListener()
    radios.forEach(radio => radio.addEventListener('change', () => valider()));

    function valider() {
        event.preventDefault()
        let x = parseInt(document.getElementById('X').value);
        let y = parseInt(document.getElementById('Y').value);
        let res = 0;
        if (document.getElementById('plus').checked) {
            res = x + y;
        }
        if (document.getElementById('moins').checked) {
            res = x - y;
        }
        if (document.getElementById('divi').checked) {
            if (y == 0) {
                alert("Division par zéro impossible");
            } else {
                res = x / y;
            }
        }
        somme.value = res;
    }
    </script>
</body>

</html>