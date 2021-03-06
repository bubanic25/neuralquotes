#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyquant)
library(forecast)
library(ggthemes)
library(tseries)
library(lubridate)
library(timetk)
library(scales)
library(forecast)  
library(rlang) #  forecasting pkg
library(sweep)   # Broom tidiers for forecast pkg
library(broom)
library(tibble)
library(stringr)
library(knitr)
library(quantmod)
library(shinythemes)
library(ggforce)

theme_set(theme_bw(10))
initialTicker <- "DOJ"


# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("slate"),
                
                # Application title
               
                
                
                
                
                
                
                
                sidebarLayout(
                  sidebarPanel(
                    
                    textInput("ticker", "Ticker", ""),
                    dateInput("dateStart", "Start Date of Analysis:", value = "1900-01-21"),
                    dateInput("dateEnd", "End Date of Analysis:", value = "2021-05-09"),
                    
                    sliderInput("sliderForecast", "Number of Days to Forecast", 30, 365, 30),
                    
                    
                    
                    sliderInput("sliderSims", "Number of Simulations", 100, 10000, 1000),
                    
                    helpText("Note: At Default Setting this forecasting simulation takes about 2 minutes to execute per Quote.",
                             "",
                          "Increasing the amount of Days to Forecast greatly increases execution times while decreasing predictable probabilities.",
                             "",
                             "Increasing the number of simulations preformed greatly increases execution times while increases predictable probabilities"
                             ),
                    
                    actionButton("run", "Run")
                  ),
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  mainPanel(
                    
                    
                    fluidRow(
                      column(           
                        width = 10,
                        
                        
                        plotOutput("topPlot", dblclick = "topPlot_dblclick",
                                   brush = brushOpts(
                                     id = "topPlot1_brush",
                                     resetOnNew = TRUE)
                                   
                                   
                        )
                      )
                    ),
                    
                    
                    fluidRow(
                      column(
                        
                        
                        plotOutput("bottomPlot"),
                        width = 10
                        
                      )
                      
                      
                    )
                    
                  )
                  
                )
                
                
                
                
                
                
                
                
                
                
                
                
                
)
