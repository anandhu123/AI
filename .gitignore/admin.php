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
$sql="select * from claim where status='Rejected'";  
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
			echo "<tr/>";
			
		}
	
	if(isset($_POST["submit"]))
		{
			$id=$_POST['cid']; 
			
			$sql="update claim set status='Confirmed',reason='Eligible' where cid='$id'"; 
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
		   <th>Enter the claim id</th>
		   <th><input type="text" name="cid"></th>
		    <th align="centre"><input type="submit" value="Confirm claim" name="submit" /> </th>
		   
		   
		  </tr>
	 <table>
	</form>
	 
 <input type=button value="Refresh" onClick="window.location.reload()">
          
          
		
 
    </body>  
    </html>   
