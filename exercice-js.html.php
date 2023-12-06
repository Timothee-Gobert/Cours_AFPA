<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <button onclick="bouclewhile()">While</button>
    <button onclick="bouclefor()">For</button>
    <button onclick="tableau()">Tableau</button>
    <script>

    function bouclewhile(){
        
        let ok=true;
        let prenoms="";
        let prenom="";
        let compteur=0;
        
        while(ok){
            compteur=compteur+1;
            prenom=prompt("tapez votre "+compteur+ " e prenom :");
            if(prenom){
                if(compteur==1){
                    prenoms+=prenom;
                }else{
                    prenoms+=" - "+prenom;
                }
            }else{
                ok=false;
            }
        }

        alert(prenoms);
    }

    function bouclefor(){
        
        let prenoms="";
        let prenom="";
        
        for(i=1;i<=5;i++){
            prenom=prompt("donnez une ville");
            prenoms+=" "+prenom
        }
        
        alert(prenoms);
    }

    function tableau(){
        
        let eleves=["Dupont","Marie","Claude"];

        for(i=0;i<eleves.lenght;i++){
            alert(eleves[i]);
        }

        eleves.push("Georges","Pierre","Brigitte");
        consol.log(eleves);
        alert(eleves);
        eleves_json=JSON.stringify(eleves);
        alert(eleves_json);
    }
    </script>
</body>

</html>