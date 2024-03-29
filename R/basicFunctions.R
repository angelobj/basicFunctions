## Steps to create an R package. Use Github Desktop!
# 1.- Set working directory to parent folder
#setwd("parent_directory")
# 2.- Create a New project from RStudio
# 3.- Create an R file with all the functions inside the R folder of the created folder in 2
# Select the file to be included when creating the New Project
# 4.- Generate documentation based on the functions
# roxygen2::roxygenise()
#document()
library(devtools)
library(roxygen2)
# 5.- Commit the package from within RStudio by opening the project and then in the right upper panel
# Check documentation
# ?'%!in%'

# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#' Function to find elements (TRUE or FALSE) in 'x' different than 'y'.
#' @name not_in
#' @param x Vector to look for
#' @param y Elements to exclude from 'x'
#' @keywords not_in
#' @examples
#' x<-c(1,2,3);y<-c(3)
#' x %!in% y
#' @export
`%!in%` <- function(x,y) !('%in%'(x,y))

#' Function to find elements of 'x' elements different than 'y'.
#' @name not_idx
#' @param x Vector to look for
#' @param y Elements to exclude from 'x'
#' @keywords !in
#' @examples
#' x<-c(1,2,3);y<-c(3)
#' x %!idx% y
#' @export
`%!idx%` <- function(x,y)  x[!('%in%'(x,y))]

#' Function to find intersect of 'x' and 'y'.
#' @name idx
#' @param x Vector to look for
#' @param y Elements to exclude from 'x'
#' @keywords !in
#' @examples
#' x<-c(1,2,3);y<-c(3)
#' x %idx% y
#' @export
`%idx%` <- function(x,y)  x[('%in%'(x,y))]

#' Function to find elements in 'x' greater than the treshold 'tsh' for shading SPM.
#' @param x Vector
#' @param tsh Numeric variable
#' @examples
#' x<-sin(seq(0,pi,by=0.1));plot(x)
#' find_diffs(x,0.8)
#' abline(v = find_diffs(x,0.8), col="red", lwd=3, lty=2)
#' abline(h = 0.8, col="blue", lwd=3, lty=2)
#' @export
find_diffs<-function(x,tsh){
  points<-c(which(x>=tsh),which(x<=-tsh))
  w<-length(which(diff(points)!=1))+1
  data.frame(
    'min_shade'=sort(c(points[1],points[which(diff(points)!=1)+1])),
    'max_shade'=sort(c(points[which(diff(points)!=1)],points[length(points)])))
}

#' Function to plot circles in ggplot
#' @param rx Radius of the circle in x axis
#' @param ry Radius of the circle in y axis
#' @param start Angle (in degrees) from where to start drawing (from vertical)
#' @param end Angle (in degrees) to end the drawing
#' @param xstart X coordinate of the origin of the circle
#' @param ystart Y coordinate of the origin of the circle
#' @export
circleFun<-function(rx=1,ry=1,start=0,end=360,length=360,xstart=0,ystart=0){
  angle<-seq(from=-start+90,to=-end+90,length.out=length)*pi/180
  data.frame(x=rx*cos(angle)+xstart,
             y=ry*sin(angle)+ystart
  )
}

#' Function to find elements in 'x' greater than the treshold 'tsh' for shading SPM.
#' @param x Vector
#' @param tsh Numeric variable
#' @examples
#' x<-sin(seq(0,pi,by=0.1));plot(x)
#' find_diffs(x,0.8)
#' abline(v = find_diffs(x,0.8), col="red", lwd=3, lty=2)
#' abline(h = 0.8, col="blue", lwd=3, lty=2)
#' @export
find_diffs<-function(x,tsh){
  points<-c(which(x>=tsh),which(x<=-tsh))
  w<-length(which(diff(points)!=1))+1
  data.frame(
    'min_shade'=sort(c(points[1],points[which(diff(points)!=1)+1])),
    'max_shade'=sort(c(points[which(diff(points)!=1)],points[length(points)])))
}

#' Function to plot circles in ggplot
#' @param rx Radius of the circle in x axis
#' @param ry Radius of the circle in y axis
#' @param start Angle (in degrees) from where to start drawing (from vertical)
#' @param end Angle (in degrees) to end the drawing
#' @param xstart X coordinate of the origin of the circle
#' @param ystart Y coordinate of the origin of the circle
circleFun<-function(rx=1,ry=1,start=0,end=360,length=360,xstart=0,ystart=0){
  angle<-seq(from=-start+90,to=-end+90,length.out=length)*pi/180
  data.frame(x=rx*cos(angle)+xstart,
             y=ry*sin(angle)+ystart
  )
}

#' Get lower triangle of a square matrix (for example the correlation matrix) to plot with ggplot.
#' @param mat Squared Matrix
#' @examples
#' cor(longley) # Original Matrix
#' lower_tri(cor(longley)) # Lower triangle
#' @export
lower_tri<-function(mat){
  if(nrow(mat)!=ncol(mat)) stop("You most provide a square matrix")
  mat[lower.tri(mat)] <- NA
  return(mat)
}

#' Get upper triangle of a square matrix (for example the correlation matrix) to plot with ggplot.
#' @param mat Squared Matrix
#' @examples
#' cor(longley) # Original Matrix
#' upper_tri(cor(longley)) # Upper triangle
#' @export
upper_tri <- function(mat){
  if(nrow(mat)!=ncol(mat)) stop("You most provide a square matrix")
  mat[upper.tri(mat)]<- NA
  return(mat)
}

#' Set source file directory as working directory
#' @param name R script file name
#' @examples
#' #source_wd()
#' @export
source_wd <- function(name=NULL) {
  if(!requireNamespace("stringr")) stop("Need stringr package")
  if(!requireNamespace("rstudioapi")) stop("Need rstudioapi package ")
  wd <- rstudioapi::getSourceEditorContext()$path
  if (!is.null(name)) {
    if (substr(name, nchar(name) - 1, nchar(name)) != '.R')
      name <- paste0(name, '.R')
  }
  else {
    name <- stringr::word(wd, -1, sep='/')
  }
  wd <- gsub(wd, pattern=paste0('/', name), replacement = '')
  no_print <- eval(expr=setwd(wd), envir = .GlobalEnv)
  print(paste("Working Directory:",wd))
}

#' Normalize based on min and max value.
#' @param x Numeric vector
#' @param scale Scaling factor
#' @examples
#' # x<-rnorm(10,10,1)
#' # normalize(x)
#' @export
normalize<-function(x,scale=1){
  if(is.null(min)) min<-min(x)
  if(is.null(max)) max<-max(x)
  (x-min(x))/(max(x)-min(x))*scale
}

#' Search multiple patterns inside a string.
#' @param pattern Each pattern is separated by the & character
#' @param x Vector of strings containing the values to search for
#' @param pattern By default returns the index of the vector containing the pattern.
#' #' @examples
#' # pattern<-'blue bunny'
#' # x<-c('my favorite color is blue, my favorite animal is bunny','my favorite icecream flavor is blue bunny','My favorite color is blue')
#' # multi_grep(pattern,x) # Only strings containing both words next to each other are returned
#' # pattern<-'blue&bunny'
#' # multi_grep(pattern,x) # All strings containing both words are returned, no matter if they are next to each other or not
#' @export
multi_grep<-function(pattern,x,type='index'){
  vals<-sapply(strsplit(pattern,"&")[[1]],function(string){
    grepl(string,x)
  })
  idx<-sapply(1:nrow(vals),function(x){if(all(vals[x,])){x}else{NULL}})
  out<-unlist(idx[lengths(idx) != 0])
  if(type=='index'){out}
  else if(type=='value'){out<-x[out]}
  else if(type=='logical'){out<-x %in%x[out]}
  return(out)
}

#' Interactive plot example to use when plotly legend is not the same as in ggplot2
#' @param x Plot generated with ggplot2
#' @param position Position of the legend (only right is implemented)
#' @param col_width Width of the first column. Second column width is 12-col_width
#' @export
ggplotly_slides<-function(x,position='bottom',col_width=10){
  # See if position bottom can change from columns to row and remove offset
  require(ggpubr)
  require(ggplotly)
  require(shiny)
  out_legend<-ggpubr::get_legend(x+theme(legend.position=position)) # Extracting the legend for the ggplotly!
  fluidPage(
    fluidRow(
      column(col_width,plotly::renderPlotly(plotly::ggplotly(x+theme(legend.position="none")))),
      column(12-col_width,renderPlot(ggpubr::as_ggplot(out_legend)))
    )
  )
}
