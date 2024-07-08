integer <- function(data, colname)
{
  data[[colname]] < as.integer(data[[colname]])
  return(data)
}
