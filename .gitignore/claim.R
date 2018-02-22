library(ggmap)
library(geosphere)

#Google API for location access
register_google(key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

#Sql connection
con = dbConnect(MySQL(), user ='root',password ='',dbname = 'my',host ='localhost')
search="select * from  claim"
claimdb<-dbGetQuery(con,search)
n=nrow(claimdb)

#First:geographical difference
for(i in 1:n)
{
  
  print(claimdb[i,2])
  search=sprintf("select location from register2 where id ='%s'",claimdb[i,3])
  regdb=dbGetQuery(con,search)
  print(regdb$location)
  city1=geocode(claimdb[i,2])
  city2=geocode(regdb$location)
  print(city1)
  print(city2)
  
  dist=distm(c(city1$lon, city1$lat), c(city2$lon, city2$lat), fun = distHaversine)*0.001 
  print(dist)
  if(as.integer(dist)>500)
  {
    claimdb[i,9]="Rejected"
    claimdb[i,10]="geographical difference"
  }
  
}

#Seconed:excluded claims
disease=c("cost of spectacles","contact lenses"," hearing aids" ,"dental treatment","dental surgery"," convalescence","general debility", "congenital external defects", "venereal disease","intentional self-injury", "drugs","alcohol", "AIDS", "diagnosis","x-ray", "laboratory tests "," pregnancy" ," child birth","cesarean section","Naturopathy treatment")
num=length(disease)
count=0
for(j in 1:n)
{
  for(k in 1:num)
  {
    if(grepl(claimdb[j,4],disease[k],ignore.case = T)==T)
    {
         claimdb[j,9]="Rejected"
         claimdb[j,10]="Excluded diseases"
    }
  }
}

#Three: high cost for normal diseases
list=c("hepatitise c","diabetes","Osteoarthritis", "Joint Problems","copd","asthma","mental","falls","injuries","broken bone","cancer","heart")
num1=length(list)  
num2=nrow(claimdb)
for(x in 1:num2)
{
  if(grepl( claimdb[x,4],list[j],ignore.case = T)==F)
  {
    if(claimdb[x,6] >1000000)
    {
      claimdb[x,9]='Rejected'
      claimdb[x,10]="high cost for acute diseases"
    }
  }
}  


#Four:Long lasting diseases
dislist=c(" Cancer", " Cardiovascular diseases","heart failure","ischemic cardiopathy","Chronic respiratory diseases",  "asthma" ," chronic obstructive pulmonary disease","COPD","Diabetes mellitus","Addiction",
  "Alzheimers disease",
  "Atrial fibrillation",
  "Attention deficit hyperactivity disorder",
  "Autoimmune diseases"," ulcerative colitis", "lupus erythematosus", "Crohns disease", "coeliac disease", "Hashimotos thyroiditis", "relapsing polychondritis",
  "Bipolar disorder",
  "Blindness",
  "Cerebral palsy" ,
  "Chronic graft-versus-host disease" ,"GVHD",
  "Chronic hepatitis",
  "Chronic kidney disease",
  "Chronic osteoarticular diseases","osteoarthritis" , "rheumatoid arthritis",
  "Chronic pain syndromes",  "post-vasectomy pain syndrome" ," complex regional pain syndrome","Depression",
  "Deafness and hearing impairment",
  "Eating disorders",
  "Ehlers–Danlos syndrome",
  "Endometriosis",
  "Epilepsy",
  "Fibromyalgia",
  "HIV","AIDS",
  "Huntingtons disease",
  "Hypertension",
  "Lyme disease",
  "Multiple sclerosis",
  "Myalgic encephalomyelitis",
  "Narcolepsy",
  "Obesity",
  "Osteoporosis",
  "Parkinsons disease",
  "Periodontal disease",
  "Postural orthostatic tachycardia syndrome",
  "Sickle cell anemia ","hemoglobin disorders",
  "Sleep apnea",
  "Thyroid disease",
  "Tobacco"
)


l=length(dislist)
num4=nrow(claimdb)
for(x in 1:n)
{
  temp=TRUE
  for(y in 1:l)
  { 
    if(grepl(dislist[y],claimdb[x,4],ignore.case = T)==TRUE)
    {
     temp=FALSE
     print(claimdb[x,4])
     print(dislist[y])
    }
  }
  if(temp==TRUE)
  {
    if(claimdb[x,8] >1685 )
    {
      claimdb[x,9]='Rejected'
      claimdb[x,10]="duration high for acute diseases"
    }
  }
}
    
#Hospital network
library(readr)
hosp <- read_csv("C:/Users/anand/Downloads/hospital_directory.csv")
#hosp=hosp[hosp$State=='Kerala',]
hosp$Hospital_Name=gsub( " *\\(.*?\\) *", "", hosp$Hospital_Name)

n1=nrow(claimdb)
n2=nrow(hosp)

for(x1 in 1:n1)
{
  temp=TRUE
  for(x2 in 1:n2)
  { 
    if(grepl(claimdb[x1,5],hosp[x2,4],ignore.case = T)==T)
    {
      temp=FALSE
      print(claimdb[x1,5])
      print(hosp[x2,4])
      break
    }
    if(temp==F)break
  }
  if(temp==TRUE)
  {
    claimdb[x1,9]='Rejected'
    claimdb[x1,10]="Unreliable hospital network"
    
  }
}

#Five:Excessive number of claims in a specific period
for(i in 1:n)
{
  print(i)
  fclaim=""
  count=1
  fclaim[1]=claimdb[i,1]
  p=2
  if(i!=n)
  {
    q=i+1
    for(j in q:n)
    {

      if(claimdb[j,3]==claimdb[i,3])
      {
        if(claimdb[j,11]==as.Date(claimdb[i,11])-1 ||  claimdb[j,11]==as.Date(claimdb[i,11])-2 || claimdb[j,11]==as.Date(claimdb[i,11])+1 || claimdb[j,11]==as.Date(claimdb[i,11])+2)
        {
          count=count+1
          fclaim[p]=claimdb[j,1]
          p=p+1
        }
      }
    }
  }
  if(i!=1)
  {
    m=i-1
    for(k in m:1)
    {

      if(claimdb[k,3]==claimdb[i,3])
      {
        if(claimdb[k,3]==claimdb[i,3] && claimdb[k,11]==as.Date(claimdb[i,11])-1 ||  claimdb[k,11]==as.Date(claimdb[i,11])-2 || claimdb[k,11]==as.Date(claimdb[i,11])+1 || claimdb[k,11]==as.Date(claimdb[i,11])+2)
        {
          count=count+1
          fclaim[p]=claimdb[k,1]
          p=p+1
        }
      }
    }
  }  
  
  print(count)
  print(fclaim)
  f=length(fclaim)
  if(count > 50)
  {
    for(h in 1:f)
    {
      print(fclaim[h])
      claimdb[claimdb$cid==fclaim[h],9]='Rejected'
      claimdb[claimdb$cid==fclaim[h],10]="Date mismatch"
    }
  }
}


#Five:Excessive number of claims in a day
data=table(claimdb$date,claimdb$id)
data1=unique(claimdb$id)
data1=sort(data1, decreasing = F)

n2=nrow(data)
n3=ncol(data)
for(i in 1:n2)
{
  for(j in 1:n3)
  {
    if(data[i,j] > 50)
    {
      claimdb[claimdb$id==data1[j],9]='Rejected'
      claimdb[claimdb$id==data1[j],10]="Huge claims"
      
    }
    
  }
}

#Six:duplication of claims
arrays <- data.frame(matrix(ncol = 2, nrow = 0))
x <- c("name", "person")
colnames(arrays) <- x

h=1
count=0
lis=unique(claimdb[,3])
for(q in 1:length(lis))
{
  f=0
  dup=claimdb[claimdb$id==lis[q],]
  if(nrow(dup)==1)
  {
    next;
  } 
  nr=nrow(dup)
    for(r in 1:nr)
      {
        for(s in f+2:nr)
        {
          if(s>nr)
          {
            next
          }
          if(grepl(dup[r,4], dup[s,4])==T)
          {
            arrays[h,1]=dup[s,4]
            arrays[h,2]=lis[q]
            h=h+1
            count=count+1
          }
        }
     f=f+1
    }
}

listun=unique(arrays)
listun=listun[listun$person>0,]
listun$reason=""

for(v in 1:nrow(listun))
{
  listun[v,3]="Duplication of claims"
}

#Update claimdb
for(i in 1:nrow(listun))
{
  x= claimdb[claimdb$id==listun[i,2],]
  x= x[x$name==listun[i,1],]
  y=unique(x$name)
  l=length(y)
  for(j in 1:l)
  {
     claimdb[claimdb$name==y[j] & claimdb$id==listun[i,2],]$status="Rejected"
     claimdb[claimdb$name==y[j] & claimdb$id==listun[i,2],]$reason="Duplication"
  }
}

#writing to DB
for(d in 1:nrow(claimdb))
{
  change=sprintf("update claim set status ='%s' , reason='%s' where cid= '%d'", claimdb[d,9],claimdb[d,10],claimdb[d,1])
  dbGetQuery(con,change)
}

for(d in 1:nrow(claimdb))
{
  if(claimdb[d,9]!="Rejected")
  {
    change=sprintf("update claim set status ='Accepted' , reason='Eligible' where cid= '%d'", claimdb[d,1])
    dbGetQuery(con,change)
  }
}

#SMS for claim approval
library(twilio)

Sys.setenv(TWILIO_SID = "xxxxxxxxxxxxxxxxxxxxxx")
Sys.setenv(TWILIO_TOKEN = "xxxxxxxxxxxxxxxxxxxxxxxxxxxx")

my_phone_number <- "+xxxxxxxxxxxxxxxxxxxxx"
twilios_phone_number <- "+xxxxxxxxxxxxxxxxxx"

s="select * from  register2"
s<-dbGetQuery(con,s)
n=nrow(claimdb)
claimdb="select * from  claim"
claimdb=dbGetQuery(con,claimdb)

dat=claimdb[claimdb$status=='Accepted',]
dat1 <- data.frame(matrix(ncol = 2, nrow = 0))
x <- c("name", "ph")
colnames(dat1) <- x
for(j in 1:nrow(dat))
{
  dat1[j,1]=s[s$id==dat[j,3],1]
  dat1[j,2]=s[s$id==dat[j,3],18]
}

leng=nrow(dat)
for(i in 1:leng)
{
  
  body=sprintf("Hello  %s your application for %s claim is accepted",dat1[i,1],dat[i,4])
  print(body)
  my_phone_number=dat1[i,2]
  tw_send_message(from = twilios_phone_number, to = my_phone_number, 
                 body = body)
}


























