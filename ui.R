#
# This is the UI definition of the Developing Data Products Shiny Project App 
#


library(shiny)
library(MASS)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Boston 1978 Housing Data Model"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    sidebarPanel(
       sliderInput("sliderTrainPCT",
                   "Training Set %:",
                   min = 0.60,
                   max = 0.90,
                   value = 0.75),
       numericInput("seed",label="Seed",value=1000),
       checkboxInput("showTrainInfo", label="Show Traiing Info", value = FALSE),
       checkboxInput("showModelSummary", label="Show Model Test R Squared", value = TRUE),
       submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       textOutput("trainRows"),
       textOutput("testModelSummary")
       
    )
  )
))
