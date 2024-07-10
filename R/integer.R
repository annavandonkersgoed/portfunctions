#' Change datatype to integer
#'
#' @param data Dataset
#' @param colname Column from dataset that needs datatype to be changed
#'
#' @return Dataset with the new column datatype
#' @export
#'
#' @examples
#' integer(LandBird_Monitoring, "Year")
#' @export
integer <- function(data, colname)
{
  data[[colname]] < as.integer(data[[colname]])
  return(data)
}
