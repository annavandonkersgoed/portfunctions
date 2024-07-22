---
output: github_document
---


```{r, include = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)
```

# portfunctions

There are 4 funtions in the package portfunctions based on the code in my portfolio. 

## Installation
      
``` r
# install.packages("portfunctions")
devtools::install_github("annavandonkersgoed/portfunctions")
install(build_vignettes = TRUE)
```

## Usage

Datatype: A function to change the datatype of a column to the datatype you want. 
function: 
```{r}
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

```

Example: 
```{r}
datatype(LandBird_Monitoring, "Year", "integer")
```

RemoveNa: Removes the NA values from a column.
function: 
```{r}
RemoveNA <- function(dataset, colname){
  # Check if the column name exists
  if (!colname %in% colnames(dataset)) {
    stop("Column not found in dataset")
  }

  # Remove rows with NA or empty values in the specified column
  dataset <- dataset[!is.na(dataset[[colname]]) & dataset[[colname]] != "", ]

  return(dataset)
}

```

Example: 
```{r}
RemoveNA(LandBird_Monitoring, "Site_Name")
```

NotZero:
function: Makees sure that in a plot the values won't go trough zero. 
```{r}
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

```

Example: 
```{r}
LandBird_Monitoring$Year <- as.numeric(LandBird_Monitoring$Year)
NotZero(LandBird_Monitoring, "Year")
```

Normalization
function: Normalized data for a specific value 
```{r}
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
```

Example: 
```{r}
Normalization(LandBird_Monitoring, "Condition", "Calm", "Humidity")
```
