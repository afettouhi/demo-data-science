# Handling Big Data

# Set working directory
setwd("/home/af/Dokumenter/Programs/RStudio/demo-data-science/7-r-data-science-m7-exercise-files")

# Load the ff package
library(ff)

# Read a CSV file as ff data frame
irisff <- read.table.ffdf(
    file = "Iris.csv",
    FUN = "read.csv")

# Inspect the class
class(irisff)

# Inspect the column names
names(irisff)

# Inspect the first few rows
irisff[1:5,]

# Load the biglm package
library(biglm)

# Create a linear regression model
model <- biglm(
    formula = Petal.Width ~ Petal.Length,
    data = irisff)

# Summarize the model
summary(model)

# Create a scatterplot
plot(
    x = irisff$Petal.Length[], 
    y = irisff$Petal.Width[],
    main = "Iris Petal Length vs. Width",
    xlab = "Petal Length (cm)",
    ylab = "Petal Width (cm)")

# Get y-intercept from model
b <- summary(model)$mat[1,1]

# Get slope from model
m <- summary(model)$mat[2,1]

# Draw a regression line on plot
lines(
    x = irisff$Petal.Length[],
    y = m * irisff$Petal.Length[] + b, 
    col = "red",
    lwd = 3)

# Predict new values with the model
predict(
    object = model,
    newdata = data.frame(
        Petal.Length = c(2, 5, 7),
        Petal.Width = c(0, 0, 0)))
