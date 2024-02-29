<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "sales_system";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sqlLatestSale = "SELECT MAX(id) as latest_sale_id FROM sales";
$resultLatestSale = $conn->query($sqlLatestSale);

if ($resultLatestSale->num_rows > 0) {
    $row = $resultLatestSale->fetch_assoc();
    $latest_sale_id = $row['latest_sale_id'];
} else {
    echo "Error: No sales found.";
    exit();
}

$operation = "Update";
$log_timestamp = date("Y-m-d H:i:s");

$sqlInsertLog = "INSERT INTO logging (sale_id, operation, log_timestamp) VALUES ('$latest_sale_id', '$operation', '$log_timestamp')";
if ($conn->query($sqlInsertLog) === TRUE) {
    echo "Logging updated successfully.";
} else {
    echo "Error updating logging: " . $conn->error;
}

$conn->close();

?>
