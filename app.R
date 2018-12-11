library(shiny)

ui <- fluidPage(
  
  titlePanel("Лабораторна робота № 6. Підрахунок комунальних пслуг"),
  
  sidebarLayout(position = "right",
                sidebarPanel (h3 ("Результат квитанція"),
                              a("Світло, сума:"),
                              textOutput("result1"),
                              a("Вода, сума:"),
                              textOutput("result2"),
                              a("Газ, сума:"),
                              textOutput("result3"),
                              p("-----------------------"),
                              a("Загальна вартість, сума:"),
                              textOutput("resultAll")),
                mainPanel(
                  textInput("inputLight1", "Введіть попередні показники лічильника світла"),
                  textInput("inputLight2", "Введіть поточні показники лічильника світла"),
                  p("Тариф 1,68 грн/КВт"),
                  p("---------------------------------------------------------------------------------"),
                  textInput("inputWater1", "Введіть попередні показники лічильника води"),
                  textInput("inputWater2", "Введіть поточні показники лічильника води"),
                  p("Тариф 7,19 грн/куб"),
                  p("---------------------------------------------------------------------------------"),
                  textInput("inputGas1", "Введіть попередні показники лічильника газу"),
                  textInput("inputGas2", "Введіть поточні показники лічильника газу"),
                  p("Тариф 8,50 грн/куб"),
                  p("---------------------------------------------------------------------------------")
                )
  ))

server <- function(input, output) {
  
  lightSum<- reactive((as.numeric(input$inputLight2) - as.numeric(input$inputLight1)) * 1.68, label = "0")
  output$result1<- lightSum
  waterSum<- reactive((as.numeric(input$inputWater2) - as.numeric(input$inputWater1)) * 7.19, label = "0")
  output$result2<- waterSum
  gasSum<- reactive((as.numeric(input$inputGas2) - as.numeric(input$inputGas1)) * 8.5, label = "0")
  output$result3<- gasSum
  output$resultAll<- reactive(as.numeric(lightSum()) + as.numeric(waterSum()) + as.numeric(gasSum()), label = "0")
}

shinyApp(ui = ui, server = server)
