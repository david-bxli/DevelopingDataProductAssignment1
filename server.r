library(shiny)
data(mtcars)
mtcars<-mtcars[,c("mpg","cyl","hp","wt")]

coeffFromCyl<-function(){
        return(lm(mpg ~ cyl, data = mtcars)$coeff)
}

coeffFromHp<-function(){
        return(lm(mpg ~ hp, data = mtcars)$coeff)
}

coeffFromWt<-function(){
        return(lm(mpg ~ wt, data = mtcars)$coeff)
}

plotFromCyl<-function(drawLm){
        plot(mtcars$cyl, mtcars$mpg)
        if(drawLm)
                abline(lm(mpg~cyl , data = mtcars), col = "green")
}

plotFromHp<-function(drawLm){
        plot(mtcars$hp, mtcars$mpg)
        if(drawLm)
                abline(lm(mpg~hp , data = mtcars), col = "green")
}

plotFromWt<-function(drawLm){
        plot(mtcars$wt, mtcars$mpg)
        if(drawLm)
                abline(lm(mpg~wt , data = mtcars), col = "green")
}

shinyServer(
        function(input,output){
                output$oid1<- renderText({
                        type <- input$id1
                        print(type)
                        if(class(type)=="NULL")
                                return("Select a value")
                        if (type == "cyl")
                                return(coeffFromCyl())
                        else if (type == "hp")
                                return(coeffFromHp())
                        else if(type == "wt")
                                return(coeffFromWt())
                })
                output$plot<- renderPlot({
                        type <- input$id1
                        if(class(type)=="NULL")
                                return("Select a value")
                        drawLm<-FALSE
                        if(class(input$drawLm) == "NULL")
                                drawLm <- FALSE
                        else
                                drawLm <- TRUE
                        if (type == "cyl")
                                return(plotFromCyl(drawLm))
                        else if (type == "hp")
                                return(plotFromHp(drawLm))
                        else if(type == "wt")
                                return(plotFromWt(drawLm))
                })
        })