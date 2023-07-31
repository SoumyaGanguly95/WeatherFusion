# Function to fuse two weather forecast time series datasets
# Input:
#   - dataset1: First weather forecast dataset (data.frame or tibble)
#   - dataset2: Second weather forecast dataset (data.frame or tibble)
#   - fusion_method: Method to fuse the datasets (e.g., "average", "weighted", "ensemble")
#   - time_index: The common time index to be used for fusion (optional)
# Output:
#   - Fused weather forecast dataset (data.frame or tibble)
fuse_weather_forecast <- function(dataset1, dataset2, fusion_method = "average", time_index = NULL) {
  # Check if the time indexes are provided and not identical, then convert them to a common time index
  if (!identical(dataset1$datetime, dataset2$datetime)) {
    if (is.null(time_index)) {
      stop("Error: The two datasets have different time indexes. Please provide a common time_index.")
    } else {
      # Merge datasets based on the common time index using dplyr
      library(dplyr)
      dataset1 <- dataset1 %>% left_join(dataset2, by = c("datetime" = "datetime.y"))
      dataset1 <- dataset1 %>% select(-datetime.x) %>% rename(datetime = datetime.y)
    }
  }

  # Check if the fusion method is valid
  fusion_methods <- c("average", "weighted", "ensemble")
  if (!(fusion_method %in% fusion_methods)) {
    stop("Error: Invalid fusion method. Available methods are 'average', 'weighted', or 'ensemble'.")
  }

  # Perform weather forecast data fusion based on the chosen method
  fused_dataset <- switch(
    fusion_method,
    "average" = (dataset1 + dataset2) / 2,  # Simple average fusion
    "weighted" = (dataset1 + 2 * dataset2) / 3,  # Weighted fusion (weights: 1/3 and 2/3)
    "ensemble" = dataset1  # Ensemble fusion (use dataset1 as the fused result)
  )

  return(fused_dataset)
}

# Example usage:
# Assuming you have two weather forecast datasets named "forecast1" and "forecast2"
# fused_result <- fuse_weather_forecast(forecast1, forecast2, fusion_method = "weighted")

# Example usage with different time indexes:
# Assuming you have two weather forecast datasets named "forecast1" and "forecast2"
# and a common time_index named "common_time_index"
# fused_result <- fuse_weather_forecast(forecast1, forecast2, fusion_method = "weighted", time_index = common_time_index)
