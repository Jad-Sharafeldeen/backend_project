<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "sales_system";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $sql = "SELECT id, creation_date, client_id, seller_id, total 
            FROM sales";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $sales = array();
        while ($row = $result->fetch_assoc()) {
            $sales[] = $row;
        }
        echo json_encode($sales);
    } else {
        echo "No sales found.";
    }
}

$client_id = "3";
$seller_id = "2";
$total = "333";

$sqlInsert = "INSERT INTO sales (client_id, seller_id, total) VALUES ('$client_id', '$seller_id', '$total')";
if ($conn->query($sqlInsert) === TRUE) {
    echo "<br>New sale created.<br>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}


$sale_id = 3;
$total = "3333";

$sqlUpdate = "UPDATE sales SET total='$total' WHERE id=$sale_id";
if ($conn->query($sqlUpdate) === TRUE) {
    echo "Sale details updated successfully<br>";
    require_once 'logging.php';
} else {
    echo "Error updating sale details: " . $conn->error;
}


?>
