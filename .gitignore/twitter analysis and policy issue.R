#libraries
library(twitteR)
library(ROAuth)
library(httr)
library(RMySQL)
library(dbConnect)

# Set API Keys
api_key <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
api_secret <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
access_token <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
access_token_secret <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

#Extract latest tweets
timeLine <- homeTimeline(n = 800, retryOnRateLimit = 10)
beginning <-  as.POSIXct("2018-02-15 09:00:00 UTC")
end <- as.POSIXct("2018-02-19 01:00:00 UTC")
times <- lapply(timeLine, function(x) x$created)
these <- which(times > beginning & times < end)
myMorningTweets <- timeLine[these]

#sql connection with R
con = dbConnect(MySQL(), user ='root',password ='',dbname = 'my',host ='localhost')

#Reject with age limit
age="select tweet,age from register2"
agedb<-dbGetQuery(con,age)
db=agedb[agedb$age >18,  ] 
db<-data.frame(db)

#Rejection confirmation
ager=agedb[agedb$age <18,  ]
ager<-data.frame(ager)
rno=nrow(ager)
for(m in 1:rno)
{
  agereject=sprintf("update register2 set status='Rejected' where tweet= '%s'", ager$tweet[m])
  dbGetQuery(con,agereject)
}


number<-nrow(db)
for(k in 1:number)
{
  print(db[k,1])
  #Process the retrived tweets
  tweet=twListToDF(myMorningTweets)
  tweets1=data.frame(tweet$screenName,tweet$text)
  colnames(tweets1)=c("screenName","text")
  tweets=tweets1[tweets1$screenName ==db[k,1],  ] 
    
  #Find the count of occurance
  n=nrow(tweets)
  if(n==0)
  {
    next;
  }
  count=0
  words=c("job","employee","job alert","job search","career","occupation","employment")
  num=length(words)

  for(j in 1:num)
  {
   for(i in 1:n)
    {
       if(grepl(words[j], tweets[[i,2]])==TRUE)
       {
          count=count+1
       }
    }
  }
  print(count)
  condition=db[k,1]
  if(count>8)
  {
    change=sprintf("update register2 set status='Rejected' where tweet= '%s'", condition)
    dbGetQuery(con,change)
  }
  else
  {
    change=sprintf("update register2 set status='Confirmed' where tweet= '%s'", condition)
    dbGetQuery(con,change) 
  }
}

#Sent email confirmation with secret id
library(RDCOMClient)
search=sprintf("select * from register2 where status ='Confirmed'")
db=dbGetQuery(con,search)
for(i in 1:nrow(db))
{
  if(db[i,19]!="no gmail")
  {
    
     body=sprintf("Hello %s, your application for medicare registration is accepted and your secret id for login is %d",db[i,1],db[i,12])
     OutApp <- COMCreate("Outlook.Application")
     outMail = OutApp$CreateItem(0)
     outMail[["To"]] = db[i,19]
     outMail[["subject"]] = "Medicare"
     outMail[["body"]] = body
     outMail$Send()
  }
  else
  {
    next
  }
  
}





#Conditions applied
#1-age
#2-social media
#3-invalid twitter account or inactive twitter account=not defined
