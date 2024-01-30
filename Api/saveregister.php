<?php
header('Access-Control-Allow-Origin: *');
include("conn.php");
$firstname = $_REQUEST['firstname'];
$lastname = $_REQUEST['lastname'];
$dob = $_REQUEST['dob'];
$email = $_REQUEST['email'];
$phone = $_REQUEST['phone'];
$password = $_REQUEST['password'];
$user_id = $_REQUEST['user_id'];
$no=1;
$newCode=1;
//=== ค านวณหาเลขที่ ID ล่าสุด ===
$sql ="SELECT MAX(user_id) AS MAX_ID FROM dbcsit ";
$objQuery = mysqli_query($conn,$sql)or die(mysqli_error($conn,$sql));
while($row1 = mysqli_fetch_array($objQuery))
{
if ($row1["MAX_ID"]!="")
{
$no = $row1["MAX_ID"]+1;
}
}
$newno = "0000".(string)$no;
$newno = substr($newno,-5);
$newuserid = $newno;
$sql = "insert into
dbcsit(user_id,firstname,email,phone,password,lastname,dob)
values('$newuserid','$firstname','$email','$phone','$password','$lastname','$
dob')";
mysqli_query($conn,$sql);
http_response_code(200);

?>