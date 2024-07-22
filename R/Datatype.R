#' Change the datatype
#'
#' @param dataset Dataset
#' @param colname The name of the column of the data that needs to be changed
#' @param type The type of data you want the column to change in
#'
#' @return Dataset with the column that has the changed datatype
#' @export
#'
#' @examples
#' datatype(LandBird_Monitoring, "Year", "integer")
datatype <- function(dataset, colname, type) {
  # Controleren of de kolomnaam bestaat
  if (!colname %in% colnames(dataset)) {
    stop("Column not found in dataset")
  }

  # Convert the column to the specified datatype using if-else
  if (type == "integer") {
    dataset[[colname]] <- as.integer(dataset[[colname]])
  } else if (type == "numeric") {
    dataset[[colname]] <- as.numeric(dataset[[colname]])
  } else if (type == "character") {
    dataset[[colname]] <- as.character(dataset[[colname]])
  } else if (type == "factor") {
    dataset[[colname]] <- as.factor(dataset[[colname]])
  } else if (type == "logical") {
    dataset[[colname]] <- as.logical(dataset[[colname]])
  } else {
    stop("Unsupported datatype")
  }

  return(dataset)
}
