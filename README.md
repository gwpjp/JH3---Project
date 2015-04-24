# JH3---Project (Getting & Cleaning Data in R)
This project collected and cleaned data from experiments involving 30 volunteers performing various activities using a Samsung Galaxy S II.

This repo contains the following files:
--'README.md'

--'run_analysis.R' - this is the code that collects the data assuming that the working directory is the UCI HAR DATASET.  It merges all the training and test data that was published.  The training and test data are then merged.  Afterwards, the data relating to any mean or standard deviation measurements is extracted.  This data is then labeled so each column has the corresponding variable and each activity the subject was performing is given a descriptive name.  A tidy data set containing the mean of each variable for each activity that each subject performed is then outputted as 'tidydata.txt'.

--'tidydata.txt'  - this tidy data set is the output of the code that is run in 'run_analysis.R'.  It contains the mean of each varable for each activity that each subject performed.

--'CodeBook.md' - this document describes the process used to clean the data and provides descriptions for the variable names.
