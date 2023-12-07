library("qrcode")
library("shiny")

ui <- fluidPage(
  numericInput("dni", "DNI", value = "00000000"),
  actionButton("generate", "Generar"),
  plotOutput("qr"),
  align = "center"
)

server <- function(input, output, session) {
  r_qr_plot <- reactiveVal()
  observeEvent(input$generate, {
    r_qr_plot(qr_code(as.character(input$dni), "M"))
  })
  output$qr <- renderPlot({
    req(r_qr_plot())
    plot(r_qr_plot())
  })
}

shinyApp(ui, server)
