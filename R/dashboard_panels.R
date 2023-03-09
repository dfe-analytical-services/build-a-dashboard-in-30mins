dashboard_panel <- function() {
  tabPanel(
    value = "dashboard",
    "Dashboard",

    # Define UI for application that draws a histogram

    # Sidebar with a slider input for number of bins
    gov_main_layout(
      gov_row(
        column(
          width = 12,
          h1("Dashboard in 30 mins workforce data demo"),
        ),
        column(
          width = 12,
          div(
            class = "well",
            style = "min-height: 100%; height: 100%; overflow-y: visible",
            gov_row(
              column(
                width = 4,
                selectizeInput("breakdown",
                  "Select a breakdown",
                  choices = list('gender', 'grade')
                )
              ),
              column(
                width = 4,
                selectizeInput(
                  inputId = "selectArea",
                  label = "Choose an area:",
                  choices = choicesAreas$area_name
                )
              ),
              column(
                width = 4, 
                radioGroupButtons(inputId = 'headcount_fte',
                                  choices = list('headcount', 'full_time_equivalent'))
              ),
              column(
                width = 12,
                paste("Download the underlying data for this dashboard:"), br(),
                downloadButton(
                  outputId = "download_data",
                  label = "Download data",
                  icon = shiny::icon("download"),
                  class = "downloadButton"
                )
              )
            )
          )
        ),
        column(
          width = 12,
          tabsetPanel(
            id = "tabsetpanels",
            tabPanel(
              "Time series",
              fluidRow(
                column(
                  width = 12,
                  h2("Time series line chart"),
                  box(
                    width = 12,
                    plotlyOutput("lineRevBal")
                  )
                )
              )
            ),
            tabPanel(
              "Teacher table",
              fluidRow(
                column(
                  width = 12,
                  h2("Teacher table"),
                  p("This is the standard paragraph style for adding guiding info around data content."),
                  column(
                    width = 12,
                    dataTableOutput("tabBenchmark")
                  )
                )
              )
            )
          )
        )
        # add box to show user input
      )
    )
  )
}
