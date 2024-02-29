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
    $sql = "SELECT * FROM products";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $products = array();
        while ($row = $result->fetch_assoc()) {
            $products[] = $row;
        }
        echo json_encode($products);
    } else {
        echo "No products found.";
    }
}


$newProductName = "product 6";
$newProductDescription = "product 6 description";
$newProductCategory = "Category 4";

$sqlInsert = "INSERT INTO products (name, description, category) VALUES ('$newProductName', '$newProductDescription', '$newProductCategory')";
if ($conn->query($sqlInsert) === TRUE) {
    echo "<br> $newProductName inserted successfully.<br>";
} else {
    echo "Error inserting new product: " . $conn->error . "<br>";
}

$updateProductId = 5;
$updatedProductName = "Product 5 updated";
$updatedProductDescription = "Updated description of product 5";
$updatedProductCategory = "Category 2";

$sqlUpdate = "UPDATE products SET name='$updatedProductName', description='$updatedProductDescription', category='$updatedProductCategory' WHERE id=$updateProductId";
if ($conn->query($sqlUpdate) === TRUE) {
    echo "Product $updatedProductName successfully.<br>";
} else {
    echo "Error updating product: " . $conn->error . "<br>";
}

$conn->close();

?>

