shinyUI(fluidPage(  
  titlePanel("Stock Charts"), 
  plotOutput('mychart'),
  hr(),
  fluidRow(
    column(3,
           dateRangeInput("dateRange", label = 'Date range input: yyyy-mm-dd',
                          start = Sys.Date()-90,
                          end = Sys.Date()
                        ),

            radioButtons("radio",label = "Select Input Type", choices =
            list("Select" = "radioSelect", "Text" = "radioText"), selected = NULL),
           uiOutput("selectORtext")
    ),
    column(3,
           selectInput("indicators", "Indicators:",
                       choices = list(
                         volatility = c("None"="",
                         "Bollinger Bands" = "addBBands()"),
                         trend = c(
                         "Moving Average Conv Div" = "addMACD()",
                         "Welles Wilder’s Directional Movement Indicator" = "addADX()",
                         "Double Exponential Moving Average" = "addDEMA()"),
                         momentum = c(
                           "Relative Strength Indicator" = "addRSI()"
                         ),
                         volume = c(
                           "Volume" = "addVo()",
                           "Chaiken Money Flow" = "addCMF()"
                         ))),
           radioButtons("type","Chart Type",
                        c("Candle Sticks" = "candlesticks",
                          "Match Sticks" = "matchsticks",
                          "Bars" = "bars",
                          "Line" = "line"),
                        selected = "candlesticks")
           
           
#                      submitButton()
    )
    
  )
))