# Load the package
library(WeatherFusion)

# Demo function to showcase the usage of fuse_weather_forecast() function
demo_fuse_weather_forecast <- function() {
  # Example weather forecast datasets (replace these with your actual datasets)
  dataset1 <- data.frame(
    datetime = seq(as.POSIXct("2023-07-01 00:00:00"), by = "1 hour", length.out = 24),
    temperature = c(25.5, 26.1, 26.8, 27.4, 28.2, 29.1, 30.0, 30.8, 31.6, 32.2, 32.7, 33.2, 33.6, 33.9, 34.1, 34.2, 34.2, 34.1, 33.9, 33.6, 33.2, 32.7, 32.1, 31.5)
  )

  dataset2 <- data.frame(
    datetime = seq(as.POSIXct("2023-07-01 00:00:00"), by = "1 hour", length.out = 24),
    precipitation = c(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  )

  # Perform weather forecast data fusion using weighted method
  fused_result <- fuse_weather_forecast(dataset1, dataset2, fusion_method = "weighted")

  # Print the fused result
  cat("Fused Weather Forecast Dataset:\n")
  print(fused_result)
}

# Run the demo function
demo_fuse_weather_forecast()
