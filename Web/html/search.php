<?php
    //phpinfo();
    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    function console( $data ) {
        $output = $data;
        if ( is_array( $output ) )
            $output = implode( ',', $output);

        echo "<script>console.log( 'PHP-Console: " . $output . "' );</script>";
    }


    $servername = "localhost";
    $username = "root";
    $password = "matrix13";
    $database = "clinica_medica";
    
    // echo "<br><br>";
    // echo "<br> servername is $servername";
    // echo "<br> username is $username";
    // echo "<br> password is $password";
    // echo "<br> database is $database";


    // Create connection
    
    $conn = mysqli_connect($servername, $username, $password,$database);

    // Check connection
    if (!$conn) {
        die("<br><br>Connection failed: " . mysqli_connect_error());
    }
    console("Connected successfully");

    function test($conn){
        console("TesteCLoique");
        $sql = "SELECT * FROM Exame";
        $result = mysqli_query($conn,$sql) or die ("Bad query: $sql");

        echo "<br><br><table text-align='center'>";
        echo "<t><th>idExame</th><th>nome</th><th>preco</th></tr>";
        while($row = mysqli_fetch_row($result)){
            
            echo "<tr><td>{$row[0]}</td><td>{$row[1]}</td><td>{$row[2]}</td></tr>";
        }
        
        echo "</table><br><br>";
    }

    test($conn);

?>