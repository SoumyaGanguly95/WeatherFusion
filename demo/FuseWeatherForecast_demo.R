# Load the package
library(WeatherFusion)

# Create sample weather forecast datasets
dataset1 <- data.frame(
  datetime = seq(from = as.POSIXct("2023-07-24 00:00:00"), by = "hour", length.out = 48),
  temperature = seq(20, 30, length.out = 48),
  humidity = seq(60, 80, length.out = 48)
)

dataset2 <- data.frame(
  datetime = seq(from = as.POSIXct("2023-07-24 00:00:00"), by = "hour", length.out = 48),
  temperature = seq(15, 25, length.out = 48),
  humidity = seq(50, 70, length.out = 48)
)

# Fuse the datasets using the weighted method
fused_result <- fuse_weather_forecast(dataset1, dataset2, fusion_method = "weighted")

# Print the fused result
print(fused_result)
