library(shiny)
library(markdown)
library(shinythemes)


navbarPage(title="papr",
           tabPanel("Rate",
            sidebarLayout(
              sidebarPanel(
                h3("Rate the paper"),
                actionButton("excite_correct", "Exciting and Correct",
                             icon=icon("star",lib="glyphicon"),width='200px'),
                actionButton("excite_question", "Exciting and Questionable",
                             icon=icon("volume-up",lib="glyphicon"),width='200px'),
                actionButton("boring_correct", "Boring and Correct",
                             icon=icon("ok",lib="glyphicon"),width='200px'),
                actionButton("boring_question", "Boring and Questionable",
                             icon=icon("trash",lib="glyphicon"),width='200px'),
                actionButton("skip", "Unsure - skip paper",
                             icon=icon("question"),width='200px'),
                h3("Rate papers & level up:"),
                uiOutput("icon"),
                em(textOutput("level")),
                h3("Download your ratings:"),
                downloadButton("download_data", "Download"),
                h3("Tell someone about papr:"),
                a(href="https://twitter.com/intent/tweet?text=Check%20out%20papr%20its%20like%20Tinder%20for%20preprints%20https://jhubiostatistics.shinyapps.io/papr",icon("twitter")),
                a(href="https://www.facebook.com/sharer/sharer.php?u=https%3A//jhubiostatistics.shinyapps.io/papr",icon("facebook"))
              ),
              mainPanel(
                fluidPage(
                  h5("Title:\n"),
                  p(textOutput("title")),
                  h5("Authors:\n"),
                  p(textOutput("authors")),
                  h5("Abstract:\n"),
                  em(textOutput("abstract")),
                  h5("Link:\n"),
                  uiOutput("link")
                )
              )
            )
           ),
           tabPanel("About",
            fluidPage(
              includeMarkdown("./about.md")
            )
           ),
           tabPanel("Help",
                    fluidPage(
                      includeMarkdown("./help.md")
                    ) 
          ),collapsible=TRUE, windowTitle = "papr - peer review, but easier"
)