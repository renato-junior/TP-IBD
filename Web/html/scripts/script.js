

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
        xmlhttp.open("test","search.php",true);
        xmlhttp.send();
    }

