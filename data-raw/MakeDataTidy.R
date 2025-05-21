hu#' Clean and Tidy Land Bird Monitoring Data
#'
#' @description This script reads in the raw Excel file containing land bird monitoring data,
#' cleans and tidies it into a structured format suitable for analysis.
#' The cleaned dataset `LandBird_Monitoring` is exported for use within the package.
#'
#' @import readxl
#' @import readr
#' @import tidyverse
#'
#' @author Anna van Donkersgoed
#' @seealso Use this dataset for further analysis within the package.
#' @keywords datasets
#'
#' @examples
#' # Load the cleaned dataset
#' data(LandBird_Monitoring)
#'
#' @export
library(readr)
library(readxl)
library(tidyverse)

dataset <- read_excel(here::here("data-raw", "NCRN LAND Bird Monitoring Data 2007 - 2017_Public.xlsx"))

# Date needs to be in month, year, and day
# End time needs to be in minute, hour, second, month, year, day

# Separate Date column into Year, Month, Day
dataset_tidy <- separate(dataset, Date, into = c("Year", "Month", "Day"))

# Separate Start_Time column into Start_Year, Start_Month, Start_Day
dataset_tidy <- separate(dataset_tidy, Start_Time, into = c("Start_Year", "Start_Month", "Start_Day"))

# Separate End_Time column into End_Year, End_Month, End_Day
dataset_tidy <- separate(dataset_tidy, End_Time, into = c("End_Year", "End_Month", "End_Day"))

# Remove " min" from Interval_Length and separate into Start_Interval and End_Interval
dataset_tidy <- dataset_tidy %>%
  mutate(
    Interval_Length = str_remove(Interval_Length, " min$")
  ) %>%
  separate(Interval_Length, into = c("Start_Interval", "End_Interval"), convert = TRUE, sep = "-")

# Separate Wind column into Condition and Star_Wind
dataset_tidy <- separate(dataset_tidy, Wind, into = c("Condition", "Star_Wind"), convert = TRUE, sep = "\\(")

# Further separate Star_Wind into Wind_Speed_mph and Description
dataset_tidy <- separate(dataset_tidy, Star_Wind, into = c("Wind_Speed_mph", "Description"), convert = TRUE, sep = "\\)")

# Remove " mph" from Wind_Speed_mph
dataset_tidy <- dataset_tidy %>%
  mutate(
    Wind_Speed_mph = str_remove(Wind_Speed_mph, " mph$")
  )

# Assign the cleaned dataset to LandBird_Monitoring
LandBird_Monitoring <- dataset_tidy

# Export the cleaned dataset for use within the package
usethis::use_data(LandBird_Monitoring, overwrite = TRUE)

