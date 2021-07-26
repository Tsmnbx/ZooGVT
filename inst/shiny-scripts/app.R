library(shiny)

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
      nameList<-GetRelevantNameVector(as.character(input$select))
      title <- "Pheyotype Features"
      GenesFromAnatomy(nameList[2],nameList[1], input$Feature)
    })


  })




}

shiny::shinyApp(ui = ui, server = server)


