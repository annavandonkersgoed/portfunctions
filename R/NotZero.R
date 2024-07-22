#' Notzero
#'
#' @param dataset Dataset you want to use
#' @param colname The column you want to add the 0.001 to
#'
#' @return dataset
#' @export
#'
#' @examples
#' LandBird_Monitoring$Year <- as.numeric(LandBird_Monitoring$Year)
#' NotZero(LandBird_Monitoring, "Year")
NotZero <- function(dataset, colname){
  # Check if the column exists in the dataset
  if (!colname %in% colnames(dataset)) {
    stop("Column not found in dataset")
  }

  # Check if the column is numeric
  if (!is.numeric(dataset[[colname]])) {
    stop("Column is not numeric")
  }

  # Modify the specified column
  dataset[[colname]] <- dataset[[colname]] + 0.001

  return(dataset)
}
