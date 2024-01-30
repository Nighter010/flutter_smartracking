<?php

include 'conn.php';

// Check if data is sent via POST request
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve data from the POST request
    $imei_no = $_POST['imei_no'];
    $device_name = $_POST['Device_Name'];

    // SQL query to insert data into the tb_device table
    $sql = "INSERT INTO tb_device (imei_no, Device_Name) VALUES ('$imei_no', '$device_name')";

    if ($conn->query($sql) === TRUE) {
        // Successfully inserted
        echo "Data inserted successfully";
    } else {
        // Error inserting data
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    // Invalid request method
    echo "Invalid request method";
}

// Close the database connection
$conn->close();

?>
