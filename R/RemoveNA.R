#' RemoveNA
#'
#' @param dataset The dataset you want to use
#' @param colname The column of the dataset where you want the NA values to be gone
#'
#' @return dataset
#' @export
#'
#' @examples
#' RemoveNA(LandBird_Monitoring, "Site_Name")
RemoveNA <- function(dataset, colname){
  # Check if the column name exists
  if (!colname %in% colnames(dataset)) {
    stop("Column not found in dataset")
  }

  # Remove rows with NA or empty values in the specified column
  dataset <- dataset[!is.na(dataset[[colname]]) & dataset[[colname]] != "", ]

  return(dataset)
}
