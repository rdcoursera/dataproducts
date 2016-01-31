library(UsingR)
library(quantmod)
library(shiny)
library(DT)


shinyServer(function(input, output,session) {
  output$selectORtext <- renderUI({
    validate(need(!is.null(input$radio),"Please select an input type"))
    if (input$radio == "radioText") {
      textInput("textStock","Input Stock Symbol:", "")
    }else{
      selectInput(
        "stock", "Choose Stock:",
        c(
          "Apple" = "AAPL",
          "Google" = "GOOG",
          "Amazon" = "AMZN"
        ),
        selected = "APPL"
      )
      
    }
    
  })
  getstocksymbol <- reactive({
    if (input$radio == "radioText") {
      stockSymbol <- input$textStock
    }else{
      if (input$radio == "radioSelect") {
        stockSymbol <- input$stock
      }
    }
    return(stockSymbol)
  })

  output$stocktable <- DT::renderDataTable({
    stockSymbol <- getstocksymbol()
    if (!is.null(stockSymbol) && stockSymbol != "") {
      #      stockdata <- d$stockdata
      stockdata <- getSymbols(stockSymbol,auto.assign = FALSE)
      stockdata <-
        stockdata[paste(input$dateRange[1],input$dateRange[2],sep ="::")]
      df <<- data.frame(date = index(stockdata),coredata(stockdata))
    }
  })
  output$mychart <- renderPlot({
    stockSymbol <- ""
    
    validate(need(
      input$dateRange[2] > input$dateRange[1], "end is earlier than start date"
    ))
    
  stockSymbol <- getstocksymbol()
    if (!is.null(stockSymbol) && stockSymbol != "") {
      stockdata <- getSymbols(stockSymbol,auto.assign = FALSE)
      c <<- chartSeries(
        stockdata,name = stockSymbol,
        type = input$type,
        subset = paste(input$dateRange[1],input$dateRange[2],sep =
                         "::")
      )
      if (input$indicators != "")
        eval(parse(text = input$indicators))
    }
  })
})