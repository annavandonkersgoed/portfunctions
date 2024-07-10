#' Change datatype to numeric
#'
#' @param data Dataset with a column
#' @param colname Column from the dataset that needs to be changes
#'
#' @return Dataset with the new column datatype
#' @export
#'
#' @examples
#' numeric(LandBird_Monitoring, "Year")
#' @export
numeric <- function(data, colname)
{
  data[[colname]] < as.numeric(data[[colname]])
  return(data)
}
