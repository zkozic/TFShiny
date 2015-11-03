library(shiny)
library(shinyapps)
load(file = 'data.RData')

shinyServer(
  function(input, output){
    entab <- reactive({
      if(input$which.tfs == 'cortex'){
        tb <- filt.nres
      }else{
        tb <- nres
      }
      if(input$report == 'group'){
        tab <- as.data.frame(groupReport(tb))[, -2]
      }else{
        tab <- as.data.frame(sequenceReport(tb, input$gene))[, -2]
      }
    })
    output$enrichmentTable <- renderDataTable(entab())
  }
)