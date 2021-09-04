

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
      cex.main = 3, cex.axis = 2.50, cex.lab = 3,
      # margins: bottom, left, top and right
      par( mar = c( 10, 11, 8, 8 ) + 0.1 )  
  )

  plot( 
       csv.data.df$Year, csv.data.df$US,
       ylim = c( 0, 500 ),
       main = "US military deaths in Afghanistan by year",
       xlab = "", ylab = "",
       pch = 24, cex=3, col="black", bg=csv.data.df$color, lwd=2,
       # Remove the x-axis so we can customize it further below
       xaxt = "n"  
  )

  title( xlab="Year", cex.lab = 3, line = 5 )
  title( ylab="Number of deaths", cex.lab = 3, line = 5 )

  #
  # Customize the x-axis
  #
  axis( 1, at = seq(2001, 2021, 4 ), labels = seq(2001, 2021, 4 ) )

  legend(
          "topright", 
          title = "Presidents",
          bg = "white",
          legend = c( "Bush", "Obama", "Trump", "Biden" ),
          pch = 24,
          pt.cex = 2,
          pt.bg = c( "Red", "Blue", "Orange", "Green" )
        )

}

viz.afghan.deaths.large( "viz/afghanistan.deaths-large.png" )
                         
dev.off()


#
# Afghanistan deaths: Viz for GitHub (Tumblr)
#
viz.afghan.deaths.tumblr <- function( out.name ) {

  png( out.name, 
       width = 500, height = 375, 
       units = "px", pointsize = 9, 
       bg = rgb( 248, 245, 236, maxColorValue = 255 ) 
  )

  par( 
      cex.main = 2.5, cex.axis = 1.75, cex.lab = 2,
      # margins: bottom, left, top and right
      par( mar = c( 6, 7, 4, 4 ) + 0.1 )  
  )

  plot( 
       csv.data.df$Year, csv.data.df$US,
       ylim = c( 0, 500 ),
       main = "US military deaths in Afghanistan by year",
       xlab = "", ylab = "",
       pch = 24, cex=3, col="black", bg=csv.data.df$color, lwd=2,
       # Remove the x-axis so we can customize it further below
       xaxt = "n"  
  )

  title( xlab="Year", cex.lab = 3, line = 4 )
  title( ylab="Number of deaths", cex.lab = 3, line = 3 )

  #
  # Customize the x-axis
  #
  axis( 1, at = seq(2001, 2021, 4 ), labels = seq(2001, 2021, 4 ) )

  legend(
          "topright", 
          title = "Presidents",
          bg = "white",
          legend = c( "Bush", "Obama", "Trump", "Biden" ),
          pch = 24,
          pt.cex = 2,
          pt.bg = c( "Red", "Blue", "Orange", "Green" )
        )

}

viz.afghan.deaths.tumblr( "viz/afghanistan.deaths-tumblr.png" )
                         
dev.off()


# --- END --- #

