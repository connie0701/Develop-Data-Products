#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
myData <- ToothGrowth
myData$dose <- as.factor(myData$dose) 

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("len ~", input$variable)
  })
  
 
  output$choice <- renderText({
    formulaText()
  })
  

  output$toothPlot <- renderPlot({
    coplot(as.formula(formulaText()), 
           data = myData, panel = panel.smooth
           
    )
  })
})
