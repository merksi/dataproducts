library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Power calculation"),
    sidebarPanel(
      numericInput('difference', 'standardized difference (difference/standard deviation)', 1, min = 0.1, max = 20, step = 0.01),
      numericInput('sigLevel', 'significance level', 0.05, min = 0.0, max = 1, step = 0.001),
      numericInput('desiredPower', 'desired power', 0.8, min = 0.0, max = 1, step = 0.001),
      submitButton('Submit')
    ),
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Power Calculation",
                           h3('Number of subjects'),
                           h4('You entered for standardized difference'),
                           verbatimTextOutput("difference"),
                           h4('You entered for significance level'),
                           verbatimTextOutput("sigLevel"),
                           h4('You entered for desired power'),
                           verbatimTextOutput("desiredPower"),
                           h4('resulting in the following number of subjects '),
                           verbatimTextOutput("numberOfSubjects")
                  ), 
                  tabPanel("Documentation", h5('Researchers often do subjective tests to assess the efficacy of a certain treatment. The researchers have to decide how many subjects to use for a test and they use a so-called power test to determine this. '),
                                            h5('This application calculates this number of subjects given '), 
                                            h5('- expected standardized difference (which is the expected difference\\efficacy of the treatment divided by its standard deviation) '), 
                                            h5('- significance level (which is the probability of wrongly rejecting the null hypothesis) '),
                                            h5('- desired power (which is the probability of rejecting the null hypothesis when it is false) ') )) 
    )
  )
)