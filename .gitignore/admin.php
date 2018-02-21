    <!doctype html>  
    <html>  
    <head>  
    <title>Register</title>  
        <style>   
            body{  
        margin-top: 100px;  
        margin-bottom: 100px;  
        margin-right: 150px;  
        margin-left: 80px;  
        background-color: azure ;  
        color: palevioletred;  
        font-family: verdana;  
        font-size: 100%  
          
            }  
                h1 {  
        color: indigo;  
        font-family: verdana;  
        font-size: 100%;  
    }  
             h2 {  
        color: indigo;  
        font-family: verdana;  
        font-size: 100%;  
    }</style>  
    </head>  
    <body>  
	<table>
		 <tr>
		 
		   <th><a href="http://localhost/AI/login.php"><center>Log out<center/></a></th>
		 
		   </tr>		
			</table>
   <?php 
	
$con=mysql_connect('localhost','root','') or die(mysql_error());  
mysql_select_db('my') or die("cannot select DB");  
$sql="select * from claim";  
$result=mysql_query($sql) or die($sql."<br/><br/>".mysql_error());;
		
		
		
			echo "<table border='1'>
	<tr>
	<th>cid</th>
	<th>Location</th>
	<th>name</th>
	<th>hospital</th>
	<th>amount</th>
	<th>number</th>
	<th>duration</th>
	<th>Status</th>
	<th>Client Id</th>
	</tr>";


		while ($row = mysql_fetch_array ($result)){		
			echo "<tr>";
			echo "<td>" . $row['cid'] . "</td>";
			echo "<td>" . $row['Location'] . "</td>";
			echo "<td>" . $row['name'] . "</td>";
			echo "<td>" . $row['hospital'] . "</td>";
			echo "<td>" . $row['amount'] . "</td>";
			echo "<td>" . $row['number'] . "</td>";
			echo "<td>" . $row['duration'] . "</td>"; 
			echo "<td>" . $row['status'] . "</td>"; 
			echo "<td>" . $row['id'] . "</td>";
			echo "<tr/>";			
		}
	
	if(isset($_POST["submitc"]))
		{
			$id=$_POST['cid']; 
			
			$sql="update claim set status='Accepted',reason='Eligible' where cid='$id'"; 
			$result=mysql_query($sql);
			echo $result;
			if($result)
			{
				echo "Succesfully updated";
			}
			else
			{
				echo "Failed to update";
			}
			
		}
		if(isset($_POST["submitr"]))
		{
			$id=$_POST['cid']; 
			
			$sql="update claim set status='Rejected',reason='Wrong informations' where cid='$id'"; 
			$result=mysql_query($sql);
			echo $result;
			if($result)
			{
				echo "Succesfully updated";
			}
			else
			{
				echo "Failed to update";
			}
			
		}
		if(isset($_POST["submitd"]))
		{
			$id=$_POST['cid']; 
			
			$sql="delete from claim where cid='$id'"; 
			$result=mysql_query($sql);
			echo $result;
			if($result)
			{
				echo "Succesfully updated";
			}
			else
			{
				echo "Failed to update";
			}
			
		}

    ?> 
	
	
   <center><h1></h1></center>  
       
        <center><h2>Admin</h2></center>  
		
		
		 <form action="" method="POST">   
        
           <table>
		   <tr>
		   <th>Enter the claim id </th>
		   <th><input type="text" name="cid"></th>
		    <th align="centre"><input type="submit" value="Confirm claim" name="submitc" /> </th>
			 <th align="centre"><input type="submit" value="Reject claim" name="submitr" /> </th>
			 <th align="centre"><input type="submit" value="Delete claim" name="submitd" /> </th>
		  </tr>
	 <table>
	</form>
	 
<?php	 
$con=mysql_connect('localhost','root','') or die(mysql_error());  
mysql_select_db('my') or die("cannot select DB");  
$sql="select * from register2";  
$result=mysql_query($sql) or die($sql."<br/><br/>".mysql_error());;
	
			echo "<table border='1'>
	<tr>
	<th>Name</th>
	<th>Age</th>
	<th>Education</th>
	<th>Employee</th>
	<th>Profession</th>
	<th>Location</th>
	<th>Maritial status</th>
	<th>Gender</th>
	<th>Previous insurance holder or not</th>
	<th>Twitter name</th>
	<th>status</th>
	<th>id</th>
	<th>Children</th>
	
	
	<th>Smoker/not</th>
	<th>Region</th>
	<th>bmi</th>
	<th>Premium</th>
	<th>Phone number</th>
	<th>Email</th>
	</tr>";

		while ($row = mysql_fetch_array ($result)){		
			if($row['id']!='999910'){
			echo "<tr>";
			echo "<td>" . $row['name'] . "</td>";
			echo "<td>" . $row['age'] . "</td>";
			echo "<td>" . $row['education'] . "</td>";
			echo "<td>" . $row['employee'] . "</td>";
			echo "<td>" . $row['profession'] . "</td>";
			echo "<td>" . $row['location'] . "</td>";
			echo "<td>" . $row['mar'] . "</td>"; 
						
			echo "<td>" . $row['gender'] . "</td>";
			echo "<td>" . $row['Pre'] . "</td>";
			echo "<td>" . $row['tweet'] . "</td>";
			echo "<td>" . $row['status'] . "</td>";
			echo "<td>" . $row['id'] . "</td>";
			echo "<td>" . $row['children'] . "</td>";
			echo "<td>" . $row['smoker'] . "</td>";
						
			echo "<td>" . $row['region'] . "</td>";
			echo "<td>" . $row['bmi'] . "</td>";
			echo "<td>" . $row['premium'] . "</td>";
			echo "<td>" . $row['ph'] . "</td>";
			echo "<td>" . $row['mail'] . "</td>";

			
			echo "<tr/>";
			
			
			}
			
		} 
		
		
	if(isset($_POST["submitcli"]))
		{
			$id=$_POST['cid']; 
			
			$sql="delete from register2 where id='$id'"; 
			$result=mysql_query($sql);
			
			$sql1="delete from claim where id='$id'"; 
			$result1=mysql_query($sql1);
			
			if($result && $result1)
			{
				echo "Successfully updated";
			}
			else
			{
				echo "Failed to update";
			}
			
		}	
			
	  	 
?>	 
 <form action="" method="POST">   
        
           <table>
		   <tr>
		   <th>Enter the claim id </th>
		   <th><input type="text" name="cid"></th>
		    <th align="centre"><input type="submit" value="Delete customer" name="submitcli" /> </th>	   
		  </tr>
	 <table>
	</form>

	
 <input type=button value="Refresh" onClick="window.location.reload()">
          	
 
    </body>  
    </html>   
