let bouton1=document.getElementById('btn1');
bouton1.style.background="blue";
bouton1.style.colr="white";

// On peut aussi appliquer le style en une seule ligne  avec setAttribute
let bouton2=document.querySelector('#btn2'); // une autre façon de selectionner un élément
bouton2.setAttribute("style","width:125px;min-height:70px;background:red;color:white;border-radius:5px");

// Les éléments spécifiés par id peuvent créer automatiquementune variable qui porte le nom de l'id
btn3.className="bouton-green"; // mise en style d'un élément en utilisant une class