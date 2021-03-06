library(shiny)
library(shinydashboard)

shinyServer(function(input, output){
  output$histogram <- renderPlot({
    hist(faithful$eruptions, breaks = input$bins)
  })
  
  #dynamic way to get messages: basically automating it
  output$msgoutput <- renderMenu({
    msgs <- apply(read.csv("messages.csv"),1,function(row){
      messageItem(from = row[["from"]], message = row[["message"]])
    })
    
    dropdownMenu(type = "messages", .list = msgs)# .list to send  all messages at once
  })
  
  
  output$approvedSales <- renderInfoBox(
    {
      infoBox("Approved Sales", "10,00,000", icon = icon("bar-chart-o"))
    }
  )
  
  output$itemRequested <- renderValueBox(
    {
     valueBox(15*300,"Item Requested by employees", icon = icon("fire"), color = "yellow") 
    }
  )
})
