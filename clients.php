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
    $sql = "SELECT id, name, last_name, mobile FROM clients";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $clients = array();
        while ($row = $result->fetch_assoc()) {
            $clients[] = $row;
        }
        echo json_encode($clients);
    } else {
        echo "No clients found.";
    }
}

$newClientName = "Ceristina";
$last_name = "Windman";
$mobile = "000-867-0000";

$sqlInsert = "INSERT INTO clients (name, last_name, mobile) VALUES ('$newClientName', '$last_name', '$mobile')";
if ($conn->query($sqlInsert) === TRUE) {
    echo "<br> New client ('$newClientName $last_name') created successfully.<br>";
} else {
    echo "Error inserting new client: " . $conn->error . "<br>";
}

$updated_id = 2;
$update_name = "Jackie";
$updated_last_name = "Johnson";
$updated_Phone = "555-876-5598";

$sqlUpdate = "UPDATE clients SET name='$update_name', last_name='$updated_last_name', mobile='$updated_Phone' WHERE id=$updated_id";
if ($conn->query($sqlUpdate) === TRUE) {
    echo "Client $update_name $updated_last_name updated successfully.<br>";
} else {
    echo "Error updating client: " . $conn->error . "<br>";
}

$conn->close();

?>
