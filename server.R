library(shiny)
library(shinyapps)
load(file = 'data.RData')

shinyServer(
  function(input, output){
    entab <- reactive({
      if(input$report == 'group'){
        tab <- as.data.frame(groupReport(filt.nres))[, -2]
      }else{
        tab <- as.data.frame(sequenceReport(filt.nres, input$gene))[, -2]
      }
    })
    output$enrichmentTable <- renderDataTable(entab())
  }
)