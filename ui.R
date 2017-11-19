#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
myData <- ToothGrowth
myData$dose <- as.factor(myData$dose) 


# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel("Tooth Growth"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", 
                  "Conditional Variable:",
                  list("length vs dose, given type of supplement"="dose|supp", "length vs supplement, given type of dose"="supp|dose"  )
      )
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      h3(textOutput("choice")),
      
      plotOutput("toothPlot")
    )
  )
))
