#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)



shinyUI(fluidPage(
  

  titlePanel("Tooth Growth"),
  

  sidebarLayout(
    sidebarPanel(
      selectInput("variable", 
                  "Conditional Variable:",
                  list("length vs dose, given type of supplement"="dose|supp", "length vs supplement, given type of dose"="supp|dose"  )
      )
      
    ),
    
   
    mainPanel(
      
      h3(textOutput("choice")),
      
      plotOutput("toothPlot")
    )
  )
))
