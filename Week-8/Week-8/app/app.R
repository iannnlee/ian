ui <- fluidPage(
  h2(textOutput("currentTime")),
  h3(textOutput("timeSum"))
)


server <- function(input, output, session) {
  
  
  current_time <- reactive({
    invalidateLater(500, session)
    Sys.time()
  })
  
  
  time_now <- reactive({
    t <- current_time()
    list(hour = hour(t), minute = minute(t), second = second(t))
  })
  
  output$currentTime <- renderText({
    paste("The time NOW!!! :", format(current_time(), "%Y-%m-%d %H:%M:%OS2"))
  })
  
  output$timeSum <- renderText({
    time_values <- time_now()
    time_sum <- sum(time_values$hour, time_values$minute, time_values$second)
    paste("Sum of hours, minutes, and seconds:", time_sum)
  })
  
}

# Create Shiny app ----
shinyApp(ui, server)
