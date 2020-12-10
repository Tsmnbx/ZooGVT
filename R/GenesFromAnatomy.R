
#' Create a radar graph of anatomical features and their genes
#'
#' This function takes a species from BgeeDB and creates a Radar graph that
#' displays the number of genes along with the anatomica features
#' @source \url{http://bioconductor.org/packages/release/bioc/vignettes/BgeeDB/inst/doc/BgeeDB_Manual.html}
#'
#' @param speciesBgee The Scientific name of a Species found in BgeeDB
#' @param speciesCommon The common name of the same species in Ensemble
#' @param feature The feature, an adjective that describes what we want to find in the
#'        anatomical features for and how many genes we have for them
#'
#' @return a radar graph that shows the terms and how many genes we find per term
#' @export
#'
#' @examples
#' \dontrun{
#'AnatomyGeneRadarGraph <-GenesFromAnatomy("Danio_rerio","Zebrafish","pectoral fin")
#'}
#' @import fmsb
#' @import BgeeDB
#' @import biomaRt
#' @importFrom utils head

GenesFromAnatomy<-function(speciesBgee, speciesCommon, feature){
  print("May take a while there is a lot of information that needs to be downloaded first")
  dataframe<-data.frame(row.names=1:1)
  topData<-TopData(speciesBgee)
  print(speciesBgee)

  geneList<-CreateGeneList(speciesCommon, feature)

  print(head(geneList))

  topObject<-TopObj(topData, geneList)
  print("After topObj")
  results <- runTest(topObject, algorithm = 'weight', statistic = 'fisher')
  table<- Table(topData, topObject, results)
  for (i in seq_along(table$annotated)){

    organData<-data.frame(c(table$annotated[i]))
    colnames(organData) <- c(table$organName[i])
    print(organData)
    dataframe<-cbind(dataframe, organData)
    print("total anno loop added")
    print(table$organName)
  }

  print("graph stuff")
  max<-max(dataframe[1,])
  min<-min(dataframe[1,])
  rowLength<-length(dataframe[1,])
  radData <- rbind(rep(max,rowLength) , rep(min,rowLength) , dataframe)
  graph<- fmsb::radarchart(radData)
  return(graph)

}



CreateB<-function(name){
  b<-BgeeDB::Bgee$new(species = name)
  return(b)
}


TopData<-function(name){
  bgee<-CreateB(name)
  topData<- BgeeDB::loadTopAnatData(bgee)
  return(topData)
}


TopObj<-function(topData, geneList){
  topObject<-BgeeDB::topAnat(topData, geneList)
  return(topObject)
}


Table<-function(theTopData, theTopObj, results){
  #results <- runTest(theTopObj, algorithm = 'weight', statistic = 'fisher')
  # Display results sigificant at a 1% FDR threshold
  table <- BgeeDB::makeTable(theTopData, theTopObj, results, cutoff = 0.01)
  return(table)
}



InfoVert<-function(){
  ensembl = biomaRt::useEnsembl(biomart="ensembl")
  listOfDataSets<-listDatasets(ensembl)
  return(listOfDataSets)
}

Info<-function(){
  listOfDataSets<-InfoVert()
  ensembl = biomaRt::useEnsemblGenomes(biomart = "metazoa_mart")
  listOfMeta<-listDatasets(ensembl)
  listOfDataSets<-rbind(listOfDataSets,listOfMeta)
  return(listOfDataSets)
}

InfoInvert<-function(){
  ensembl = biomaRt::useEnsemblGenomes(biomart = "metazoa_mart")
  listOfDataSets<-listDatasets(ensembl)
  return(listOfDataSets)
}


createDataListVert<-function(){
  listOfDataSets<-InfoVert()
  DataSets<-listOfDataSets[[1]]
  return(DataSets)
}


createDataListInvert<-function(){
  listOfDataSets<-InfoInvert()
  DataSets<-listOfDataSets[[1]]
  return(DataSets)
}



createSpeciesListVert<-function(){
  listOfDataSets<-InfoVert()
  SpeciesGenes<-listOfDataSets[2]
  SpeciesNames<-c()
  for (SpeciesWGene in SpeciesGenes[[1]]){
    nameRaw<- SpeciesWGene
    nameRaw2<-unlist(strsplit(nameRaw," genes"))
    name<-nameRaw2[1]
    SpeciesNames<-append(SpeciesNames, name)
  }
  return(SpeciesNames)
}


createSpeciesListInvert<-function(){
  listOfDataSets<-InfoInvert()
  SpeciesGenes<-listOfDataSets[2]
  SpeciesNames<-c()
  for (SpeciesWGene in SpeciesGenes[[1]]){
    nameRaw<- SpeciesWGene
    nameRaw2<-unlist(strsplit(nameRaw," genes"))
    name<-nameRaw2[1]
    SpeciesNames<-append(SpeciesNames, name)
  }
  return(SpeciesNames)
}


createSpeciesListInvert()

getIndex<-function(name){
  listS<-createSpeciesListVert()
  for (index in seq_along(listS)){
    if(tolower(name) == tolower(listS[index])){
      return(index)
    }
  }
  print("There is no" + name + "avalible in ensembl")
  return("There is no" + name + "avalible in ensembl")
}


createSpeciesList<-function(){
  list<-c()
  list<-append(list,createSpeciesListVert())
  list<-append(list,createSpeciesListInvert())
  print(list)
  return(list)
}

getIndexInvert<-function(name){
  listS<-createSpeciesListInvert()
  for (index in seq_along(listS)){
    if(tolower(name) == tolower(listS[index])){
      return(index)
    }
  }
  print("There is no" + name + "avalible in ensembl")
  return("There is no" + name + "avalible in ensembl")
}


GetDataSetVert<-function(Species_name){
  index<-getIndex(Species_name)
  if(typeof(index) != "character") {
    datalist<-createDataListVert()
    data<-datalist[index]
    return(data)
  }
  else {
    return(index)
  }
}

GetDataSetInvert<-function(Species_name){
  index<-getIndexInvert(Species_name)
  if(typeof(index) != "character") {
    datalist<-createDataListInvert()
    data<-datalist[index]
    return(data)
  }
  else {
    return(index)
  }
}


whichList<-function(name){
  vert<- createSpeciesListVert()
  inVert<-createSpeciesListInvert()
  if(tolower(name) %in% tolower(vert)){
    match(name,vert)
    return(0)
  }
  if(tolower(name) %in% tolower(inVert)){
    match(name,inVert)
    return(1)
  }
  return(2)
}


GetDataSet<-function(Species_name){
  condition<-whichList(Species_name)

  if(condition == 0) {
    return(GetDataSetVert(Species_name))
  }

  if(condition == 1) {
    return(GetDataSetInvert(Species_name))
  }
  else {
    return("Not ensambl")
  }
}




ensemblMartName <-function(name){
  dataName<- GetDataSet(name)
  condition <- whichList(name)
  if(condition == 0){
    print(dataName)
    ensembl <- biomaRt::useMart(biomart="ensembl", dataset=dataName)
    return(ensembl)

  }
  if(condition == 1){
    print(dataName)
    ensembl<- biomaRt::useMart(biomart = "metazoa_mart",dataset=dataName,host = "metazoa.ensembl.org")
    return(ensembl)
  }

  if(condition == 2){
    print("This species does not appear to be in ensembl")
    return("This species does not appear to be in ensembl")
  }

}

ensemblSpecies<-c("Human","Cat","Chicken","Cow","Dog","Goat","Horse","Macaque","Mouse","Pig","Rat","Sheep (texel)","Turkey","Zebrafish")
length(ensemblSpecies)
not_work<-c("Chimpanzee")

list_phyeno<-list(c("DDG2P","MIM morbid","Orphanet"),c("OMIA"),c("OMIA"),c("OMIA"),c("OMIA"),c("OMIA"),c("OMIA"),c("OMIA"),c("IMPC","MGI"),c("OMIA"),c("RGD"),c("OMIA"),c("GOA","OMIA"), c("ZFIN"))
names(list_phyeno) <-ensemblSpecies
list_phyeno


CreateGeneList<-function(name, feature){
  ensembl<-ensemblMartName(name)
  values<-list_phyeno[name]
  universe <- biomaRt::getBM(filters=c("phenotype_source"), value=values, attributes=c("ensembl_gene_id","phenotype_description"), mart=ensembl)
  #phenotypes <- grep("pectoral fin", unique(universe$phenotype_description), value=T)
  phenotypes <- grep(feature, unique(universe$phenotype_description), value=T)
  myGenes <- unique(universe$ensembl_gene_id[universe$phenotype_description %in% phenotypes])
  geneList <- factor(as.integer(unique(universe$ensembl_gene_id) %in% myGenes))
  names(geneList) <- unique(universe$ensembl_gene_id)
  summary(geneList)
  return(geneList)
}



