
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

search1="select * from register2 where status='Confirmed'"
db1<-dbGetQuery(con,search1)
df1=data.frame(db1)
n1=nrow(df1)

for(i in 1:n1)
{
  temp=TRUE
  predicted= predict(fit,df[i,-1])
  print(predicted)
  #discount for unemployed persons which has no skill-set
  if(df1[i,4]=='no')
  {
    skills=c("M tech","b tech","doctrate","poly technique","ITI")
    l=length(skills)
    for(k in 1:l)
    {
      if(grepl(df1[i,3],skills[k],ignore.case = T)==T)
      {
        temp=FALSE
      }
      
    }
    
    if(temp==TRUE)
    {
      disc=((predicted)*25)/100
      predicted=predicted-disc
    }
   
  }
  if(df1[i,7]=='single')
  {
    disc=((predicted)*2)/100
    predicted=predicted-disc
    
  }
  if(df1[i,9]=='yes')
  {
    disc=((predicted)*4)/100
    predicted=predicted+disc
    
  }

  print(predicted)
  change=sprintf("update register2 set premium ='%s' where id= '%d'", predicted,df[i,1])
  dbGetQuery(con,change) 
  
}






