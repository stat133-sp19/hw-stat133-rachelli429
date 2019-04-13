library(shiny)
library(ggplot2)
library(tidyr)

ui <- fluidPage(
   
   titlePanel("Saving-Investing Modalities"),

   fluidRow(
     
     column(4, 
            sliderInput(inputId = "initial",
                        label = "Initial Amount",
                        min = 0,
                        max = 100000,
                        step = 500,
                        value = 1000)
            ),
     
     column(4,
            sliderInput(inputId = "return",
                   label = "Return Rate",
                   min = 0,
                   max = 20,
                   step = 0.1,
                   value = 5)
            ),
     
     column(4, 
            sliderInput(inputId = "years",
                        label = "Years",
                        min = 0,
                        max = 50,
                        step = 1, 
                        value = 20)
     )
   ),
       
   fluidRow(
     column(4, 
            sliderInput(inputId = "contrib",
                        label = "Annual Contribution",
                        min = 0,
                        max = 50000,
                        step = 500,
                        value = 2000)
            ),
     
     column(4,
            sliderInput(inputId = "growth",
                        label = "Growth Rate",
                        min = 0,
                        max = 20,
                        step = 0.1,
                        value = 2)
            ),
     
     column(4, selectInput(inputId = "facet",
                           label = "Facet?",
                           choices = c("No", "Yes"))
            )
     
   ),
    h4("Timelines"),
    plotOutput("timeline"),
   
   h4("Balances"),
    verbatimTextOutput("balances")
)

server <- function(input, output) {
  
  dat <- reactive({
    
    future_value <- function(amount, rate, years) {
      return(amount * (1 + rate) ^ years)
    }
    
    annuity <- function(contrib, rate, years) {
      return(contrib * (((1 + rate) ^ years - 1) / rate))
    }
    
    growing_annuity <- function(contrib, rate, growth, years) {
      return(contrib * (((1 + rate) ^ years - (1 + growth) ^ years) / (rate - growth)))
    }
    
    initial <- input$initial
    period <- input$years
    contrib <- input$contrib
    growth <- input$growth / 100
    return <- input$return / 100
    
    no_contrib <- vector()
    
    for (i in 0:period) {
      bal <- future_value(initial, return, i)
      no_contrib[i + 1] <-  bal 
    }
    
    growing_contrib <- vector()
    
    for (i in 0:period) {
      initial_bal <- future_value(initial, return, i)
      growing_bal <- growing_annuity(contrib, return, growth, i)
      growing_contrib[i + 1] <- initial_bal + growing_bal
    }
    
    fixed_contrib <- vector()
    
    for (i in 0:period) {
      initial_bal <- future_value(initial, return, i)
      annuity_bal <- annuity(contrib, return, i)
      fixed_contrib[i + 1] <- initial_bal + annuity_bal
    }
    
    options(width = 100)
    year <- seq(0, period)
    return(data.frame(year, no_contrib, fixed_contrib, growing_contrib))
  })
  
  
  output$timeline <- renderPlot({
    modalities <- dat()
    gathered <- gather(data = modalities[, -1], key = "modality", value = "balance")
    gathered$year <- rep(0:input$years, 3)
    
    gg <- ggplot(data = gathered, aes(x = year, y = balance)) + 
      geom_line(aes(col = modality)) + 
      geom_point(aes(col = modality), pch = 20) + 
      ggtitle("Three modes of investing")
    
    if (input$facet == "Yes") {
      gg <- ggplot(data = gathered, aes(x = year, y = balance, col = modality, fill = modality)) + 
        geom_line() + 
        geom_point(pch = 20) + 
        geom_area(alpha = 0.5) +
        ggtitle("Three modes of investing") + 
        facet_wrap(~ modality) 
      return(gg)
    } else {
      return(gg)
    }
  })
  
  output$balances <- renderPrint({
    
    return(head(dat(), n = 11))
  })

}

# Run the application 
shinyApp(ui = ui, server = server)

