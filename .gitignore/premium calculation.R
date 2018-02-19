library(readr)
library(randomForest)

insurance <- read_csv("~/insurance.csv")
train=insurance
colnames(insurance)
summary(insurance)
hist(insurance$expenses, breaks = 30)
table(insurance$sex)
table(insurance$smoker)
table(insurance$region)

# Fitting model
fit <- lm(expenses ~ ., train)
summary(fit)

#sql connection with R
con = dbConnect(MySQL(), user ='root',password ='',dbname = 'my',host ='localhost')

#Reject with age limit
search="select id,age,gender as sex,bmi,children,smoker,region from register2 where status='Confirmed'"
db<-dbGetQuery(con,search)
df=data.frame(db)
n=nrow(df)

search1="select * from register2"
db1<-dbGetQuery(con,search1)
df1=data.frame(db1)

for(i in 1:n)
{
  
  predicted= predict(fit,df[i,-1])
  print(predicted)
  #discount for unemployed persons
  if(df1[i,4]=='no')
  {
    disc=((predicted)*25)/100
    predicted=predicted-disc
  }
  
  
  change=sprintf("update register2 set premium ='%s' where id= '%d'", predicted,df[i,1])
  dbGetQuery(con,change) 
  
}










