#' Transform weather dataset
#'
#' This function performs specific data transformations or feature engineering on the weather dataset.
#'
#' @param dataset Weather dataset as a data.frame or tibble.
#' @return Transformed weather dataset as a data.frame or tibble.
#' @examples
#' transformed_data <- transform_weather_data(weather_data)
#'
transform_weather_data <- function(dataset) {
  # Perform any specific data transformations or feature engineering required for your analysis
  # This function can handle tasks like removing irrelevant columns, aggregating data, etc.
  # Feel free to customize this function based on your specific requirements.

  # For example, let's say you want to add a new column for temperature in Fahrenheit
  if ("temperature_celsius" %in% names(dataset)) {
    dataset$temperature_fahrenheit <- (dataset$temperature_celsius * 9/5) + 32
  }

  # You can add more data transformations and preprocessing steps here based on your needs.

  return(dataset)
}
