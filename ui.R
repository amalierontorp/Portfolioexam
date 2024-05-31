


library(shiny)

# Define UI for application
shinyUI(fluidPage(
  titlePanel("Effect of Fragmentation and Polarization on Leadership Ties"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("fragmentation_change",
                   "Change in Fragmentation (in standard deviations):",
                   min = -1, max = 1, value = 0),
      numericInput("polarization_change",
                   "Change in Polarization (in standard deviations):",
                   min = -1, max = 1, value = 0),
      actionButton("update", "Update")
    ),
    
    mainPanel(
      textOutput("fragmentation_effect"),
      textOutput("polarization_effect")
    )
  )
))