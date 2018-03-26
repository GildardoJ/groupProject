// Prepare the connection and connect
<?php

$host = "localhost";
$dbname = "bank";
$username = "gorozco";
$password = "";


$dbConn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);

// Compose the SQL statement
$sql = " SELECT * FROM Bank WHERE id = :id ";

// Prepare the statement
$stmt = $dbConn -> prepare ($sql);

// Execute the statement, passing in array of parameters
$stmt -> execute (  array ( ':id' => '1')  );

// Process the results
while ($row = $stmt -> fetch())  {
    echo  $row['field1_name'] . ", " . $row['field2_name'];
}


?>