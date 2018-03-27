<?php
    session_start();
    
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
        <div id="left">
            <?php
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
            ?>
        
        </div>
    </body>
    
</html>