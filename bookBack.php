<html>
<head>
<title>图书归还</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
    <td>
	<?php include("navigation.php");?>
	</td>
	</tr>
	<td>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" align="center" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" valign="top">
		<script language="javascript">
		function checkreader(form){
			if(form.barcode.value==""){
				alert("请输入读者条形码!");form.barcode.focus();return;
			}
			form.submit();
		}
		</script>
<form name="form1" method="post" action="">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableBorder_gray">
   <tr>
     <td valign="top"><table width="100%" border="0" cellpadding="02" cellspacing="2" bordercolor="#E3F4F7">
       <tr>
         <td height="33" background="Images/bookgh.gif">&nbsp;</td>
       </tr>
       <tr>
         <td valign="top" bgcolor="#D2E6F1">
<?php 
include("conn/conn.php");
if ( isset( $_POST['barcode'] ) ) {
    $barcode = $_POST['barcode'];
    $sql=mysqli_query($conn,"select borr.id as borrid,borr.borrowTime,borr.backTime,borr.ifback,r.*,t.name as typename,t.number,book.bookname,book.price,pub.pubname,bc.name as bookcase from tb_borrow as borr join tb_reader r on borr.readerid=r.id join tb_readerType t on r.typeid=t.id join tb_bookinfo as book on book.id=borr.bookid join tb_publishing as pub on book.ISBN=pub.ISBN  join tb_bookcase as bc on book.bookcase=bc.id where r.barcode='$_POST[barcode]' and borr.ifback=0");
    if(mysqli_num_rows($sql)!=0){
    $info=mysqli_fetch_array($sql);
    }else{
      echo '<script language="javascript">
          alert("请输入正确条形码!");form.barcode.focus();
      </script>';
    }
    
}
?>
		 <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
           <tr>
             <td width="33%"><table width="100%" height="74" border="0" cellpadding="0" cellspacing="0">
               <tr>
                 <td height="27" colspan="2" align="center"><table width="90%" height="21" border="0" cellpadding="0" cellspacing="0">
                   <tr>
                     <td width="132" background="Images/bg_line.gif">&nbsp;</td>
                     <td>&nbsp;</td>
                   </tr>
                 </table></td>
               </tr>
               <tr>
                 <td width="8%" height="27">&nbsp;</td>
                 <td width="92%">读者条形码：</td>
               </tr>
               <tr>
                 <td height="27" colspan="2" align="center"><input name="barcode" type="text" id="barcode" value="<?php if(isset($_POST["barcode"])&& isset($sql) && mysqli_num_rows($sql)!=0){echo $info["barcode"];}?>" size="24">
                   &nbsp;
                   <input name="Button" type="button" class="btn_grey" value="确定" onClick="checkreader(form1)"></td>
               </tr>
             </table></td>
             <td width="1%" align="center" valign="bottom"><img src="Images/borrow_fg.gif" width="18" height="111"></td>
             <td width="66%" align="right">
			 <table width="96%" border="0" cellpadding="0" cellspacing="0">
               <tr>
                 <td height="27">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;
                       <input name="readername" type="text" id="readername" value="<?php if(isset($_POST["barcode"])&& isset($sql) && mysqli_num_rows($sql)!=0){echo $info["name"];}?>"></td>
                 <td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<br>
                   <input name="sex" type="text" id="sex" value="<?php if(isset($_POST["barcode"])&& isset($sql) && mysqli_num_rows($sql)!=0){echo $info["sex"];}?>"></td>
               </tr>
               <tr>
                 <td height="27">证件类型：
                   <input name="paperType" type="text" id="paperType" value="<?php if(isset($_POST["barcode"])&& isset($sql) && mysqli_num_rows($sql)!=0){echo $info["paperType"];}?>"></td>
                 <td>证件号码：
                   <input name="paperNo" type="text" id="paperNo" value="<?php if(isset($_POST["barcode"])&& isset($sql) && mysqli_num_rows($sql)!=0){echo $info["paperNO"];}?>"></td>
               </tr>
               <tr>
                 <td height="27">读者类型：
                   <input name="readerType" type="text" id="readerType" value="<?php if(isset($_POST["barcode"])&& isset($sql) && mysqli_num_rows($sql)!=0){echo $info["typename"];}?>"></td>
                 <td>可借数量：<br>
                   <input name="number" type="text" id="number" value="<?php if(isset($_POST["barcode"])&& isset($sql) && mysqli_num_rows($sql)!=0){echo $info["number"];}?>" >
                   册
                   &nbsp;</td>
               </tr>
             </table>			 </td>
           </tr>
         </table>		 </td>
       </tr>
       <tr>
         <td valign="top" bgcolor="#D2E5F1"><table width="100%" height="35" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6" bgcolor="#FFFFFF">
                   <tr align="center" bgcolor="#e3F4F7">
                     <td width="24%" height="25" bgcolor="#F0FAFB">图书名称</td>
                     <td width="12%" bgcolor="#F0FAFB">借阅时间</td>
                     <td width="13%" bgcolor="#F0FAFB">应还时间</td>
                     <td width="14%" bgcolor="#F0FAFB">出版社</td>
                     <td width="12%" bgcolor="#F0FAFB">书架</td>
                     <td bgcolor="#F0FAFB">定价(元)</td>
                     <td width="12%" bgcolor="#F0FAFB"><input name="Button22" type="button" class="btn_grey" value="完成归还" onClick="window.location.href='bookBack.php'"></td>
                   </tr>
<?php
if(isset($sql) && mysqli_num_rows($sql)!=0 && $info){
 do{?>
                   <tr>
                     <td height="25" style="padding:5px;">&nbsp;<?php if(isset($_POST["barcode"])){echo $info["bookname"];}?></td>
                     <td style="padding:5px;">&nbsp;<?php if(isset($_POST["barcode"])){echo $info["borrowTime"];}?></td>
                     <td style="padding:5px;">&nbsp;<?php if(isset($_POST["barcode"])){echo $info["backTime"];}?></td>
                     <td align="center">&nbsp;<?php if(isset($_POST["barcode"])){echo $info["pubname"];}?></td>
                     <td align="center">&nbsp;<?php if(isset($_POST["barcode"])){echo $info["bookcase"];}?></td>
                     <td width="13%" align="center">&nbsp;<?php if(isset($_POST["barcode"])){echo $info["price"];}?></td>
                     <td width="12%" align="center"><a href="bookBack_ok.php?borrid=<?php if(isset($_POST["barcode"])){echo $info["borrid"];}?>&barcode=<?php if(isset($_POST["barcode"])){echo $info["barcode"];}?>">归还</a>&nbsp;</td>
                   </tr>
<?php
}while($info=mysqli_fetch_array($sql));
}
 ?>
                 </table>                 </td>
       </tr>
     </table></td>
   </tr>
</table>
 </form> </td>
      </tr>
    </table>
</td>
  </tr>
</table><?php include("copyright.php");?></td>
  </tr>
</table>
</td>
</tr>
</table>
</body>
</html>
