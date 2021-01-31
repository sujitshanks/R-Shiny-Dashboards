library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Shanks Backyard"),
    dashboardSidebar(
      menuItem("Dashboard"),
         menuSubItem("Dashboard: Finance"),
         menuSubItem("Dashboard: Sales"),
      menuItem("Detailed Analysis"),
      menuItem("Raw Data")
    ),
    dashboardBody()
   )
)
