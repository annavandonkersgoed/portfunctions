#' Title
#'
#' @param dataset Dataset
#' @param colname Column name of the value that you want to normalize
#' @param value The value that needs to be normalized
#' @param data_col The data that the normalization is used on
#'
#' @return dataset
#' @export
#'
#' @examples
#'
#' Normalization(LandBird_Monitoring, "Condition", "Calm", "Humidity")
Normalization <- function(dataset, colname, value, data_col) {
  if (!(colname %in% names(dataset))) {
    stop(paste("Column", colname, "does not exist in the dataset."))
  }
  if (!(data_col %in% names(dataset))) {
    stop(paste("Column", data_col, "does not exist in the dataset."))
  }


  filtered_data <- dataset[dataset[[colname]] == value, ]

  mean_value <- mean(filtered_data[[data_col]], na.rm = TRUE)

  dataset[[data_col]] <- dataset[[data_col]] / mean_value

  return(dataset)
}
