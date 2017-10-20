**Exploratory Data Analysis Project One**  
**Plotting with R Base**  
**README.md**  
Developer: Craig Anderson  
Date: October 19, 2017  

**Introduction**

This repo contains the scripts files and supporting information for the Exploratory Data Analysis Course Project 1.  In it you will find this README.md file, a CodeBook.md file containing a description of the data used in the project, and a series of four plot*.R script files each containing a function to produce the requested plots.  Also contained in this repo are PNG files for each plot showing the output of the plotting function.

**Project Software**

This project was performed using the following software:

*  Rx64 3.4.2 running on x86_64-w64-mingw32/x64 (64-bit) Windows 10 system.

*  RStudio Version 1.1.383

*  R Package rio v. 0.5.5

rio was selected because it offers several advantages useful in this project:  

  *  It automagically opens and closes the download file connection.  
  *  It uses the file extension of a file name to determine what kind of file it is, removing the need to manually match a file type to a particular import or export function.  
  *  By installing the dependencies, it automatically installs data.table, useful for dataset manipulations, especially file reading.  
  *  It imports from.zip archives automatically, without the need for explicit decompression.  The data download in this project is from a .zip file.  
  *  It uses data.table::fread() for .txt files to automatically determine the file format regardless of the extension.  fread() is one of the fastest, if not the fastest, way to read in a .txt file.  The uncompressed file used for this project is a .txt file.  
  *  By default, it does not import character strings as factors, allowing the developer to explicitly control the use of factors or strings during the analysis.  
  *  It outputs a data frame, allowing easy manipulation of the resulting dataset without the need for coercion.

More information on rio can be found at:  
https://github.com/leeper/rio/blob/master/vignettes/rio.Rmd and  
https://cran.r-project.org/web/packages/rio/README.html

**Note:**  Ignore the warning message from rio upon installing the package. The message relates to special file types that are not needed for this project.

**Recommended Environment Setup and Execution Instructions**

1.  Preload R version 3.4.2 or higher.  
2.  RStudio is recommended, but not required.
3.  Create a new working directory and ensure that it is empty.  Be sure to set directory as the working directory for the R session.  All .png files will be downloaded to this directory when the functions are executed.
4.  Install the required rio package if needed and load the library.
5. Source the function scripts file using source("plot\*.R")      \* represents the file number: 1, 2, 3, or 4
6. Execute the script using plot*()       \* represents the file number: 1, 2, 3, or 4

The script will download and “tidy up” the dataset for the creation of the plots and then proceed to the actual plotting.  See the **Project Datafile Processing** notes for more information.

The plot*.png files are automatically loaded into the working directory and are available for viewing.  The plots should also appear on your default screen device.

**Project Datafile Processing**

The project data was downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

When uncompressed the dataset consists of a single table file, “household_power_consumption.txt”, containing measurements of electric power consumption in one household over a period of almost 4 years.   See the CodeBook.md file for more details.

The full dataset has 2,075,259 records and 9 columns.  The assignment requires data for only two days, 2007-02-01 and 2007-02-02, out of the four years of data, or only 2880 records.  The assignment also requires that each of the four plot*.R files include code for reading the data.  

There are two possible approaches to reading in and extracting the needed data: 

1. Downloading the entire dataset in each plot\*.R file, reading in the database and extracting the records for the two days.  This is possible and workable, but seems unwieldly since the process repeats each time a plot*() function is called.

2. Downloading in each plot*.R file only the records for the two days.  This is the approach pursued in this project.  While it might not make a significant difference for this dataset, the process of understanding how rio can be used to subset file downloads would proove very useful for extremely large data files.

To analyze the datafile, the first 10 rows were downloaded and reviewed. This review indicated that there is way more data than necessary for the plots, which was expected since we need only two days out of four years of data.   The review also produced metadata about variable classes and ranges that make it possible to construct a more limited query.  Two important observations stand out:

1. The dataset shows that the date format is imported as a character string with the following format: dd/mm/yyyy. Rio can employ a string search attribute setting that allows the record download to commence at a designated string value, in this case the date string for "1/2/2007".

2. The dataset also shows that a record is created every minute for each day and is ordered chronologically, allowing a direct calculation of the number of rows to read (2 days x 24 hours/day x 60 minutes/hour = 2880 records).  

Both of these observations were used to constructed a separate function nested within each plot\*.R file to download only the data needed for the plot.  The resulting dataset was confirmed by visual inspection of the head() and tail() results as well as by a View() of the entire file. 

**plot\*.R Pseudocode**

Each plot*.R file proceeds in the following steps:

1. The required rio package is called to ensure that subsequent subfunction calls are met.  The function will not proceed without this package.

2. The compressed data file is downloaded by a call to a separate get_data() function included with each file.  This function uses rio to download only the records needed for this project.  It also resets the data headings and then returns the dataset to the calling plot*() function.  The function is commented in the file for those interested in seeing how rio works and will display processing messages in the Console as the file is processed.

3.  The plot*() function next transforms the time and date fields in each record as necessary for the plotting functions.  This is performed in an identical fashion in all files except plot1.R where the dates and times were not needed for the histogram.

4. Certain plotting parameters are then set which vary depending on the plot to be constructed.

5. The plots are then constructed and displayed on the default screen device.

6. Finally the .png graphics files are created, one for each file, and saved in the working directory.  In some cases, this file was created by copying the plots.  In other cases, the plotting was reperformed within the png device to prepare a more accurate graph.  The difference between the two approaches is one of the quirks of the R base graphics package.

Included with this repo are sample copies of the .png files.  

