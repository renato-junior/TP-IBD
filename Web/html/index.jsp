<html>

<head>
    <meta charset="UTF-8">
    <title>WebIBD</title>
    <link rel="stylesheet" type="text/css" href="css/global.css">
    <link rel="stylesheet" type="text/css" href="css/fonts.css">
</head>

<body>

    <h1 styles="font-family: Quantum">
        GAME STATION JSP
    </h1>

    <p id="testTarget"> Isso é um parágrafo!</p>

    <button class="buttonToPage" onclick="nextPage();"> Ir para next </button>
    <br><br>
    <button class="buttonToSearch" onclick="testw3();"> Procurar no mysql (JS)</button>

    

</body>


</html>


<script>

    function nextPage(){
        window.location.href="next.jsp"
    }

    var sqlControl = 0;
    function sqlTest(){
        if(sqlControl == 0){
            document.getElementById("testTarget").innerHTML = "Oi";
            sqlControl = 1;
        }
        else{
            document.getElementById("testTarget").innerHTML = "Ei";
            sqlControl = 0;
        }
        console.log("Apertou");
    }

    function testw3() {
            
        xmlhttp=new XMLHttpRequest();

        xmlhttp.onreadystatechange=function() {
            if (this.readyState==4 && this.status==200) {
                document.getElementById("testTarget").innerHTML=this.responseText;
            }
        }
        xmlhttp.open("test","Search.php",true);
        xmlhttp.send();
    }



</script>