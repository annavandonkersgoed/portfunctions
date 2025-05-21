#' ChangeColname
#'
#' @param dataset Dataset
#' @param old_name Column name of the column that you want to change
#' @param new_name Name for the new column
#'
#' @return dataset
#' @export
#'
#' @examples
#'
#' Normalization(LandBird_Monitoring, "Condition", "Calm", "Humidity")
ChangeColname <- function(dataset, old_name, new_name) {
  if (!(old_name %in% names(dataset))) {
    stop(paste("Column", old_name, "does not exist in the dataset."))

  }

  names(dataset)[names(dataset) == old_name] <- new_name

  return(dataset )

}
