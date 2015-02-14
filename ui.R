library(shiny)


shinyUI(pageWithSidebar(
        headerPanel("Car mpg analysis"),
        sidebarPanel(
                radioButtons("id1", label = h4("Predictors"),
                                  choices= list("Cyl" = "cyl",
                                     "HP" = "hp",
                                     "Weight" = "wt"),
                        selected = 1)
                ,
                checkboxGroupInput("drawLm", "",c("Draw Lm line"="yes"),selected =1)
        ),
        mainPanel(
                h2('Coefficient. Outcome is mpg'),
                verbatimTextOutput("oid1"),
                plotOutput('plot'),
                h4('This application is used to caculate coefficients from linear model whose outcome is mpg, predictor is cyl, hp or wt.'),
                h4('1. Select predictor on the side bar'),
                h4('2. If prefer to draw linear regression model, select "Draw Lm line"'),
                h4('3. The result will display in the main panel. Coefficients start with intercept, followed by slope. Plot is based on selected predictor as x axis and mpg as y axis.')
                )
        
))