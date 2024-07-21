#' Change datatype to a character
#'
#' @param data Dataset with a column
#' @param colname Column from the dataset that needs to be changes
#'
#' @return Dataset with the new column datatype
#' @export
#'
#' @examples
#' factor(LandBird_Monitoring, "Year")
#' @export
factor <- function(data, colname)
{
  data[[colname]] < as.character(data[[colname]])
  return(data)
}
