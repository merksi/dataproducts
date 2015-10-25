library(shiny)

powertest <- function(difference,sigLevel,desiredPower){
  
  numberOfSubjects<-power.t.test(n=NULL,delta=difference,sd=1,sig.level=sigLevel,
                          power=desiredPower,type="paired",alternative="two.sided")$n
  numberOfSubjects<-ceiling(numberOfSubjects)
  return(numberOfSubjects)
    } 
shinyServer(
  function(input, output) {
    output$difference <- renderPrint({input$difference})
    output$sigLevel <- renderPrint({input$sigLevel})
    output$desiredPower <- renderPrint({input$desiredPower})
    output$numberOfSubjects <- renderPrint({powertest(input$difference, 
                                                input$sigLevel,input$desiredPower)})
  }
)