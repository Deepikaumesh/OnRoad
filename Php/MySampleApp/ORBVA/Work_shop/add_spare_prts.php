<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "orbva";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);


  if( !empty($_POST["parts_name"])and !empty($_POST["parts_details"]))
{

      $parts_name = $_POST["parts_name"];
    $parts_details= $_POST["parts_details"];
  
    
               
      
      $parts_name=mysqli_real_escape_string($connection,$parts_name);
     $parts_details=mysqli_real_escape_string($connection,$parts_details);
    

      

 
 



    $sql = "INSERT INTO  add_spare_parts (parts_name,parts_details) VALUES 
	('".$parts_name."','".$parts_details."')";


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