getRelevantNameVector<-function(name){
  indexComm<-match(name,Species$Common_Name)
  indexSci<-match(name,Species$Scientific_Name)
  names<-c()

  if(is.na(indexComm)== FALSE){
    index<-indexComm
    names<-append(names,Species$Common_Name[index])
    names<-append(names,Species$Scientific_Name[index])
    return(names)
  }

  if(is.na(indexSci)== FALSE){
    index<-indexSci
    names<-append(names,Species$Common_Name[index])
    names<-append(names,Species$Scientific_Name[index])
    return(names)
  }

}
