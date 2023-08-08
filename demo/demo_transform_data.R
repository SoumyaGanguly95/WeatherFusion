library(WeatherFusion)  # Load your R package

# Transform weather data
transformed_weather_data <- transform_weather_data(weather_data, "temperature", "Fahrenheit", "timestamp", "%Y-%m-%d %H:%M:%S")

# Transform storm data
transformed_storm_data <- transform_storm_data(storm_data, "windspeed", "temperature", "Fahrenheit", "timestamp", "%Y-%m-%d %H:%M:%S")

# Transform weather forecast data
transformed_forecast_data <- transform_weather_forecast_data(forecast_data, "accuracy", "timestamp", "%Y-%m-%d %H:%M:%S")
