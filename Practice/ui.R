library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
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
      sliderInput("bins","Number of Breaks", 1, 100, 50),
      sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
         menuSubItem("Dashboard: Finance", tabName = "finance"),
         menuSubItem("Dashboard: Sales", tabName = "sales"),
      menuItem("Detailed Analysis"),
      menuItem("Raw Data")
    )),
    dashboardBody(
      #everything in the body needs to be in a box
      tabItems(
        tabItem(tabName = "dashboard", 
        fluidRow(
          box(plotOutput("histogram"))
                 )
                ),
        
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
