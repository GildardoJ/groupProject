<?php

session_start();
include 'dbConnection.php';
$conn = getDatabaseConnection("groupProject");

function getBankTypes() {
    global $conn;
    $sql = "SELECT bankType
            FROM `department`
            ORDER BY bankType";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $records = $stmt->fetchALL(PDO::FETCH_ASSOC);
    
    //print_r $records;
    
    foreach ($records as $record) {
        echo "<option> "  . $record['bankType'] . "</option>";
    }
}

function displayBanks(){
    global $conn;
    $sql = "SELECT * FROM department WHERE 1";
    if (isset($_GET['submit'])){
        $namedParameters = array();
        if (!empty($_GET['departmentId'])) {
            //The following query allows SQL injection due to the single quotes
            //$sql .= " AND bankType LIKE '%" . $_GET['bankType'] . "%'";
            $sql .= " AND departmentId LIKE :departmentId"; //using named parameters
            $namedParameters[':bankType'] = "%" . $_GET['bankType'] . "%";
         }
         if (!empty($_GET['bankType'])) {
            //The following query allows SQL injection due to the single quotes
            //$sql .= " AND bankType LIKE '%" . $_GET['bankType'] . "%'";
            $sql .= " AND bankType = :dType"; //using named parameters
            $namedParameters[':dType'] =   $_GET['bankType'] ;
         }
         if (isset($_GET['available'])) {
             echo $_GET['status'];
             $sql .= " AND status = :status";
             $namedParameters[':status'] =  $_GET['available'];
         }
         if(isset($_GET['orderBy']) && $_GET['orderBy'] == 'name')     {
                  $sql .= " ORDER BY deptName";
        } else if(isset($_GET['orderBy']) && $_GET['orderBy'] == 'ID'){
                  $sql .= " ORDER BY departmetId";
        }
    }//endIf (isset)
      else  {
        $sql .= " ORDER BY bankType";
    }
     //echo "<br/>". $sql;
    //If user types a bankType
     //   "AND bankType LIKE '%$_GET['bankType']%'";
    //if user selects bank type
      //  "AND bankType = '$_GET['bankType']";
    $stmt = $conn->prepare($sql);
    $stmt->execute($namedParameters);
    $records = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
     foreach ($records as $record) {
        echo  "<p><b>bank Name: </b> ".$record['bankType'] . " <br/><b>Id:</b> " .
              $record['departmentId'] .  "  <b>Status:</b> " . $record['bankType'] .
             "</p><a target='' href='addCart.php?addCart=".$record['departmentId']."'> Add to cart </a><br />";
            
     }
     
   
     
}

function showCart(){
    global $conn;
    $sql = "SELECT * FROM department WHERE 1";
    
    
    if(isset($_SESSION['cart'])){
         echo "<table class= 'table table-hover' border = '1'>
                    <tr>
                        <th>Member</th>
                        <th>Account type</th>
                    </tr>";
        //var_dump($_SESSION['cart']);
        foreach($_SESSION['cart'] as $elements){
                echo "<tr>";
                echo "<td>" . $elements , "</td>" ;
                echo "<tr>";
        }
     }
}

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Team Project: Bank Search </title>
        <meta charset="utf-8">
        <style>
               @import url('styles.css');
        </style>
    </head>
    <body>
        <header>
        <h1>Banking Systems</h1>
        </header>
            <div >
            <form>
                 Member: <input type="text" name="userId" placeholder="Member?"/>
                Type:
                <select name="bankType">
                    <option value="">Select One</option>
                    <?php
                    getBankTypes();
                    ?>
                </select>
    
                <input type="checkbox" name="available" id="available" value="A">
                <label for="available"> Available </label>
    
                <br>
                Order by:
                <input type="radio" name="orderBy" id="orderByName" value="name">
                <label for="orderByName"> Name </label>
    
                <input type="radio" name="orderBy" id="orderByPrice" value="price">
                <label for="orderByPrice"> Price </label>
    
    
    
                <input type="submit" value="Search!" name="submit" >
            </form>
            <form action = "reset.php" method = "post">
                    Clear Cart <input type= "Submit">
            </form>
            
            
        </div>
        <div>
            
        </div>

        <hr>
        <main>
        <?=displayBanks()?>
        </main>
        <div id="right">
            <h2> Your Cart </h2>
            <br>
            <!-- <iframe name="Banks" height="600" allowtransparency="true"></iframe> -->
             <?php
                showCart();
            ?>
        </div>

    </body>
</html>
