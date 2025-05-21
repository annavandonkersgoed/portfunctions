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
RemoveNA <- function(dataset){
  # Check if the column name exists

  # Remove rows with NA or empty values in the specified column
  dataset <- na.omit(dataset)

  return(dataset)
}
