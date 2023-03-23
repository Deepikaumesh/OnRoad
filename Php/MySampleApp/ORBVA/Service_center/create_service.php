<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "orbva";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);


  if( !empty($_POST["service_name"])and !empty($_POST["mech_name"])
	  and !empty($_POST["services"])and !empty($_POST["available"])
	  and !empty($_POST["address"])and !empty($_POST["city"])
	  and !empty($_POST["location"])and !empty($_POST["mobile"])
	  and !empty($_POST["status"]))
{

      $service_name = $_POST["service_name"];
    $mech_name= $_POST["mech_name"];
    $services= $_POST["services"];
    $available = $_POST["available"];
	   $address = $_POST["address"];
    $city= $_POST["city"];
    $location= $_POST["location"];
    $mobile = $_POST["mobile"];
	$status = $_POST["status"];
    
               
      
      $service_name=mysqli_real_escape_string($connection,$service_name);
     $mech_name=mysqli_real_escape_string($connection,$mech_name);
      $services=mysqli_real_escape_string($connection,$services);
       $available=mysqli_real_escape_string($connection,$available);
	     $address=mysqli_real_escape_string($connection,$address);
     $city=mysqli_real_escape_string($connection,$city);
      $location=mysqli_real_escape_string($connection,$location);
       $mobile=mysqli_real_escape_string($connection,$mobile);
	   $status=mysqli_real_escape_string($connection,$status);


      

 
 


    $sql = "INSERT INTO  create_service (service_name,mech_name,services,available,
	address,city,location,mobile,status) 
	
	VALUES ('".$service_name."','".$mech_name."','".$services."','".$available."',
	'".$address."','".$city."','".$location."','".$mobile."','".$status."'
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