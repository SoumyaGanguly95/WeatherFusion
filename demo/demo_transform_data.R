# Load the R package containing your functions
library(WeatherFusion)

# Load weather forecast data from a CSV file
file_path <- "path/to/your/weather_data.csv"
weather_data <- load_weather_forecast(file_path)

# Perform data transformation on the loaded weather data
transformed_data <- transform_weather_data(weather_data)

# Display the transformed data
head(transformed_data)
