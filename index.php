<?php

session_start();
include 'dbConnection.php';
$conn = getDatabaseConnection("groupProject");

function getBankTypes() {
    global $conn;
    $sql = "SELECT bankName
            FROM `bank`
            ORDER BY bankName";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $records = $stmt->fetchALL(PDO::FETCH_ASSOC);
    
    //print_r $records;
    
    foreach ($records as $record) {
        echo "<option> "  . $record['bankName'] . "</option>";
    }
}

function displayBanks(){
    global $conn;
    
    $sql = "SELECT * FROM user JOIN department JOIN bank JOIN BankManager
            ON user.departmentId = department.departmentId AND department.bankType =
            bank.bankId AND BankManager.bankId = bank.bankId
            WHERE 1";
            
    if (isset($_GET['submit'])){
        
         $namedParameters = array();
         
        if (!empty($_GET['searchBar'])) {
            $sql .= " AND department.deptName LIKE :deptName"; //using named parameters
            $namedParameters[':deptName'] = "%" . $_GET['searchBar'] . "%";
            echo $_GET['searchBar'] ;
         }
         
         if (!empty($_GET['searchBar'])){
             $sql .= " AND user.firstName LIKE :firstName";
             $namedParameters[':firstName'] = "%" . $_GET['searchBar'] . "%";
         }
         
        if (!empty($_GET['searchBar'])) {
            $sql .= " AND user.lastName LIKE :lastName"; //using named parameters
            $namedParameters[':lastName'] = "%" . $_GET['searchBar'] . "%";
         }
         
         if (!empty($_GET['searchBar'])) {
            $sql .= " AND bank.bankName LIKE :bankName"; //using named parameters
            $namedParameters[':bankName'] = "%" . $_GET['searchBar']. "%" ;
         }
         
         if (!empty($_GET['bankName'])) {
            $sql .= " AND bank.bankName LIKE :dType"; //using named parameters      <<
            $namedParameters[':dType'] =  $_GET['bankName'] ;
         }
         
        
         
        if(isset($_GET['orderBy']) && $_GET['orderBy'] == 'id'){
                  $sql .= " ORDER BY userId";
        }
        
        if(isset($_GET['orderBy']) && $_GET['orderBy'] == 'name')     {
                  $sql .= " ORDER BY bankName";
        } 
        
         if(isset($_GET['orderBy']) && $_GET['orderBy'] == 'type')     {
                  $sql .= " ORDER BY deptName";
        } 
        
    }
    
    $stmt = $conn->prepare($sql);
    $stmt->execute($namedParameters);
    
    $records = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    
    // var_dump($records);
     foreach ($records as $record) {
        echo  "<p><b>Account Number: </b> ".$record['userId']. ",<b> Member Name: </b>". $record['firstName']. " " . $record['lastName']. "<p><b>Bank: </b> ".$record['bankName'] . " <br/><b>Bank Manager:</b> " .
              $record['ManagerFirstName'] . " ". $record['ManagerLastName']. " <br/> <b>Account Type:</b> " . $record['deptName'] .
             "</p><a target='' href='addCart.php?addCart=".$record['userId']."'> Add to cart </a><br />";
            
     }
     
    
}

function showCart(){
    global $conn;
      // var_dump($record);
    
    if(isset($_SESSION['cart'])){
         echo "<table class= 'table table-hover' border = '1'>
            <tr>
                <th>Member</th>
                <th>Account type</th>
                <th>Bank</th>
                <th>Email</th>
            </tr>";
        //var_dump($_SESSION['cart']);
        foreach($_SESSION['cart'] as $elements){
            $namedParameter = array(":id" => $elements);
            
             $sql = "SELECT * FROM user JOIN department JOIN bank
                    ON user.departmentId = department.departmentId AND department.bankType = bank.bankId
                    WHERE user.userId = :id";
                    
                
            $stmt = $conn->prepare($sql);
            $stmt->execute($namedParameter);
            
            $record = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
            foreach($record as $r){
            echo "<tr>";
            echo "<td>" . $r['firstName'] . " ".  $r['lastName'] . "</td>" ;
            
            echo "<td>" . $r['deptName'] . " </td>";
            echo "<td>" . $r['bankName'] . " </td>";
            echo "<td>" . $r['email'] . " </td>";
            echo "</tr>";
            }
        }
        
      //var_dump($record);
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
            Search: <input type="text" name="searchBar" placeholder="Search" />
            Type:
            <select name="bankName" id ="department">
                <option value="">Select One</option>
                <?php
                    getBankTypes()
                ?>
            </select>

            <!-- <input type="checkbox" name="available" id="available" value="A">-->
            <!--<label for="available"> Available </label>-->

            <br>
            Order by:
            <input type="radio" name="orderBy" id="orderByName" value="name">
            <label for="orderByName"> Bank Name </label>

            <input type="radio" name="orderBy" id="orderByType" value="type">
            <label for="orderByType"> Bank Type </label>

            <input type="radio" name="orderBy" id="orderByUser" value="id">
            <label for="orderByUser"> Account Nubmer </label>
            
            <input type="submit" value="Search" name="submit" >
        </form>
        <form action = "reset.php" method = "post">
                Clear Choosen Accounts <input type= "Submit">
        </form>

        <hr>
        <main>
        <?php
        displayBanks()
        ?>
        </main>
        <div id="right">
            <h2> Choosen Accounts </h2>
            <br>
            <!-- <iframe name="Banks" height="600" allowtransparency="true"></iframe> -->
             <?php
                showCart();
                
            ?>
        </div>

    </body>
</html>