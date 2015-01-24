library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
 
  # Application title
  headerPanel("Body Mass Index Calculator. Adults"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(

      numericInput("weight", "Enter weight:",0, min = 0, max = 500, step = 0.1),
      numericInput("height", "Enter height:",1, min = 1, max = 120, step = 0.01),

   radioButtons("unitsystem", label = "Units:",choices = list("SI (weight=kg,height=m)" = 1, "UK (weight=lb,height=in)" = 703),selected = 1),
   submitButton('Submit'),
   wellPanel(
     helpText(  p(a("Documentation",     href="http://rpubs.com/jlgr/55880",target="_blank")),
                 a("Documentation (PDF Version)", href="documentation.pdf", target="_blank")
     )
   )
   
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    helpText("The body mass index (BMI), or Quetelet index,",
             " is a measure of relative size based on the mass and height of an individual."),
    
    h4("Your BMI is: "),
    verbatimTextOutput("bMICalc"),
    h4("Your category is: "),
    strong(verbatimTextOutput("category")),
    img(src ="bmi.jpg"),
    p("Image Source: http://www.medindia.net/patients/patientinfo/body-mass-index.htm"),
    plotOutput("distBMIPlot"),
    h4("Summary of dataset bmi from mixsmsn data package"),
    verbatimTextOutput("summary")
    
  )
))
