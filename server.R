library(shiny)
library(mixsmsn)
library(mvtnorm)

bMI <- function(weight,height,unitsystem) (weight/(height*height))*as.numeric(unitsystem)
#Loading data
data(bmi)
bmidata <-bmi$bmi


shinyServer(function(input, output) {

    output$bMICalc <- renderPrint({round(bMI(input$weight,input$height,input$unitsystem),2)})
    output$distBMIPlot <- renderPlot({
      
      # generate an rnorm distribution and plot it
      hist(bmidata,breaks=10, col="lightblue",
           xlab="Body Mass Index (red line shows your BMI)",
           main="Results from 2107 people from mixsmsn data package")
      abline(v=bMI(input$weight,input$height,input$unitsystem),col="red")
      #polygon(c(30,30,35,35),c(0,100,100,0),density = c(10, 20), angle = c(-45, 45))
      
     
 
}) #renderPlot
# output$textW<-renderText({
#   if(input$unitsystem==1){
#        textW<-"kg"
#   }
#   else
#      textW<-"lb"
#     })

# Generate a summary of the dataset
output$summary <- renderPrint({
    summary(bmi)
})

output$category <- renderText({
  if (bMI(input$weight,input$height,input$unitsystem) >= 40 ) { 
    category<-"Obese Class III :Morbidly Obese"
  }
  else
  {
    if ((bMI(input$weight,input$height,input$unitsystem) >= 35 ) && (bMI(input$weight,input$height,input$unitsystem) < 40 ) )  { 
      category<-"Obese Class II: Severely Obese"
    }
    else
    {
      if ((bMI(input$weight,input$height,input$unitsystem) >= 30 ) && (bMI(input$weight,input$height,input$unitsystem) < 35 ) )  { 
        category<-"Obese Class I: Obese"
      }
      else
      {
        if ((bMI(input$weight,input$height,input$unitsystem) >= 25 ) && (bMI(input$weight,input$height,input$unitsystem) < 30 ) )  { 
          category<-"Overweight"
        }
        else
        {
          if ((bMI(input$weight,input$height,input$unitsystem) >= 18.5 ) && (bMI(input$weight,input$height,input$unitsystem) < 25 ) )  { 
            category<-"Normal"
          }
          else
          {
            if (bMI(input$weight,input$height,input$unitsystem) < 18.5 )  { 
              category<-"Underweight"
            }
            
          }  
          
        }  
        
      }  
      
    }  
    
  }  
 
})
}) #shinyServe