## Steps to create an R package. If package exists, jump to 4
# 1.- Set working directory to parent folder
#setwd("parent_directory")
# 2.- Create a New project from RStudio
# 3.- Create an R file with all the functions inside the R folder of the created folder in 2
# Select the file to be included when creating the New Project
# 4.- Generate documentation based on the functions
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

#' Function to find elements (TRUE or FALSE) in 'x' different than 'y'. To find indices, use %!idx% instead
#' @param x Vector to look for
#' @param y Elements to exclude from 'x'
#' @keywords !in
#' @examples
#' x<-c(1,2,3);y<-c(3)
#' x %!in% y
'%!in%' <- function(x,y) !('%in%'(x,y))

#' Function to find element INDICES in 'x' different than 'y'
#' @param x Vector to look for
#' @param y Elements to exclude from 'x'
#' @keywords !in
#' @examples
#' x<-c(1,2,3);y<-c(3)
#' x %!in% y
'%!idx%' <- function(x,y) x[!('%in%'(x,y))]

