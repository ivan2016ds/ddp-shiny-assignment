library(shiny)
library(plotly)

shinyUI(fluidPage(
    titlePanel("Iris Classification using Random Forest"),
    h5("Ivan"),
    h5("28th April 2017"),
    sidebarLayout(
        sidebarPanel(
            selectInput("yVar", "Y Variable:",
                        c("Petal.Length" = "Petal.Length",
                          "Petal.Width" = "Petal.Width",
                          "Sepal.Length" = "Sepal.Length",
                          "Sepal.Width" = "Sepal.Width"),
                        selected="Petal.Width"),            
            selectInput("xVar", "X Variable:",
                        c("Petal.Length" = "Petal.Length",
                          "Petal.Width" = "Petal.Width",
                          "Sepal.Length" = "Sepal.Length",
                          "Sepal.Width" = "Sepal.Width"),
                        selected="Petal.Length")
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Result", 
                    plotlyOutput("plot1"),
                    textOutput("res1")
                 ),
                tabPanel("Documentation", 
                         "
This Shiny application build a simple randomForest model on iris dataset, targeting Species variable, with 2 predictors selected from GUI.
Misclassification rate will be calculated and displayed in terms of percentage value and also in the scatter plot.
                         "
                         )
            )
        )
    )
))
