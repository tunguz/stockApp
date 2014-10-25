library(shiny)

shinyUI(fluidPage(
  titlePanel("Stock Liner Regression"),
  
  sidebarLayout(
    sidebarPanel(
            helpText("This Shiny app allows you to select two different tech 
                     stocks (IBM, HP, Amazon, Microsoft, and Yahoo)
                     for a given time period, and then it displeys the 
                     possible correlation between them, as well as graphs of 
                     their individual performances."),
            br(),
            br(),
            
            helpText("Select the first stock to examine. 
                        Information will be collected from yahoo finance."),
            selectInput("symb1", "Choose a dataset:", 
                        choices = c("IBM", "HP", "MSFT", "YHOO", "AMZN")),
            helpText("Select the second stock to examine. 
                        Information will be collected from yahoo finance."),
            selectInput("symb2", "Choose a dataset:", 
                        choices = c("IBM", "HP", "MSFT", "YHOO", "AMZN")),
    
      dateRangeInput("dates", 
        "Date range",
        start = "2013-01-01", 
        end = as.character(Sys.Date()))
      
      
    ),
    
    mainPanel(verbatimTextOutput("summary"), plotOutput("plot"))
  )
))