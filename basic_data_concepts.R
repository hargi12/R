 
# R 4 Us  Tutorial
# Author: Haron Gichuhi
# Github: hargi12
# Project: Basic Data Wrangling
# Date: June 16, 2022

# Step 1. Read/import data to your work space
# a. Ensure you've set the workspace as the current working directory
#  HOWTO: on the lower right corner window, click on files>>More>>Set as working directory
# b. create a folder and change its name to "data" 
#    copy your dataset to this folder. Ensure to note the data file format by right clicking
#    on the file name, properties >> type of file.

# Read csv file format

dataset1 <- read.csv("data/abc.csv", header = TRUE) #change abc to your filename

# Read xslx file format
# load the following library
library("readxl")    # read xlsx files
dataset2 <- read_excel("data/abc.xlsx")  #change abc to your filename

# view your imported data
# option A: click on the environment window on your top right corner and double click 
#           on the name of the imported data file.

# Option B: Use the following command
View(dataset1)
View(dataset2)

# summarize the data
summary(dataset1)

# summary() function also enables you to view the number of missing values incase of any
# in your dataset

# You can also check for missing data using the following function
sapply(dataset1, function(x) sum(is.na(x)))

# To remove the missing data rows
complete_dataset <- na.omit(dataset1)

# You can use R package mice to impute missing data if you don't want to loose data
tempData <- mice(dataset1, m =50, maxit=50, meth='pmm', seed=245435) #advanced stuff

# save the imputed dataset
clean_dataset <- complete(tempData)


#Final Note: Based on the attributes/variables in your dataset, with this clean dataset options are limitless
