library(tidyverse)
library(lubridate)

##
## Downloads and unzips the data into a "data" folder
##
download_data <- function() {
  if (!file.exists(data_filename)) {
    temp_zip_filename <- "data.zip"
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp_zip_filename)
    unzip(temp_zip_filename)
    file.remove(temp_zip_filename) 
  }
}

##
## Reads all data or returns the cached tibble
##
read_data <- function() {
  if (!exists("raw_data")) {
    raw_data <<- 
      read_delim(data_filename, delim = ";", na = "?") %>% 
      filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
      mutate(datetime = dmy_hms(paste(Date, Time))) %>% 
      select(-Date, -Time)
  }
  raw_data
}

data_filename <<- "household_power_consumption.txt"
download_data()
read_data()
