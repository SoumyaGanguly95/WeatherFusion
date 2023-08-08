# Load the classes.R file
source("R/classes.R")

#' Transform weather dataset
#'
#' This function performs specific data transformations or feature engineering on the weather dataset.
#'
#' @param dataset Weather dataset as a data.frame or tibble.
#' @param temperature_column Name of the temperature column.
#' @param temperature_unit Unit of temperature (e.g., "Fahrenheit", "Kelvin").
#' @param timestamp_column Name of the timestamp column.
#' @param timestamp_format Format of the timestamp column (e.g., "%Y-%m-%d %H:%M:%S").
#' @return Transformed weather dataset as a data.frame or tibble.
#' @examples
#' transformed_data <- transform_weather_data(weather_data, "temperature", "Fahrenheit", "timestamp", "%Y-%m-%d %H:%M:%S")
#'
transform_weather_data <- function(dataset, temperature_column, temperature_unit, timestamp_column, timestamp_format) {
  # Convert temperature to Celsius if not already in Celsius
  if (temperature_column %in% names(dataset)) {
    if (tolower(temperature_unit) == "fahrenheit") {
      dataset$temperature_celsius <- (dataset[[temperature_column]] - 32) * 5/9
    } else if (tolower(temperature_unit) == "kelvin") {
      dataset$temperature_celsius <- dataset[[temperature_column]] - 273.15
    } else if (tolower(temperature_unit) != "celsius") {
      stop("Error: Invalid temperature_unit.")
    }
  }

  # Convert timestamp column to datetime format and rename
  if (timestamp_column %in% names(dataset)) {
    dataset$datetime <- as.POSIXct(dataset[[timestamp_column]], format = timestamp_format)
    dataset <- subset(dataset, select = -c(timestamp_column))
  }

  # Additional transformations for Weather Data
  # ...

  return(dataset)
}

#' Transform storm dataset
#'
#' This function performs specific data transformations or feature engineering on the storm dataset.
#'
#' @param dataset Storm dataset as a data.frame or tibble.
#' @param wind_speed_column Name of the column representing wind speed in m/s.
#' @param temperature_column Name of the column representing temperature.
#' @param temperature_unit Unit of temperature (e.g., "Fahrenheit", "Kelvin").
#' @param timestamp_column Name of the timestamp column.
#' @param timestamp_format Format of the timestamp column (e.g., "%Y-%m-%d %H:%M:%S").
#' @return Transformed storm dataset as a data.frame or tibble.
#' @examples
#' transformed_storm_data <- transform_storm_data(storm_data, "windspeed", "temperature", "Fahrenheit", "timestamp", "%Y-%m-%d %H:%M:%S")
#'
transform_storm_data <- function(dataset, wind_speed_column, temperature_column, temperature_unit, timestamp_column, timestamp_format) {
  # Convert wind speed to km/hr (1 m/s = 3.6 km/hr)
  if (wind_speed_column %in% names(dataset)) {
    dataset[[wind_speed_column]] <- dataset[[wind_speed_column]] * 3.6
  }

  # Convert temperature to Celsius if not already in Celsius
  if (temperature_column %in% names(dataset)) {
    if (tolower(temperature_unit) == "fahrenheit") {
      dataset$temperature_celsius <- (dataset[[temperature_column]] - 32) * 5/9
    } else if (tolower(temperature_unit) == "kelvin") {
      dataset$temperature_celsius <- dataset[[temperature_column]] - 273.15
    } else if (tolower(temperature_unit) != "celsius") {
      stop("Error: Invalid temperature_unit.")
    }
  }

  # Convert timestamp column to datetime format and rename
  if (timestamp_column %in% names(dataset)) {
    dataset$datetime <- as.POSIXct(dataset[[timestamp_column]], format = timestamp_format)
    dataset <- subset(dataset, select = -c(timestamp_column))
  }

  # Additional transformations for Storm Data
  # ...

  return(dataset)
}

#' Transform weather forecast dataset
#'
#' This function performs specific data transformations or feature engineering on the weather forecast dataset.
#'
#' @param dataset Weather forecast dataset as a data.frame or tibble.
#' @param forecast_accuracy_column Name of the column representing forecast accuracy.
#' @param timestamp_column Name of the timestamp column.
#' @param timestamp_format Format of the timestamp column (e.g., "%Y-%m-%d %H:%M:%S").
#' @return Transformed weather forecast dataset as a data.frame or tibble.
#' @examples
#' transformed_forecast_data <- transform_weather_forecast_data(weather_forecast_data, "accuracy", "timestamp", "%Y-%m-%d %H:%M:%S")
#'
transform_weather_forecast_data <- function(dataset, forecast_accuracy_column, timestamp_column, timestamp_format) {
  # Perform transformations for Weather Forecast
  if (forecast_accuracy_column %in% names(dataset)) {
    dataset$forecast_quality <- ifelse(dataset[[forecast_accuracy_column]] >= 90, "High", "Low")
  }

  # Convert timestamp column to datetime format and rename
  if (timestamp_column %in% names(dataset)) {
    dataset$datetime <- as.POSIXct(dataset[[timestamp_column]], format = timestamp_format)
    dataset <- subset(dataset, select = -c(timestamp_column))
  }

  # Additional transformations for Weather Forecast
  # ...

  return(dataset)
}
