<?php session_start();?>
<head><title>读者</title>
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
        <td height="22" valign="top" class="word_orange">当前位置：读者管理 &gt; 读者档案管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">

<?php 
include("conn/conn.php");

//分页的函数
function news($pageNum = 1, $pageSize = 3, $conn)
{
 // limit为约束显示多少条信息，后面有两个参数，第一个为从第几个开始，第二个为长度 
 $sql=mysqli_query($conn,"select r.id,r.barcode,r.name,t.name as typename,r.paperType,r.paperNO,r.tel,r.email from tb_reader as r join (select * from tb_readertype) as t on r.typeid=t.id limit " . (($pageNum - 1) * $pageSize) . "," . $pageSize);
 while ($obj = mysqli_fetch_object($sql)) { 
  $array[] = $obj; 
 } 
 return $array; 
} 
//显示总页数的函数 
function allNews($conn) 
{ 
 $rs = "select count(r.id) from tb_reader as r join (select * from tb_readertype) as t on r.typeid=t.id"; //可以显示出总页数 
 $r = mysqli_query($coon, $rs); 
 $obj = mysqli_fetch_object($r);
 return $obj->num; 
} 
 @$allNum = allNews($conn); 
 @$pageSize = 3; //约定没页显示几条信息 
 @$pageNum = empty($_GET["pageNum"])?1:$_GET["pageNum"]; 
 @$endPage = ceil($allNum/$pageSize); //总页数 
 @$array = news($pageNum,$pageSize,$conn);
// $sql=mysqli_query($conn,"select r.id,r.barcode,r.name,t.name as typename,r.paperType,r.paperNO,r.tel,r.email from tb_reader as r join (select * from tb_readertype) as t on r.typeid=t.id");
// $info=mysqli_fetch_array($sql);
if($array==false){
?> <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无读者信息！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <a href="reader_add.php">添加读者信息</a> </td>
  </tr>
</table>
 <?php 
}else{
  ?> <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="87%">&nbsp;      </td>
<td width="13%">
      <a href="reader_add.php">添加读者信息</a></td>	  
  </tr>
</table>  
  <table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="13%">条形码</td>  
    <td width="10%">姓名</td>
    <td width="8%">读者类型</td>
    <td width="10%">证件类型</td>
    <td width="18%">证件号码</td>
    <td width="15%">电话</td>
    <td width="15%">E-mail</td>
    <td colspan="2">操作</td>
  </tr>
<?php 
  foreach($array as $key=>$values){
 
    echo "<tr>";   
    echo "<td style='padding:5px;'>{$values->barcode}</td>";  
    echo "<td style='padding:5px;'><a href='reader_info.php?id={$values->id} '>{$values->name} </a></td>";
    echo "<td style='padding:5px;'>{$values->typename} </td>";
    echo "<td align='center'>{$values->paperType} </td>";
    echo "<td align='center'>{$values->paperNO}</td>";
    echo "<td>&nbsp;{$values->tel} </td>";
    echo "<td align='left'>&nbsp;{$values->email} </td>";
    echo "<td width='6%' align='center'><a href='reader_modify.php?id={$values->id}'>修改</a></td>";
    echo "<td width='5%' align='center'><a href='reader_del.php?id={$values->id} '>删除</a></td>";   
    echo "</tr>";
   
   }
}
?> </table>
<div>
 
 <a href="?pageNum=1" rel="external nofollow" rel="external nofollow" >首页</a> 
 <a href="?pageNum=<?php echo $pageNum==1?1:($pageNum-1)?>" rel="external nofollow" rel="external nofollow" >上一页</a> 
 <a href="?pageNum=<?php echo $pageNum==$endPage?$endPage:($pageNum+1)?>" rel="external nofollow" rel="external nofollow" >下一页</a> 
 <a href="?pageNum=<?php echo $endPage?>" rel="external nofollow" rel="external nofollow" >尾页</a>  
 
</div>
</td>
      </tr>
    </table></td>
  </tr>
</table><?php include("copyright.php");?></td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
