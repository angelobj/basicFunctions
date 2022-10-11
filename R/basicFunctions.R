## Steps to create an R package. If package exists, jump to 4
# 1.- Set working directory to parent folder
#setwd("parent_directory")
# 2.- Create a folder to store functions and documents
#create("basicFunctions")
# 3.- Create an R file with all the functions inside the R folder of the created folder in 2
# 4.- After creating the functions, change the WD to the child created folder
#setwd("./basicFunctions")
# 5.- Generate documentation based on the functions
#document()
library(devtools)
library(roxygen2)
# 6.- We are ready to install and load the package
#setwd("..")
# install("basicFunctions")
# library("basicFunctions")
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

#' Function to update a package based on its name.
#' @param pckgeName Name of the package to update. Your working directory should be the parent folder of the package
#' @examples
#' updatePackage()
updatePackage<-function(pckgeName=NULL){
  if(is.null(pckgeName))
    stop("Package name must be provided.")
  if(!dir.exists(paste0("./",pckgeName)))
      stop("Directory does not exists!. Make sure to use create('pckgeName')")
    setwd(paste0("./",pckgeName))
    # Generate documentation based on the functions
    document()
    # We are ready to install and load the package
    setwd("..")
    install(pckgeName)
}




