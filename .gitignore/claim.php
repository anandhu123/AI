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
       
        <center><h2>Claim registration</h2></center>  
    <form action="" method="POST">  
        <legend>  
        <fieldset>  
           <table>
		 	   		 		 
		   </tr>
		   
		   
		   <tr>
		   <th>Enter your claim type </th>
		   <th><input type="text" name="name"></th>
		 
		   </tr>
		   
		    <tr>
		   <th>Name of medical provider (Hospital) </th>
		   <th><input type="text" name="hos"></th>
		   </tr>
		    
		 <tr>		 
		   <th>Location of medical provider </th>
		   <th><input type="text" name="loc"></th>
		   </tr>
		   
		    <tr>		 
		   <th>Number of treatments </th>
		   <th><input type="text" name="num"></th>
		   </tr>
		   
		     <tr>		 
		   <th>Duration of stay in the hospital </th>
		   <th><input type="text" name="dur"></th>
		   </tr>
		   
		   
		   
		     <tr>
		   <th>Claim amount </th>
		   <th><input type="text" name="amo"></th>
		   </tr>
		   
	
		    <tr>
		   <th>
		   </th>
		 <th align="centre"><input type="submit" value="Submit claim" name="submitc" /> </th>
		 
		   </tr>	
		  
 
		   </table>
		   
        </fieldset>  
            </legend>  
			
		 
            <legend>  
			<fieldset> 
		<table	>
		 <tr>
		   <th>Back to profile</th>
		  <th  align="centre"><input type="submit" value="Back to profile" name="prof" /> </th>
		 
		   </tr>		
			</table>
			</fieldset>  
            </legend>  
			
			</br/>
	
			
    </form>  
	
    <?php  
	$res="";
	session_start();
	$id=$_SESSION["id"];
	
    if(isset($_POST["submitc"]))
		{
			$con=mysql_connect('localhost','root','') or die(mysql_error());  
			mysql_select_db('my') or die("cannot select DB");  
			$result=""; 
			$name=$_POST['name'];  
			$loc=$_POST['loc']; 
			$hos=$_POST['hos']; 
			$amo=$_POST['amo']; 
 			$ran=mt_rand (100000,2000000);
			$secret=$ran;
			$num=$_POST['num']; 		
			$dur=$_POST['dur'];
			$date=date("d/m/Y");	
			
			
			$sql="insert into claim(name,Location,id,hospital,amount,cid,number,duration,date)values('$name','$loc','$id','$hos','$amo','$secret','$num','$dur','$date')";
			$result=mysql_query($sql); 
			if($result)
			{
				echo 'You are succesfully applied for '." ".$name." ".'claim';
				
			}		
			
			
			
		}
		if(isset($_POST["prof"]))
		{
			$_SESSION["id"] = $i;
			header('Location: profile.php');
			
			
			  
		}
        
		
    ?>  
    </body>  
    </html>   
