#' Weather and Storm/Forecast Data Fusion Demo
#'
#' This demo shows how to use the `fuse_weather_data` function to fuse weather data with either storm or forecast data.
#'
#' @importFrom WeatherFusion fuse_weather_and_other
#'
#' @examples
#' # Load example weather data and storm data
#' data("example_weather_data")
#' data("example_storm_data")
#'
#' # Fuse weather data with storm data using average fusion
#' fused_data <- fuse_weather_and_other(example_weather_data, example_storm_data, fusion_method = "average")
#'
#' # Fuse weather data with forecast data using weighted fusion
#' fused_data <- fuse_weather_and_other(example_weather_data, example_forecast_data, fusion_method = "weighted")
#'
demo_weather_and_storm_or_forecast_fusion <- function() {
  # Load required packages and data
  library(WeatherFusion)  # Replace WeatherFusion with the actual name of your package
  data("data/USAWeatherEvents/WeatherEvents_Jan2016-Dec2022.csv")  # Load example weather data
  data("data/NOAAStormDataUSA/Storms_2020.csv") # Load example storm data


  # Perform weather and storm/forecast data fusion
  fused_data_weather_storm <- fuse_weather_and_other(example_weather_data, example_storm_data, fusion_method = "average")
  fused_data_weather_forecast <- fuse_weather_and_other(example_weather_data, example_forecast_data, fusion_method = "weighted")

  # Print the summary of the fused data
  print("Fused Weather and Storm Data:")
  print(summary(fused_data_weather_storm))
  print("Fused Weather and Forecast Data:")
  print(summary(fused_data_weather_forecast))
}

# Run the demo function
demo_weather_and_storm_or_forecast_fusion()
