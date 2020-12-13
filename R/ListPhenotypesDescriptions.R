#'This function list the phenotype descriptions that ensembl uses that can be used as feature paramters
#'
#' @return list of Phenotype Descriptions
#' @export
#'
#' @examples
#' List<-ListPhenotypesDescriptions()
ListPhenotypesDescriptions<-function(){
  return(c(ZooGVT::phyenotypeDescriptions))
}
