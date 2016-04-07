rows<-0
total<-0
#n<-length(dir)
#x<-numeric(n)
x<-1:332
x<-as.character(x)
x<-str_pad(x,3,pad="0")
pollutantmean<-function(dir,pollutant,id)
{
  setwd(file.path(getwd(), dir))
  for(i in id)
  {
    data<-read.csv(paste(x[i],"csv",sep=".",collapse=NULL))
    data<-na.omit(data)
  
    rows = rows + nrow(data)
    
    if (pollutant == "sulfate") 
    {
      total <- total + sum(data$sulfate)
    }
    else 
    {
      total <- total + sum(data$nitrate)
    }
    
  }
  
  setwd("..") # resetting the directory
  
  total/rows # return mean value

}
