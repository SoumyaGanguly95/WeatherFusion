# Load the classes.R file
source("R/classes.R")

#' Load data from a file and create the appropriate class instance
#'
#' This function reads data from a specified file and creates an instance of the appropriate class (WeatherData, WeatherForecast, or StormData).
#' The function supports multiple file formats including CSV, Excel, NetCDF, JSON, GRIB, HDF5, and XML.
#'
#' @param file_path File path of the data file.
#' @param class_type The type of class to create (e.g., "WeatherData", "WeatherForecast", "StormData").
#' @return An instance of the specified class containing the loaded data.
#' @examples
#' load_data("path/to/your/weather_data.csv", "WeatherData")
#' load_data("path/to/your/weather_forecast.json", "WeatherForecast")
#' load_data("path/to/your/storm_data.xlsx", "StormData")
#'
load_data <- function(file_path, class_type) {
  # Get the file extension to determine the format
  file_extension <- tools::file_ext(file_path)

  # Read data from file based on the file extension
  if (file_extension == "csv") {
    data <- read.csv(file_path, header = TRUE, stringsAsFactors = FALSE)
  } else if (file_extension %in% c("xls", "xlsx")) {
    library(readxl)
    data <- read_excel(file_path)
  } else if (file_extension == "nc" || file_extension == "cdf") {
    library(ncdf4)
    data <- nc_open(file_path)
    # Additional code to read data from NetCDF file if needed
  } else if (file_extension == "json") {
    library(jsonlite)
    data <- fromJSON(file_path)
    # Additional code to process JSON data if needed
  } else if (file_extension == "grb" || file_extension == "grib") {
    library(raster)
    data <- brick(file_path)
    # Additional code to process GRIB data if needed
  } else if (file_extension == "h5" || file_extension == "hdf5") {
    library(hdf5r)
    data <- h5read(file_path)
    # Additional code to process HDF5 data if needed
  } else if (file_extension == "xml") {
    library(xml2)
    data <- read_xml(file_path)
    # Additional code to process XML data if needed
  } else {
    stop("Error: Unsupported file format. Supported formats are CSV, Excel, NetCDF, JSON, GRIB, HDF5, and XML.")
  }

  # Perform any necessary data cleaning or preprocessing steps
  # For example, convert date/time columns to POSIXct format, handle missing values, etc.
  if ("datetime" %in% names(data)) {
    data$datetime <- as.POSIXct(data$datetime)
  }

  # Create the appropriate class instance based on the provided class_type
  if (class_type == "WeatherData") {
    return(WeatherData(data))
  } else if (class_type == "WeatherForecast") {
    return(WeatherForecast(data))
  } else if (class_type == "StormData") {
    return(StormData(data))
  } else {
    stop("Error: Invalid class_type. Supported class types are 'WeatherData', 'WeatherForecast', and 'StormData'.")
  }
}
