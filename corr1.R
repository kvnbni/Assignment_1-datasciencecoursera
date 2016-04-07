corr<-function(dir,threshold=0)  #corr function taking in the directory and threshold as arguments
{
  files<-list.files(dir,full.names = TRUE)  #list.files creates a list of files present in dir and stores it in the variable files
  cr<-c() # creating a NULL vector cr
  counter<-0
  for(i in 1:332) 
  {
    x<-read.csv(files[i])  #reading files 001.csv in the first loop and so on
    x<-na.omit(x)  #deleting all the na values from the data that we have read
    length<-nrow(x) #finding out the number of rows in the data read
    if(length>threshold)
    {
      cr<-c(cr,cor(x$sulfate,x$nitrate))  # adding to the vector cr the correlations that we perform on different monitor id's
      counter<-counter+1  #to check if any monitor id is meeting the threshold value
    }
    else if(length>threshold && counter==0)
    {
      cr<-vector(mode = "numeric",length = 0) # returning an empty vector if there is no monitor id greater than the threshold
    }
  }
  head(cr) #return the head(cr) value to the console
  
}

