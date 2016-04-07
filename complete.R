y<-0   #for storing the final dataframe
rows<-0   #to count the number of complete rows
x<-1:332   #for moving through id's
x<-as.character(x)   #converting numeric vector to a charecter vector
x<-str_pad(x,3,pad="0")   #padding zeroes at the beginning of a charecter of length 3 
complete<-function(dir,id)
{
  setwd(file.path(getwd(), dir)) #setting the working directory
  length_id<-length(id)  #finding out the length of the argument id. p.s the argument can be a vector as well
  vec_id<-numeric(length_id)  #creating a numeric vector with values zero of size equal to length of id 
  complete_cases<-numeric(length_id)
  for(i in seq_along(id))
  {
    j<-id[i]  #to get the values in the vector id
    data<-read.csv(paste(x[j],"csv",sep=".",collapse=NULL)) #read data from table of corresponding name like 001.csv
    data<-na.omit(data)  #getting rid of na values that are present in the data that is collected
    rows<-nrow(data)  #number of rows in data without na value
    vec_id[i]<-j  #storing the corresponding monitor id into vector at position i
    complete_cases[i]<-rows  #storing the number of rows corresponding to the read file at position i of the vector
  }
  setwd("..")
  y<-data.frame(id=vec_id,nobs=complete_cases)  #creating the data frame
  y
}
