This project collected and cleaned data from experiments involving 30 volunteers performing various activities using a Samsung Galaxy S II.  The data is located here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

As described by the original authors, the data that was originally recorded was processed and then turned into data that included 
- An identifier of the subject
- The activity the subject was performing
- A 561-feature vector with time and frequency domain variables

This data was stored as 2 randomly selected data sets: a training set and a test set.  The training set consisted of 70% of the data and the test set consisted of 30% of the data.

The data for both the training set and test set was originally located in several different files.  The file 'run_analysis.R' assumes that the working directory is the unzipped directory UCI HAR DATASET.  The code then pulls the 3 training sets (each consisting of 7,352 rows)  and 3 test sets (each consisting of 2,947 rows) into R and merges them into one data set (consisting of 10,299 rows and 563 columns) with the subject identified in the 1st column, the activity in the 2nd column, and the 561-features in the remaining columns.  The training set is placed in the first 7,352 rows and the test set in the remaining 2,947 rows. 

The columns are then labeled with the feature names provided by 'features.txt' in the original UCI HAR DATASET. Since we only want the time and frequency domain variables that have to do with mean or standard deviation, a subset of the data is taken that extracts only the columns with:
- The subject
- The activity
- 66 of the 561 time and frequency domain variables.  These extracted columns are listed in 'extractednames.txt' and information about them is provided in 'extractednamesinfo.txt'.

Because the data for the activities are presented as numbers, appropriate English language names are inserted into the data set according to the 'activity_labels.txt' file provided with the UCI HAR DATASET.

A tidy data set 'tidydata.txt' is now produced by calculating the mean of the remaining 66 time and frequency domain variables for each activity performed by each subject.  The column names for this data are the same as 'extractednames.txt'.

