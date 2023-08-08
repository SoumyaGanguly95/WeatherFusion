library(WeatherFusion)  # Load your R package

# Load weather data
weather_data <- load_data("extdata/WeatherData/weather_data.csv", "WeatherData")

# Load storm data
storm_data <- load_data("extdata/StormData/storm_data.csv", "StormData")

# Load weather forecast data
forecast_data <- load_data("extdata/WeatherForecastData/forecast_data.csv", "WeatherForecast")
