<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "orbva";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);


  if( !empty($_POST["name"])and !empty($_POST["address"])
	  and !empty($_POST["location"])and !empty($_POST["contact_no"])
	  and !empty($_POST["email_id"])and !empty($_POST["license_no"])
	  and !empty($_POST["status"])
	  )
{

      $name = $_POST["name"];
    $address= $_POST["address"];
    $location= $_POST["location"];
    $contact_no = $_POST["contact_no"];
	   $email_id = $_POST["email_id"];
    $license_no= $_POST["license_no"];
   $status= $_POST["status"];
    
               
      
      $name=mysqli_real_escape_string($connection,$name);
     $address=mysqli_real_escape_string($connection,$address);
      $location=mysqli_real_escape_string($connection,$location);
       $contact_no=mysqli_real_escape_string($connection,$contact_no);
	     $email_id=mysqli_real_escape_string($connection,$email_id);
     $license_no=mysqli_real_escape_string($connection,$license_no);
	  $status=mysqli_real_escape_string($connection,$status);
     


      

 
 


    $sql = "INSERT INTO  add_workshop (name,address,location,contact_no,
	email_id,license_no,status) 
	
	VALUES ('".$name."','".$address."','".$location."','".$contact_no."',
	'".$email_id."','".$license_no."','".$status."'
	)";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "success";

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