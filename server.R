# server.R

library(quantmod)

shinyServer(function(input, output) {

       
  output$plot <- renderPlot({
   
          data1 <- getSymbols(input$symb1, src = "yahoo", 
                              from = input$dates[1],
                              to = input$dates[2],
                              auto.assign = FALSE)
          
          data2 <- getSymbols(input$symb2, src = "yahoo", 
                              from = input$dates[1],
                              to = input$dates[2],
                              auto.assign = FALSE)
          
          new_data1 <- as.vector(data1[,4])
          new_data2 <- as.vector(data2[,4])
          
    par(mfrow = c(3,1))
    p1 <- plot(data1[,4], main = input$symb1) # chartSeries(c(data1, data2), theme = chartTheme("white"), 
       #TA = NULL)
    p2 <- plot(data2[,4], main = input$symb2)
    p3 <- plot(new_data1, new_data2, xlab = input$symb1, ylab = input$symb2)
    abline(lm(new_data2 ~ new_data1), col = "red")
  }, height = 800)
  output$summary <- renderPrint({
          data1 <- getSymbols(input$symb1, src = "yahoo", 
                              from = input$dates[1],
                              to = input$dates[2],
                              auto.assign = FALSE)
          
          data2 <- getSymbols(input$symb2, src = "yahoo", 
                              from = input$dates[1],
                              to = input$dates[2],
                              auto.assign = FALSE)
          
          new_data1 <- as.vector(data1[,4])
          new_data2 <- as.vector(data2[,4])
          
          summary(lm(new_data2 ~ new_data1))
  })
})