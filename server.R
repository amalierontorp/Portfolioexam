

# Define server logic
shinyServer(function(input, output) {
  # Coefficients from model 4 (replace with your actual coefficients)
  coef_fragmentation <- 0.350
  coef_polarization <- -0.313
  
  # Calculate effects based on user input
  observeEvent(input$update, {
    delta_x_fragmentation <- input$fragmentation_change
    delta_x_polarization <- input$polarization_change
    
    # Log odds changes
    log_odds_change_fragmentation <- coef_fragmentation * delta_x_fragmentation
    log_odds_change_polarization <- coef_polarization * delta_x_polarization
    
    # Odds changes
    odds_change_fragmentation <- exp(log_odds_change_fragmentation)
    odds_change_polarization <- exp(log_odds_change_polarization)
    
    output$fragmentation_effect <- renderText({
      paste("Change in odds for fragmentation:", round(odds_change_fragmentation, 4),
            "(log odds change:", round(log_odds_change_fragmentation, 4), ")")
    })
    
    output$polarization_effect <- renderText({
      paste("Change in odds for polarization:", round(odds_change_polarization, 4),
            "(log odds change:", round(log_odds_change_polarization, 4), ")")
    })
  })
})
