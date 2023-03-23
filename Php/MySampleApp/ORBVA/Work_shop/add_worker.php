<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "orbva";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);


  if( !empty($_POST["mech_name"])and !empty($_POST["place"])
	  and !empty($_POST["post"])and !empty($_POST["contact_no"])
	  and !empty($_POST["pin"])and !empty($_POST["district"])
	  and !empty($_POST["email"])and !empty($_POST["specification"])
	  and !empty($_POST["available"])
	  )
{

      $mech_name = $_POST["mech_name"];
    $place= $_POST["place"];
    $post= $_POST["post"];
    $contact_no = $_POST["contact_no"];
	   $pin = $_POST["pin"];
    $district= $_POST["district"];
   $email= $_POST["email"];
   $specification= $_POST["specification"];
   $available= $_POST["available"];
    
               
      
      $mech_name=mysqli_real_escape_string($connection,$mech_name);
     $place=mysqli_real_escape_string($connection,$place);
      $post=mysqli_real_escape_string($connection,$post);
       $contact_no=mysqli_real_escape_string($connection,$contact_no);
	     $pin=mysqli_real_escape_string($connection,$pin);
     $district=mysqli_real_escape_string($connection,$district);
	  $email=mysqli_real_escape_string($connection,$email);
	  $specification=mysqli_real_escape_string($connection,$specification);
	  $available=mysqli_real_escape_string($connection,$available);
     


      

 
 


    $sql = "INSERT INTO   add_worker (mech_name,place,post,contact_no,
	pin,district,email,specification,available) 
	
	VALUES ('".$mech_name."','".$place."','".$post."','".$contact_no."',
	'".$pin."','".$district."','".$email."','".$specification."','".$available."')";


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