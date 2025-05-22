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

There are 4 simple funtions in the package portfunctions that will help with data analyses. There is also a build in dataset to practise the functions on. The functions are explained below. 

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

  # Remove rows with NA or empty values in the specified column
  if (!colname %in% colnames(dataset)) {
    stop("Column not found in dataset")
  }

  dataset <- dataset[complete.cases(dataset[[colname]]), ]

  return(dataset)
}

```

Example: 
```{r}
RemoveNA(LandBird_Monitoring, "Site_Name")
```

NotZero:
function: Makes sure that in a plot the values won't go trough zero. In this way the data values can be seen on the plot. 
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

ChangeColname
function: Change a name of the column in a dataset 
```{r}
ChangeColname <- function(dataset, old_name, new_name) {
  if (!(old_name %in% names(dataset))) {
    stop(paste("Column", old_name, "does not exist in the dataset."))

  }

  names(dataset)[names(dataset) == old_name] <- new_name

  return(dataset )
}
```

Example: 
```{r}
Normalization(LandBird_Monitoring, "Year", "jaar")
```
