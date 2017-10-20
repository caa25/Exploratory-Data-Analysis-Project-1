#################################################################################################
## Program:     plot2.R
##              Version: R x64 3.4.2
## Programmer:  Craig Anderson
## Date:        October 16, 2017
## Purpose:     Exploratory Data Analysis Project 1
##              This script provides the plot2.R function for the Peer-graded project.
##
##              Further information is provided in the accompanying README.md file.
##
#################################################################################################

## This function constructs the tidy dataset for the plotting analysis
##_____________________________________________________________________________________________

get_data <- function(){
    
    # Ensure required R Packages are installed and loaded
    require(rio)
    print("Required rio package installed and loaded.")
    
    # Import column names
    col_labels <- names(import("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                               nrow = 0,
                               header = TRUE ))
    
    print("Column labels downloaded")
    
    
    # Import data for February 1 and 2, 2007 only
    dataset <- import("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      skip = "1/2/2007", 
                      nrow = 2 * 24 * 60, # 2 days x 24 hours/day x 60 minutes/hour = 2880 records
                      header = FALSE,
                      na.strings = "?" )
    
    # Add column labels
    colnames(dataset) <- col_labels
    
    print("Plotting dataset completed.")
    
    return(dataset)
    
}

## This is the plotting function for the plot2 line graph
##_____________________________________________________________________________________________

plot2 <- function() {
    
    # Get dataset
    plot_data <- get_data()
    
    # Add transformed dates and time for plotting
    plot_data$combined_date <- with(plot_data, 
                                    as.POSIXct(paste(Date, Time), 
                                               format = "%d/%m/%Y %H:%M:%S") )
    # Set plotting parameters
    par(font.lab  = 2,
        font.axis = 2,
        pty = "m")
    
    # Plot line graph
    with(plot_data,
         plot(Global_active_power ~ combined_date,
              type = "l",
              xlab = "",
              ylab = "Global Active Power (kilowatts)"))
    
    # Open PNG Device and save file
    dev.copy(png, file = "plot2.png", height = 480, width = 480)
    dev.off()
    
    print("Plotting complete.  PNG file available for viewing in working directory")
    
}
    
    
    
    
    
