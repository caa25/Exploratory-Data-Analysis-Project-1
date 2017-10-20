**Exploratory Data Analysis Project One**  
**Plotting with R Base**  
**CodeBook.md**  
Developer: Craig Anderson  
Date: October 19, 2017  

**Overview**

This CodeBook describes the data used in the project.  

**Dataset**

This project uses data from the UC Irvine Machinge Larning Repository. The specific data file is the individual household electric power consumption dataset downloaded from:
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

When uncompressed the dataset consists of a single table file, “household_power_consumption.txt”, containing multivariate, time-series measurements of electric power consumption in one household over a period of almost 4 years recorded by minute for each day ranging from December 16, 2006 through November 26, 2010. The full dataset has 2,075,259 records.  The assignment requires data for only two days, 2007-02-01 and 2007-02-02, out of the four years of data, or only 2880 records.  All calendar timestamps are present in the dataset but for some timestamps, the measurement values are missing: a missing value is represented by a "?". See the README.md file for an explanation of how this data was extracted and downloaded for the relevant period.

A full description of the raw data set can be found at   https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption. 

The original data files were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**Data Key**

Each record contains nine fields as follows:

1. **Date:** calendar date in a string format "dd/mm/yyyy"     
2. **Time:** time in a string format "hh:mm:ss"   
3. **Global_active_power:** household global minute-averaged active power (in kilowatts)   
4. **Global_reactive_power:** household global minute-averaged reactive power (in kilowatts)   
5. **Voltage:** minute-averaged voltage (in volts)   
6. **Global_intensity:** household global minute-averaged current intensity (in amperes)   
7. **Sub_metering_1:** energy sub-metering No. 1 (in watt-hours of active energy). This corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).   
8. **Sub_metering_2:** energy sub-metering No. 2 (in watt-hours of active energy). This corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.   
9. **Sub_metering_3:** energy sub-metering No. 3 (in watt-hours of active energy). This corresponds to an electric water-heater and an air-conditioner.


