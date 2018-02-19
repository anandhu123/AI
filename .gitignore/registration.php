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
       
        <center><h2>Registration Form</h2></center>  
    <form action="" method="POST">  
        <legend>  
        <fieldset>  
           <table>
		   <tr>
		   <th>Username</th>
		   <th><input type="text" name="user"></th>
		 
		   </tr>
		   
		   <tr>
		   <th>Age</th>
		   <th><input type="text" name="age"></th>
		 
		   </tr>
		   <tr>
		   <th>Educational qualification</th>
		   <th><input type="text" name="edu"></th>
		 
		   </tr>
		   <tr>
		   <th>Employment status</th>
		   <th> <input type="text" name="emp"></th>
		   </tr>
		   		   </tr>
		   <tr>
		   <th>Profession</th>
		   <th> <input type="text" name="pro"></th>
		   </tr>
		   
		   		   </tr>
		   <tr>
		   <th>Location</th>
		   <th> <input type="text" name="loc"></th>
		   </tr>
		   		   </tr>
		   <tr>
		   <th>Marital Status</th>
		   <th> <input type="text" name="mar"></th>
		   </tr>
		   		   </tr>
		   <tr>
		   <th>Gender</th>
		   <th> <input type="text" name="gen"></th>
		   </tr>
		   
		   		   </tr>
		   <tr>
		   <th>Previous insurance holder/not</th>
		   <th> <input type="text" name="pre"></th>
		   </tr>
		   
		    <tr>
		   <th>Twitter name</th>
		   <th> <input type="text" name="twt"></th>
		   </tr>
		   
		   <tr>
		   <th>Children</th>
		   <th> <input type="text" name="chil"></th>
		   </tr>
	 <tr>
		   <th>Smoker</th>
		   <th> <input type="text" name="smo"></th>
		   </tr>
		   
		    <tr>
		   <th>Region</th>
		   <th>  <select name="reg">
  <option value="southwest">southwest</option>
  <option value="southeast">southeast</option>
  <option value="northwest">northwest</option>
  <option value="northeast">northeast</option>
</select> </th>
		   </tr>
		     <tr>
			 
		   <th>BMI(body mass index)</th>
		   <th> <input type="text" name="bmi"></th>
		   </tr>
		   
		   
		   <tr>
		   
		   <th>
		   </th>
		 <th align="centre"><input type="submit" value="Register" name="submit" /> </th>
		   </tr>
		   
		   
	 <tr>
		   <th><a href="http://localhost/p1/login.php"><center>Already a user ? Click here<center/></a></th>
		
		   </tr>	   
		   
		   

 
		   </table>
		   
        </fieldset>  
            </legend>  
    </form>  
	
    <?php  
			
    if(isset($_POST["submit"]))
	{ 

	 if(!empty($_POST['user'])&&!empty($_POST['age'])&&!empty($_POST['edu'])&&!empty($_POST['emp'])&&!empty($_POST['pro'])&&!empty($_POST['loc'])&&!empty($_POST['mar'])&&!empty($_POST['gen'])&&!empty($_POST['pre'])&&!empty($_POST['twt'])&&!empty($_POST['chil'])&&!empty($_POST['smo'])&&!empty($_POST['reg'])&&!empty($_POST['bmi'])) 
	 {
			$name=$_POST['user']; 
			$age=$_POST['age'];  
			$edu=$_POST['edu'];  
			$emp=$_POST['emp'];  
			
			
			$pro=$_POST['pro'];  
			$loc=$_POST['loc'];  
			$mar=$_POST['mar'];  
			$gen=$_POST['gen'];  
			$pre=$_POST['pre'];  
			$twt=$_POST['twt'];  
			$na="not defined";
			
			$chil=$_POST['chil'];  
			$smo=$_POST['smo'];  
			$reg=$_POST['reg'];  
			$bmi=$_POST['bmi'];
			$prem=0;
			
 
			
		
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB"); 
			$ran=mt_rand (10,100000);
			$secret=$ran;
						
			$sql="INSERT INTO register2(name,age,education,employee,profession,location,mar,gender,Pre,tweet,status,id,children,smoker,region,bmi,premium) VALUES('$name','$age','$edu','$emp','$pro','$loc','$mar','$gen','$pre','$twt','not defined','$ran','$chil','$smo','$reg','$bmi','$prem')";  
		
			$result=mysql_query($sql);  
			if($result)
			{  
				echo 'Successfully Submitted';
				echo '<br/>';
				echo 'Your secret code is: ';
				echo '$secret';
			
			} else 
			{  
				echo "Failure!";  
			}  
		}
		else 
		{  
			echo "All fields are required!";  
		}  
	}
?>
    </body>  
    </html>   
