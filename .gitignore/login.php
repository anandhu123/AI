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
         
        <center><h1></h1></center>  
       
        <center><h2>Login</h2></center>  
    <form action="" method="POST">  
        <legend>  
        <fieldset>  
           <table>
		 	   		 		 
		   </tr>
		   <tr>
		   <th>Enter your secret id</th>
		   <th><input type="text" name="i"></th>
		 
		   </tr>
		 <tr>		 
		   <th align="centre"><input type="submit" value="submit" name="submit" /> </th>
		   </tr>
	
		   
		  
 
		   </table>
		   
        </fieldset>  
            </legend>  
			
		
			
			
			
			
			
    </form>  
	
    <?php  
	$res="";
    if(isset($_POST["submit"]))
		{  
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB");  
			$result=""; 
			$i=$_POST['i']; 
			$sql="SELECT * FROM register2 WHERE id ='$i'";
			$result=mysql_query($sql); 
			while ($row = mysql_fetch_array ($result)){
			$res=$row ['id'];
			
			
		}

			if($res==$i)
			{  
				session_start();			
			$_SESSION["id"] = $i;
				header('Location: profile.php');
	
			} else 
			{  
				echo "Invalid id!";  
			}  
      
        } 
		
    ?>  
    </body>  
    </html>   
