<?php
     $conn=mysqli_connect("localhost","root","520025") or die("数据库服务器连接错误".mysql_error());
     mysqli_select_db($conn,"librarysystem") or die("数据库访问错误".mysql_error());
?>
