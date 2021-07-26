#' Converts a name into into the correct format
#'
#' This function takes a name and matches it to a species
#' @source \url{http://bioconductor.org/packages/release/bioc/vignettes/BgeeDB/inst/doc/BgeeDB_Manual.html}
#'
#' @param name the name a user has inputed
#'
#' @return the name the functions in this package use to refer to that animal
#' @export
#'
#' @examples
#' \dontrun{
#'Species <-GenesFromAnatomy("Danio_rerio")
#'}
#' @import fmsb
#' @import BgeeDB
#' @import biomaRt
#' @import topGO
#' @import grDevices
#' @importFrom utils head

GetRelevantNameVector<-function(name){
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
