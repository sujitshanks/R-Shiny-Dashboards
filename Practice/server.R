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
})
