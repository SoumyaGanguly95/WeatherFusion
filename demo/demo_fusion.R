library(WeatherFusion)  # Load your R package

# Fuse two weather datasets using the "average" method
fused_weather_data <- fuse_weather_data(transformed_weather_data, transformed_forecast_data, fusion_method = "average")

# Fuse weather data with storm data using the "ensemble" method
fused_storm_data <- fuse_weather_and_other(transformed_weather_data, transformed_storm_data, fusion_method = "ensemble")
