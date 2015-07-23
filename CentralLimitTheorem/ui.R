library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("The Central Limit Theorem"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("nosim",
                  "Number of Simulations in sample:",
                  min = 1,
                  max = 500,
                  value = 5,
                  step = 5),
#       sliderInput("size",
#                   "Size of the first experiment:",
#                   min = 10,
#                   max = 100,
#                   value = 10,
#                   step = 10),
      helpText(""),
      helpText("This simple application ilustrates the concept of the Central Limit Theorem.",
               "As the Theorem says, it states that the distribution of averages of iid ",
               "variables (properly normalized) becomes that of a standard normal as the ",
               "sample size increases."),
      helpText("To pratically show the Central Limit Theorem, this application simulates a number of coin flips ",
               "based on the value selected on the slider above.",
               "Each figure at the right ilustrates the distributions of the averages taken from samples ",
               "of size 10, 20, 30 and 40 respectivelly. As we can see, as the number of simulations ",
               "defined on the slider increases, the distributions converge to the normal (gaussian) distribution ",
               "as the sample of averages sizes gets higher ")
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))