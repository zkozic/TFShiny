library(shiny)
library(shinyapps)
library(PWMEnrich)
load(file = 'data.RData')

shinyUI(
  navbarPage('Transcription Factor Enrichment',
    tabPanel('TF enrichment',
      sidebarLayout(
        sidebarPanel(
          radioButtons(inputId = 'report', label = NULL, choices = c('Group Report' = 'group', 'Sequence Report' = 'seq'), selected = 'group'),
          selectInput(inputId = 'gene', label = 'Select gene:', choices = sort(genes), width = '100%')
        ),
        mainPanel(
          radioButtons(inputId = 'which.tfs', label = NULL, choices = c('Cortex TFs' = 'cortex', 'All TFs' = 'allTFs'), selected = 'cortex', inline = T),
          br(),
          dataTableOutput(outputId = 'enrichmentTable')
        )
      )
    )
  )
)