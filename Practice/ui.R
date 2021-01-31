library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Shanks Backyard"),
    dashboardSidebar(
      sliderInput("bins","Number of Breaks", 1, 100, 50),
      menuItem("Dashboard"),
         menuSubItem("Dashboard: Finance"),
         menuSubItem("Dashboard: Sales"),
      menuItem("Detailed Analysis"),
      menuItem("Raw Data")
    ),
    dashboardBody(
      #everything in the body needs to be in a box
      fluidRow(
        box(plotOutput("histogram"))
      )
    )
   )
)
