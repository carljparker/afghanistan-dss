# 
# Carl Parker
# carljparker@gmail.com
# 206.388.6677
#
# Data 567: Applied Statistics and Experimental Design
# 
# Homework <homework number>
# 

#
# Template for this file is located at:
#
#   ~/git/gtdev/R-language/templates
#

#
# Add an initial @knitr section
#

## @knitr Prolog 
#
# Need to set directory for this @knitr section to do the `source()`
# below.
#
setwd( "/Users/carljparker/git/dss/data-sci/afghanistan-dss" )
getwd()


#
# --- Sourced Files ---
#
source( "code/preamble.R" )


#
# --- Library Dependencies ---
#


#
# --- Function Definitions ---
#


#
# If I run this in RStudio or in vimR, interactive()
# will return TRUE.
#
# If I run this with my "rr" shell function, interactive() 
# will return FALSE.
#
if ( interactive() ) {

 #
 # Set the working directory. Only need to do this for RStudio or RMarkdown.
 #
 # For RMarkdown, need to do this for each chunk.
 #
 setwd( "/Users/carljparker/git/dss/data-sci/afghanistan-dss" )
 getwd()

}  # if interactive


#
# Set repeatable random seed using my zip code.
#
set.seed(98122)


#
# Initialize logging functionality
#
logger.init()


## @knitr q0a 
#
# Set working directory for this knitr chunk
#
setwd( "/Users/carljparker/git/dss/data-sci/afghanistan-dss" )


#
# --- Get the data ---
#
logdebug( "Read data from CSV." )


#
# Update the following line with the name of the CSV file to read.
#
csv.data.file.ch <- "data/deaths-afghanistan.txt"
csv.data.df <- read.csv( 
                         csv.data.file.ch, 
                         header = TRUE, 
                         quote="\"",
                         sep = ",", 
                         na.strings = c( "NA", "-" ),
                         allowEscapes = TRUE,
                         strip.white  = TRUE,
                         stringsAsFactors = TRUE,
                         comment.char="#" 
                       )

pres <- c(
          "Bush",    
          "Bush",    
          "Bush",    
          "Bush",    
          "Bush",    
          "Bush",    
          "Bush",    
          "Bush",    
          "Obama",   
          "Obama",   
          "Obama",   
          "Obama",   
          "Obama",   
          "Obama",   
          "Obama",   
          "Obama",   
          "Trump",   
          "Trump",   
          "Trump",   
          "Trump",   
          "Biden"    
)

color <- c(
          "Red",   
          "Red",   
          "Red",   
          "Red",   
          "Red",   
          "Red",   
          "Red",   
          "Red",   
          "Blue",  
          "Blue",  
          "Blue",  
          "Blue",  
          "Blue",  
          "Blue",  
          "Blue",  
          "Blue",  
          "Orange",
          "Orange",
          "Orange",
          "Orange",    
          "Green"  
)

csv.data.df <- cbind( csv.data.df, pres, color )

#
# --- Explore the data ---
#

#
# The following line is a nice way to set off 
# data exploration code inside a production
# context.
#

# -*- -*- -*- #

dex.dataframe( csv.data.df )

# -*- -*- -*- #


## @knitr q1a
#
# Set working directory for this knitr chunk
#
setwd( "/Users/carljparker/git/dss/data-sci/afghanistan-dss" )

#
# Afghanistan deaths: Viz for GitHub (large)
#
viz.afghan.deaths.large <- function( out.name ) {
  #
  # Larger version of plot
  #
  png( out.name, 
       width = 1200, height = 900, 
       units = "px", pointsize = 16, 
       bg = rgb( 248, 245, 236, maxColorValue = 255 ) 
  )

  par( 
      cex.main = 4, cex.axis = 2.50, cex.lab = 3,
      # margins: bottom, left, top and right
      par( mar = c( 10, 11, 8, 8 ) + 0.1 )  
  )

  plot( 
       csv.data.df$Year, csv.data.df$US,
       ylim = c( 0, 500 ),
       main = "US military deaths by year",
       xlab="", ylab = "",
       pch = 24, cex=3, col="black", bg=csv.data.df$color, lwd=2
  )

  title( xlab="Year", cex.lab = 3, line = 5 )
  title( ylab="Number of deaths", cex.lab = 3, line = 5 )

  legend(
          "bottomright", 
          title = "Presidents",
          bg = "white",
          legend = levels( as.factor( csv.data.df$pres ) ),
          pch = 24,
          pt.cex = 3,
          pt.bg = levels( as.factor( csv.data.df$color ) )
        )

}

viz.afghan.deaths.large( "viz/afghanistan.deaths-large.png" )
                         
dev.off()


## @knitr q1b 


## @knitr q1c 


## @knitr q1d 



## @knitr q2a 
#
# Set working directory for this knitr chunk
#
setwd( "/Users/carljparker/git/dss/data-sci/afghanistan-dss" )


## @knitr q2b 


## @knitr q2c 


## @knitr q2d 


## @knitr Epilog
#
# Set working directory for this knitr chunk
#
setwd( "/Users/carljparker/git/dss/data-sci/afghanistan-dss" )

logdebug( "Program complete." )


# --- END --- #

