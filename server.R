#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("len ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$choice <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$toothPlot <- renderPlot({
    coplot(as.formula(formulaText()), 
           data = myData, panel = panel.smooth
           
    )
  })
})

# Run the application 
shinyApp(ui = ui, server = server)