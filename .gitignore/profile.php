    <!doctype html>  
    <html>  
    <head>  
    <title>Register</title>  
        <style>  
#image-logo {
  float: right;
}		
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
         
        <center><h1></h1></center>  
       <?php
	   
	   	session_start();
	$id=$_SESSION["id"];
	$con=mysql_connect('localhost','root','') or die(mysql_error());  
	mysql_select_db('my') or die("cannot select DB");  
	$sql="select name from register2 where id='$id'";  
	$result=mysql_query($sql);
	while ($row = mysql_fetch_array ($result)){
			$uname=$row ['name'];
			
		}
	echo "Hello"." ".$uname;
	
	   ?>
	   
		<table>
		 <tr>
		 
		   <th><a href="http://localhost/AI/login.php"><center>Log out<center/></a></th>
		 
		   </tr>		
			</table>
			
			<?php
		$con=mysql_connect('localhost','root','') or die(mysql_error());  
	mysql_select_db('my') or die("cannot select DB"); 	
	$sql="select * from register2 where id='$id'";  
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
	
	<th>Children</th>
	
	
	<th>Smoker/not</th>
	<th>Region</th>
	<th>bmi</th>
	
	<th>Phone number</th>
	<th>Email</th>
	</tr>";


		while ($row = mysql_fetch_array ($result))
		{		
			if($row['id']!='999910')
			{
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
				echo "<td>" . $row['children'] . "</td>";
				echo "<td>" . $row['smoker'] . "</td>";			
				echo "<td>" . $row['region'] . "</td>";
				echo "<td>" . $row['bmi'] . "</td>";
				echo "<td>" . $row['ph'] . "</td>";
				echo "<td>" . $row['mail'] . "</td>";
				echo "<tr/>";
				
			}
			
		} 
	   
 
	  ?> 
	   	   
        <center><h2>PROFILE</h2></center>  
    <form action="" method="POST">  
        <legend>  
        <fieldset>  
           <table>
		 	  <tr>
		   <th>Update details</th>
		  
		 
		   </tr>  	

				
		   </tr>
		   <tr>
		   <center><th>Educational qualification</th></center>
		   <th><input type="text" name="edu"></th>
		   <th align="centre"><input type="submit" value="submit" name="edusub" /> </th>
		   
		 
		   </tr>
		   <tr>
		   <th>Employment status</th>
		   <th> <input type="text" name="emp"></th>
		   <th align="centre"><input type="submit" value="submit" name="empsub" /> </th>
		   </tr>
		   		   </tr>
		   <tr>
		   <th>Profession</th>
		   <th> <input type="text" name="pro"></th>
		   <th align="centre"><input type="submit" value="submit" name="prosub" /> </th>
		   </tr>
		   
		   		   </tr>
		   <tr>
		   <th>Location</th>
		   <th> <input type="text" name="loc"></th>
		   <th align="centre"><input type="submit" value="submit" name="locsub" /> </th>
		   </tr>
		   		   </tr>
		   <tr>
		   <th>Marital Status</th>
		   <th> <input type="text" name="mar"></th>
		   <th align="centre"><input type="submit" value="submit" name="marsub" /> </th>
		   </tr>
		   		   </tr>
		 
		   		   		   </tr>
		   
		    <tr>
		   <th>Twitter name</th>
		   <th> <input type="text" name="tw"></th>
		   <th align="centre"><input type="submit" value="submit" name="twsub" /> </th>
		   </tr>
		   
	
		   
		  
 
		   </table>
		   
        </fieldset>  
            </legend>  
			
			 
            <legend>  
			<fieldset> 
		<table	>
		 <tr>
		   <th>Apply for a claim</th>
		  <th  align="centre"><input type="submit" value="Click here" name="submitc" /> </th>
		 
		   </tr>		
			</table>
			</fieldset>  
            </legend>  
			
			</br/>
							
    </form>  
    <?php  
	
	
    if(isset($_POST["edusub"]))
		{  
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB");  
			  
			$edu=$_POST['edu'];  
			
			

			$sql="update register2 set education='$edu' where id='$id'";  
			$result=mysql_query($sql);  
			
			if($result)
			{  
				echo "Successfully Submitted";
				echo '</br>';
				echo '</br>';
				
					
			} else 
			{  
				echo "Failure!";  
				echo '</br>';
				echo '</br>';
			}  
      
        } 
		
		 if(isset($_POST["empsub"]))
		{  
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB");  
			  
			$emp=strtolower($_POST['emp']);  
			
			

			$sql="update register2 set employee='$emp' where id='$id'";  
			$result=mysql_query($sql);  
			
			if($result)
			{  
				echo "Successfully Submitted";
				echo '</br>';
				echo '</br>';
				
				
					
			} else 
			{  
				echo "Failure!";  
				echo '</br>';
				echo '</br>';
			}  
      
        } 
		
		 if(isset($_POST["prosub"]))
		{  
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB");  
			  
			$pro=$_POST['pro'];  
			$sql="update register2 set profession='$pro' where id='$id'";  
			$result=mysql_query($sql);  
			
			if($result)
			{  
				echo "Successfully Submitted";
				echo '</br>';
				echo '</br>';
				
				
					
			} else 
			{  
				echo "Failure!";  
				echo '</br>';
				echo '</br>';
			}  
      
        } 
		
		 if(isset($_POST["locsub"]))
		{  
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB");  
			  
			$loc=$_POST['loc'];  
			
			

			$sql="update register2 set location='$loc' where id='$id'";  
			$result=mysql_query($sql);  
		
			if($result)
			{  
				echo "Successfully Submitted";
				echo '</br>';
				echo '</br>';
				
				
					
			} else 
			{  
				echo "Failure!";  
				echo '</br>';
				echo '</br>';
			}  
      
        } 
		
		 if(isset($_POST["marsub"]))
	   	{  
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB");  
			  
			$mar=strtolower($_POST['mar']);  
			
		

			$sql="update register2 set mar='$mar' where id='$id'";  
			$result=mysql_query($sql);  
			
			if($result)
			{  
				echo "Successfully Submitted";
				echo '</br>';
				echo '</br>';
				
				
					
			} else 
			{  
				echo "Failure!";  
				echo '</br>';
				echo '</br>';
			}  
      
        } 
		 if(isset($_POST["twsub"]))
		{  
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB");  
			  
			$tw=$_POST['tw'];  
			
			

			$sql="update register2 set tweet='$tw' where id='$id'";  
			$result=mysql_query($sql);  
			
			if($result)
			{  
				echo "Successfully Submitted";
				echo '</br>';
				echo '</br>';
				
				
					
			} else 
			{  
				echo "Failure!"; 
				echo '</br>';
				echo '</br>';			
			}  
      
        } 
		if(isset($_POST["submitc"]))
		{  
			
			
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB");  
			$sql="SELECT * FROM register2 where id='$id'";  
			$result=mysql_query($sql); 
			$pre="";
			while ($row = mysql_fetch_array ($result))
			{
				$pre=$row ['premium'];
				
					
			}
			if($pre==0)
			{
				echo "Your application is rejected!! please submit valid  informations or contact our customer service";
				echo '<br/>';
				echo '<br/>';
			}
			else
			{
				session_start();
				$_SESSION["id"] = $id;
				header('Location: claim.php');
			}
					
      
        } 
		
	
		$res=" ";
		$con=mysql_connect('localhost','root','') or die(mysql_error());  
		mysql_select_db('my') or die("cannot select DB");  
		$sql="select status,premium from register2 where id='$id'";  
		$result=mysql_query($sql) or die($sql."<br/><br/>".mysql_error());;
		while ($row = mysql_fetch_array ($result)){
			$res=$row ['status'];
			$prem=$row['premium'];
			
		}
	
		echo 'Registration Details';
	    echo '<br/>';	
		
		echo 'Status of application:  ';
		if($res=='Confirmed')
			{  
				echo "Accepted";
				echo '<br/>';
				echo 'Premium:  ';
				echo $prem;		
				echo '<br/>';
				echo '<br/>';
			} 
			else 
			{  
				echo "Rejected!";  
				echo '<br/>';	echo '<br/>';	
			}  
			
		
		echo 'Claim Details';
		$name="";
		$con=mysql_connect('localhost','root','') or die(mysql_error());  
		mysql_select_db('my') or die("cannot select DB");  
		$sql="select * from claim where id='$id' ";  
		$result=mysql_query($sql);
		if($result)
		{
			
			while ($row = mysql_fetch_array ($result))
			{
				$name=$row ['name'];
				$status=$row ['status'];
				$reason=$row ['reason'];
				if($name)
				{
					echo '<br/>';	
					echo 'You are applied for'." " ."$name". " " .'claim';
					echo '<br/>';	
					echo 'Status of claim:  ';
					echo $status;
					echo '<br/>';
					if(strcmp($status,"Rejected")==0)
					{		
							echo 'Reason for rejection:  ';
						echo $reason;
						echo '<br/>';
					}
				}	
			}
		}
		else
		{
			echo '<br/>';	
			echo 'Claim registration is banned ';
		}
		
		echo '<br/>';  
	echo '<legend>';
	echo '<fieldset>';
         
	echo '<br/>'.'Your confirmed claims are provided only after scrutiny of submitted details with the manually submitted documents';	
	echo '</legend>';
	echo '</fieldset>';
		
     
    ?>  
	<br/>
	<br/>
	<input type=button value="Refresh" onClick="window.location.reload()">
    </body>  
    </html>   
