library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    nosim <- input$nosim
    cfunc <- function(x, n) 2 * sqrt(n) * (mean(x) - 0.5) 
    dat <- data.frame(
      x = c(apply(matrix(sample(0:1, nosim * 10, replace = TRUE), 
                         nosim), 1, cfunc, 10),
            apply(matrix(sample(0:1, nosim * 20, replace = TRUE), 
                         nosim), 1, cfunc, 20),
            apply(matrix(sample(0:1, nosim * 30, replace = TRUE), 
                         nosim), 1, cfunc, 30),
            apply(matrix(sample(0:1, nosim * 40, replace = TRUE), 
                         nosim), 1, cfunc, 40)
      ),
      size = factor(rep(c(10, 20, 30, 40), rep(nosim, 4))))
    g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(binwidth=.3, colour = "black", aes(y = ..density..)) 
    g <- g + stat_function(fun = dnorm, size = 2)
    g + facet_grid(. ~ size)
  })
})