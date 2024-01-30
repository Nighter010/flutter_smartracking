<?php
include 'conn.php';
header("Access-Control-Allow-Origin: *");
$xok = 401;

// แก้ไขชื่อตารางเป็น 'bodytemp'
$result = mysqli_query($conn, "SELECT * FROM bodytemp ORDER BY date_log DESC, time_log DESC LIMIT 1");

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $output[] = $row;
        $xok = 200;
    }

    echo json_encode($output);
    http_response_code($xok);
} else {
    // กรณีเกิดข้อผิดพลาดในการดึงข้อมูล
    http_response_code($xok);
}

mysqli_close($conn);
?>
