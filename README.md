---
title: "README.md"
author: "Jose Noriega"
date: "8/2/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

**Coursera Getting and Cleaning Data Project**

*This repository contains the following files:*
*README.md - which show the details of the data set*
*tidy_data.txt - text document with the data set results from the run_analysis.R*
*run_analysis.R - the R script used to create the data merge of the files in the project, creating the tidy_data.txt* 

**Creating the data set**

- Read the data using read.table function
- Merge the training and test table using rbin() and cbind() funtion
- Estract the esencial data to calculate the mean and SD
- Details about descriptive activities suing names from the data set
- naming the columns with the appropiate labels 
- Create the average data tidy set for each activity and subject
- Export the data reulting in the "tidy_data.txt" file 

