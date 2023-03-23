<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "orbva";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);


  if( !empty($_POST["Owner_name"])and !empty($_POST["Crain_details"]))
{

      $Owner_name = $_POST["Owner_name"];
    $Crain_details= $_POST["Crain_details"];
    $phone= $_POST["phone"];
    $password = $_POST["password"];
    
               
      
      $Owner_name=mysqli_real_escape_string($connection,$Owner_name);
     $Crain_details=mysqli_real_escape_string($connection,$Crain_details);
    

      

 
 



    $sql = "INSERT INTO add_crain (Owner_name,Crain_details) VALUES 
	('".$Owner_name."','".$Crain_details."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = " success";

        echo json_encode($result);
        mysqli_close($connection);

    }
	else {
        $result["error"] = "true";
        $result["message"] = "error";
        echo json_encode($result);
    
      mysqli_close($connection);
    }
	}

?>