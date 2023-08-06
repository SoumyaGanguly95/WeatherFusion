# Load the R package containing your functions
library(WeatherFusion)

# Load weather forecast data from a CSV file
file_path <- "path/to/your/weather_data.csv"
weather_data <- load_weather_forecast(file_path)

# Perform exploratory data analysis on the weather data
eda_results <- weather_data_analysis(weather_data)

# Display summary statistics
print(eda_results$summary_stats)

# Display temperature distribution plot
print(eda_results$plots$temperature_distribution)

# Additional visualization example: Time series plot for temperature
plot_visualizations(weather_data)
