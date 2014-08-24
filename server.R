library(shiny)
library(ggplot2)
shinyServer(function(input, output) {  
  output$plot<- renderPlot({
    qplot(x=airquality[,input$xcol], y=airquality[,input$ycol], xlab=input$xcol, ylab=input$ycol)+geom_point(shape=1) + geom_smooth()
  })
  
  output$summary <- renderPrint({
    summary(airquality)
  })
  
  # Generate an HTML table view of the data
  output$table <- renderTable({
    data.frame(airquality)
  })
})