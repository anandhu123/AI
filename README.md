# AI
A complete automated solution where in the person (unemployed) submits online application form to get the health policy. Important factors/check to perform for issuing policy, premium calculation and claims of amount (not an exhaustive list)

#DB tables
The submitted data will reside in database called my with a table name of register2,its fields are
name 	
age 	
education 	
employee -employee or not (yes/no answer needed)
profession 	
location
mar-maritial status(single/married)	
gender-(male/female) 	
Pre-previous insurance holder or not(yes/no) 
tweet-valid twitter name of customer
status-unemployment status generated by script, confirm if he is unemployed else rejected(confirmed/rejected) 	
id-secret id of each customer 	
children-number of childrens 
smoker-(yes/no)
region-(select from dropdown)
bmi-body mass index 	
premium-premium calculated by script
ph-phone number
mail-mail id

#premium calculation module
uses insurance.csv as dataset to train

#claim module
uses hospital_directory.csv for hospital validation
