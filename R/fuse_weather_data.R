#' Fuse two weather or storm datasets
#'
#' This function fuses two weather datasets based on the specified method and time index (if required).
#'
#' @param dataset1 First weather dataset as a data.frame or tibble.
#' @param dataset2 Second weather dataset as a data.frame or tibble.
#' @param fusion_method Method to fuse the datasets ("average", "weighted", or "ensemble").
#' @param time_index The common time index to be used for fusion (optional).
#' @return Fused weather dataset as a data.frame or tibble.
#' @examples
#' fused_data <- fuse_weather_data(weather_data1, weather_data2, fusion_method = "average")
#'
fuse_weather_data <- function(dataset1, dataset2, fusion_method = "average", time_index = NULL) {
  # Check if the time indexes are provided and not identical, then convert them to a common time index
  if (!identical(dataset1$datetime, dataset2$datetime)) {
    if (is.null(time_index)) {
      stop("Error: The two datasets have different time indexes. Please provide a common time_index.")
    } else {
      # Merge datasets based on the common time index using dplyr
      library(dplyr)
      dataset1 <- dataset1 %>% left_join(dataset2, by = c("datetime" = "datetime.y"))
      dataset1 <- dataset1 %>% select(-datetime.x) %>% rename(datetime = datetime.y)

      # Combine additional columns from dataset2 to dataset1
      dataset1 <- cbind(dataset1, dataset2[!names(dataset2) %in% c("datetime", "datetime.y")])
    }
  }

  # Check if the fusion method is valid
  fusion_methods <- c("average", "weighted", "ensemble")
  if (!(fusion_method %in% fusion_methods)) {
    stop("Error: Invalid fusion method. Available methods are 'average', 'weighted', or 'ensemble'.")
  }

  # Perform weather or storm data fusion based on the chosen method
  fused_dataset <- switch(
    fusion_method,
    "average" = (dataset1 + dataset2) / 2,  # Simple average fusion
    "weighted" = (dataset1 + 2 * dataset2) / 3,  # Weighted fusion (weights: 1/3 and 2/3)
    "ensemble" = dataset1  # Ensemble fusion (use dataset1 as the fused result)
  )

  return(fused_dataset)
}

#' Fuse weather data with storm or forecast data
#'
#' This function fuses weather data with storm or forecast data based on the specified method and time index (if required).
#'
#' @param weather_data Weather dataset as a data.frame or tibble.
#' @param other_data Storm or forecast dataset as a data.frame or tibble.
#' @param fusion_method Method to fuse the datasets ("average", "weighted", or "ensemble").
#' @param time_index The common time index to be used for fusion (optional).
#' @return Fused weather dataset as a data.frame or tibble.
#' @examples
#' fused_data <- fuse_weather_and_other(weather_data, storm_data, fusion_method = "average")
#' fused_data <- fuse_weather_and_other(weather_data, forecast_data, fusion_method = "weighted")
#'
fuse_weather_and_other <- function(weather_data, other_data, fusion_method = "average", time_index = NULL) {
  fused_data <- fuse_weather_data(weather_data, other_data, fusion_method, time_index)
  return(fused_data)
}
