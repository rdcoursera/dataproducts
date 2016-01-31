shinyUI(fluidPage(titlePanel("Stock Analyzer"),
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectORtext"),
      radioButtons(
        "radio",label = "Select Input Type", choices =
          list("Select Stock" = "radioSelect", "Input Stock" = "radioText"), selected = NULL
      ),
      dateRangeInput(
        "dateRange", label = 'Date range input: yyyy-mm-dd',
        start = Sys.Date() - 90,
        end = Sys.Date()
      ),
      radioButtons(
        "type","Chart Type",
        c(
          "Candle Sticks" = "candlesticks",
          "Match Sticks" = "matchsticks",
          "Bars" = "bars",
          "Line" = "line"
        ),
        selected = "candlesticks"
      ),
      selectInput(
        "indicators", "Indicators:",
        choices = list(
          volatility = c("None" = "","Bollinger Bands" = "addBBands()"),
          trend = c(
            "Moving Average Conv Div" = "addMACD()",
            "Welles Wilder’s Directional Movement Indicator" = "addADX()",
            "Double Exponential Moving Average" = "addDEMA()"
          ),
          momentum = c("Relative Strength Indicator" = "addRSI()"),
          volume = c("Volume" = "addVo()",
                     "Chaiken Money Flow" = "addCMF()")
        )
      )
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Chart",plotOutput('mychart')),
        tabPanel("DataTable",DT::dataTableOutput('stocktable')),
        tabPanel("Documentation",includeMarkdown("./projectdocumentation.md"))
      )
    )
  )
)
)


#         radioButtons(
#           "radio",label = "Select Input Type", choices =
#             list("Select Stock" = "radioSelect", "Input Stock" = "radioText"), selected = NULL
#         ),
#         dateRangeInput(
#           "dateRange", label = 'Date range input: yyyy-mm-dd',
#           start = Sys.Date() - 90,
#           end = Sys.Date()
#         ),
#         radioButtons(
#           "type","Chart Type",
#           c(
#             "Candle Sticks" = "candlesticks",
#             "Match Sticks" = "matchsticks",
#             "Bars" = "bars",
#             "Line" = "line"
#           ),
#           selected = "candlesticks"
#         ),
#         selectInput(
#           "indicators", "Indicators:",
#           choices = list(
#             volatility = c("None" = "","Bollinger Bands" = "addBBands()"),
#             trend = c(
#               "Moving Average Conv Div" = "addMACD()",
#               "Welles Wilder’s Directional Movement Indicator" = "addADX()",
#               "Double Exponential Moving Average" = "addDEMA()"
#             ),
#             momentum = c("Relative Strength Indicator" = "addRSI()"),
#             volume = c("Volume" = "addVo()",
#                        "Chaiken Money Flow" = "addCMF()")
#           )
#         )
#       ),
#      mainPanel(plotOutput('mychart'))
#    )))
#   tabPanel("Data Table", DT::dataTableOutput('stocktable')),
#   tabPanel("Documentation",includeHTML("projectdocumentation.html"))))