#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(MASS)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  bosHouseData <- Boston
  rowresult <- ""
  results <- ""
  sliderPCT <- 0
  
  
  setSeed <- reactive({set.seed(input$seed)})
  
  
  output$distPlot <- renderPlot({
    if (sliderPCT == 0 || sliderPCT != input$sliderTrainPCT)
    {  
      sliderPCT <- input$sliderTrainPCT
      train_rows <- sample(nrow(Boston), round(nrow(bosHouseData) * sliderPCT))
    }  
    trainSet <- Boston[train_rows, ]
    testSet <- Boston[-train_rows, ]
    if(input$showTrainInfo) {
      rowresult <- paste0("Total No of Rows: ",nrow(bosHouseData),"  ,")  
      rowresult <- paste0(rowresult,"No of Train Rows: ",length(train_rows),"  ,")
      rowresult <- paste0(rowresult,"Train Sample %: ",sliderPCT)
    }
  
    mdl <- lm(medv ~ .,data=trainSet)
    p.medv <- predict(mdl, newdata=testSet)
    rid <- 1:nrow(testSet)
    ndf <- data.frame(id=rid, obs = testSet$medv, pred=p.medv)
  
    baseplot = ggplot(data=ndf,aes(x=id,y=obs,group=1,color="Actual"))
    plot = baseplot + geom_line() + geom_point() 
    plot = plot + geom_line(aes(id,pred,color="Modeled")) 
    plot = plot + ggtitle("Simple Linear Model Prediction with Test data, of Median home value in Boston")
    plot = plot + xlab("Test Row ID") + ylab("Median Value in $1000's ")
    print(plot)                                                         
    
    if (input$showModelSummary) {
      resultSum <- summary(mdl)
      results <- paste0("Test R Squared: ", resultSum$r.squared)
      
    }
  
    output$trainRows <- renderText({rowresult})
    output$testModelSummary <- renderText({results})
 
  })
  
  
  
  
})
