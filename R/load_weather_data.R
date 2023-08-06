#' Load weather data from a file
#'
#' This function reads weather data from a specified file and performs data cleaning/preprocessing.
#' The supported file formats include CSV, Excel, NetCDF, JSON, GRIB, HDF5, and XML.
#'
#' @param file_path File path of the weather data file.
#' @return Weather data as a data.frame or tibble.
#' @examples
#' load_weather_data("path/to/your/weather_data.csv")
#'
load_weather_data <- function(file_path) {
  # Get the file extension to determine the format
  file_extension <- tools::file_ext(file_path)

  # Read data from file based on the file extension
  if (file_extension == "csv") {
    weather_data <- read.csv(file_path, header = TRUE, stringsAsFactors = FALSE)
  } else if (file_extension %in% c("xls", "xlsx")) {
    library(readxl)
    weather_data <- read_excel(file_path)
  } else if (file_extension == "nc" || file_extension == "cdf") {
    library(ncdf4)
    weather_data <- nc_open(file_path)
    # Additional code to read data from NetCDF file if needed
  } else if (file_extension == "json") {
    library(jsonlite)
    weather_data <- fromJSON(file_path)
    # Additional code to process JSON data if needed
  } else if (file_extension == "grb" || file_extension == "grib") {
    library(raster)
    weather_data <- brick(file_path)
    # Additional code to process GRIB data if needed
  } else if (file_extension == "h5" || file_extension == "hdf5") {
    library(hdf5r)
    weather_data <- h5read(file_path)
    # Additional code to process HDF5 data if needed
  } else if (file_extension == "xml") {
    library(xml2)
    weather_data <- read_xml(file_path)
    # Additional code to process XML data if needed
  } else {
    stop("Error: Unsupported file format. Supported formats are CSV, Excel, NetCDF, JSON, GRIB, HDF5, and XML.")
  }

  # Perform any necessary data cleaning or preprocessing steps
  # For example, convert date/time columns to POSIXct format, handle missing values, etc.
  if ("datetime" %in% names(weather_data)) {
    weather_data$datetime <- as.POSIXct(weather_data$datetime)
  }

  return(weather_data)
}
