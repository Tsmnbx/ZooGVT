#' GetNamesVec
#'
#' @param name The feature that you want to see
#'
#' @return Does not return only shows the plots
#' @export
#'
#' @examples
#' \dontrun{
#'NameVec<-GetNamesVec("Danio_rerio")
#'
#'
#'
#'}
#' @import fmsb
#' @import BgeeDB
#' @import biomaRt
#' @import topGO
#' @importFrom utils head
#' @import grDevices

GetNamesVec<-function(name){
  indexComm<-match(name,ZooGVT::Species$Common_Name)
  indexSci<-match(name,ZooGVT::Species$Scientific_Name)
  names<-c()

  if(is.na(indexComm)== FALSE){
    index<-indexComm
    names<-append(names,ZooGVT::Species$Common_Name[index])
    names<-append(names,ZooGVT::Species$Scientific_Name[index])
    return(names)
  }

  if(is.na(indexSci)== FALSE){
    index<-indexSci
    names<-append(names,ZooGVT::Species$Common_Name[index])
    names<-append(names,ZooGVT::Species$Scientific_Name[index])
    return(names)
  }

}
