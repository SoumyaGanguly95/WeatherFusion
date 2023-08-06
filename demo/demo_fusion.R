# Load the R package containing your functions
library(WeatherFusion)

# Load two weather forecast datasets from CSV files
file_path1 <- "path/to/your/weather_data1.csv"
file_path2 <- "path/to/your/weather_data2.csv"
weather_data1 <- load_weather_forecast(file_path1)
weather_data2 <- load_weather_forecast(file_path2)

# Fuse the two datasets using the "average" method
fusion_method <- "average"
fused_data <- fuse_weather_data(weather_data1, weather_data2, fusion_method)

# Display the fused data
head(fused_data)
