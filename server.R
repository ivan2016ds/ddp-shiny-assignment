library(shiny)
library(ggplot2)
library(plotly)
library(randomForest)

shinyServer(function(input, output) {
    output$res1 <- renderText({
        data("iris")
        set.seed(20170428)
        fit <- randomForest(x=iris[,c(input$xVar,input$yVar)],y=iris$Species)
        Misclassified <- ifelse(fit$predicted==iris$Species,0,1)
        output$plot1 <- renderPlotly({
            vis1 <- ggplot(data=iris)
            vis1 <- vis1 + geom_point(aes_string(x=input$xVar,y=input$yVar,color="Species"))
            vis1 <- vis1 + geom_point(aes_string(x=input$xVar,y=input$yVar,color="fit$predicted",alpha="Misclassified"),shape=1,size=3)
            vis1 <- vis1 + ggtitle(paste0(input$yVar," vs ",input$xVar))
            ggplotly(vis1)
        })
        err <- round(mean(fit$confusion[,"class.error"])*100,2)
        paste0("Classification Error Rate : ",err,"%")
    })
})
