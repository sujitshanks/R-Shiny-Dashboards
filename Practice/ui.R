library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage( title = "Demo dashbard :)", skin = "black", 
    dashboardHeader(title = "Shanks Backyard", dropdownMenuOutput("msgoutput"),
                    # dropdownMenu(type = "message",
                    #              messageItem(from = "Finance update", message = "We are on the threshold"),
                    #              messageItem(from = "Sales Update", message = "Sales are at 55%", icon = icon("bar-chart"), time = "22:00"),
                    #              messageItem(from = "Sales Update", message = "Sales meeting at 6pm on Monday", icon = icon("handshake-o"), time = "02-01-2021")
                    # )
                      dropdownMenu(type = "notifications",  
                                   notificationItem(
                                     text = "2 new tabs added to the dashboard",
                                     icon = icon("dashboard"),
                                     status = "success"
                                   ),
                                   notificationItem(
                                     text = "Server is currently at 96% load",
                                     icon = icon("warning"),
                                     status = "warning"
                                   )
                                   ),
                      dropdownMenu(type = "tasks",
                                   taskItem(value = 80,
                                   color = "aqua",
                                   "Learning Shiny Dashboard"
                                  ),
                                  taskItem(value = 55, color = "red", "Overall R Education"),
                                  taskItem(value = 40, color = "red", "Data Science Education")
                                  )
                    ),
    
    
    dashboardSidebar(
      sidebarMenu(
        sidebarSearchForm("searchText", "buttonSearch","Search"),
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
         menuSubItem("Dashboard: Finance", tabName = "finance"),
         menuSubItem("Dashboard: Sales", tabName = "sales"),
      menuItem("Detailed Analysis", badgeLabel = "New", badgeColor = "green"),
      menuItem("Raw Data")
      # the idea here is to allow for sidebar control to retrieve from files or
      #database. For that, make a similar connection on the server side: see server.R
    )),
    dashboardBody(
      #everything in the body needs to be in a box
      tabItems(
        
        tabItem(tabName = "dashboard", 
        fluidRow(
          column(width = 9, 
          infoBox("Sales", 15000,icon = icon("thumbs-up")),
          infoBox("Conversion %", paste0('20%'), icon = icon("warning")),
          infoBoxOutput("approvedSales")
          )
        ),
        
        
        fluidRow(
          valueBox(15*200, "Budget for 15 days", icon = icon("hourglass-2")),
          valueBoxOutput("itemRequested")
          
        ),
        
        fluidRow(
          #creating tab panels
          tabBox(
          tabPanel(title = "Histogram of Faithful dataset", status = "primary", solidHeader = T, background = "aqua", plotOutput("histogram")),
          tabPanel(title = "Controls for Dashboard", status = "warning", background = "green", solidHeader = T,
              "Use these controls to finetune your dashboard.",br(), "Do not use lot of controls to avoid confusion.",
              sliderInput("bins","Number of Breaks", 1, 100, 50),
              textInput("text_input","Search Opportunities", value = "123456" ))
                 
                 )
             )),
        
        tabItem(tabName = "finance",
                h1("Finance Dashboard")
                )
            ,
        tabItem(tabName = "sales",
                h2("Sales Dashboard")
                ))
      
      
    )
   )
)
