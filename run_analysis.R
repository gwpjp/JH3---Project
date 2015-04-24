#Assuming that the working directory is the UCI HAR Dataset, the following 
#steps read the data into R.
Xtrain <- read.table("./train/X_train.txt") #reads the 561 variable training set
subtrain <- read.table("./train/subject_train.txt") #reads the subject training set
Ytrain<- read.table("./train/Y_train.txt") #reads the activity training set
Xtest <- read.table("./test/X_test.txt") #reads the 561 variable test set
subtest <- read.table("./test/subject_test.txt") #reads the subject test set
Ytest <- read.table("./test/Y_test.txt") #reads the activity test set

library("dplyr")

#Merges all the training data into 1 data frame along with variable names
train <- cbind(subtrain, Ytrain, Xtrain)

#Merges all the test data into 1 data frame along with variable names
test <- cbind(subtest, Ytest, Xtest)

#Combines the two data sets
data <- rbind(train, test) #data has 10,299 rows and 563 columns

#Names the columns of the data set using features.txt
varnames <- read.table("features.txt") #reads the variable names
varnames <- as.character(varnames[,2])
varnames <- c("Subject", "Activity", varnames)
names(data) <- varnames

#Extracts only the measurements on std deviation and mean.  This will only
#include variables with names that specifically contain "mean()" or 
#"std()" and not variables that simply contain "mean".
remain <- c(grep("mean\\(",varnames),grep("std\\(", varnames))
remain <- c(1,2,remain[order(remain)])
subdata <- data[,remain] #This data set now has 68 columns

#Turns activity numbers into descriptive names
subdata[,2] <- gsub("1","Walking",subdata[,2])
subdata[,2] <- gsub("2","Walking Upstairs",subdata[,2])
subdata[,2] <- gsub("3","Walking Downstairs",subdata[,2])
subdata[,2] <- gsub("4","Sitting",subdata[,2])
subdata[,2] <- gsub("5","Standing",subdata[,2])
subdata[,2] <- gsub("6","Laying",subdata[,2])

# Creates a tidy data output of the average of all the variable for each
# subject for each of his/her activities.
library("reshape2")
dataMelt <- melt(subdata, id=c("Subject","Activity"), 
                 measure.vars = names(subdata[,3:68]))
tidydata <- dcast(dataMelt, Subject + Activity ~ variable, mean)

#Outputs the data to a .txt file
write.table(tidydata,"tidydata.txt")
