library(shiny)
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




GenesFromAnatomy<-function(speciesBgee, speciesCommon, feature){
  print("May take a while there is a lot of information that needs to be downloaded first")
  dataframe<-data.frame(row.names=1:1)
  topData<-TopData(speciesBgee)
  print(speciesBgee)

  geneList<-CreateGeneList(speciesCommon, feature)

  print(head(geneList))

  topObject<-TopObj(topData, geneList)
  print("After topObj")
  results <- topGO::runTest(topObject, algorithm = 'weight', statistic = 'fisher')
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
  r<- sample(0:1, 1)
  g<- sample(0:1, 1)
  b<- sample(0:1, 1)
  graph<- fmsb::radarchart(radData,

                           #custom polygon
                           pcol=grDevices::rgb(r,g,b,0.9) , pfcol=grDevices::rgb(r,g,b,0.5), plwd=4 ,

                           #custom the grid
                           cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,max,100), cglwd=0.8,

                           #custom labels
                           vlcex=0.8
  )
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



ui <- fluidPage(

  titlePanel("ZooGVT Anatomy Radar Graph Viewer"),



  selectInput("select", label = h3("Species to Pick from:"),
              choices = list("Human" = "Human", "Cat" = "Cat", "Chicken" = "Chicken", "Cow" = "Cow", "Dog" = "Dog",
                             "Horse" = "Horse" , "Macaque" = "Macaque", "Mouse" = "Mouse", "Pig" = "Pig",
                             "Rat" = "Rat", "Zebrafish" = "Zebrafish"),
              selected = 1),
  hr(),
  fluidRow(column(3, verbatimTextOutput("value"))),


  print("Example Features:"),
  print("pectoral,"),
  print("cardiac,"),
  print("stomach,"),
  textInput(inputId = "Feature",
            label = "Put a Feature"),



  actionButton(inputId = "clicks",label = "submit"),
  print("This may Take a while to finish up"),



  plotOutput(outputId = "radar")

)

server <- function(input, output) {

  observeEvent(input$clicks, {


    output$radar <- renderPlot({
      print("is it here")
      nameList<-GetNamesVec(as.character(input$select))
      title <- "Pheyotype Features"
      GenesFromAnatomy(nameList[2],nameList[1], input$Feature)
    })


  })




}

shiny::shinyApp(ui = ui, server = server)


