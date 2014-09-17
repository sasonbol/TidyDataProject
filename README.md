TidyDataProject
===============
##Here is a description of the commands used in the run_analysis R script to be used on UCI HAR Dataset to get a tidy dataset of means and standard deviations of measured features.
#tidydf dataset 
##This dataset was obtained by tidying up the mean and standard deviavtion variables in the UCI HAR Dataset

##This file shows the steps followed to tidy up the UCI HAR dataset, which are as follows:

###The working directory was set the the directory at which UCI HAR Dataset directory was saved

1. The first part of the script Merges the training and the test sets to create one data set:

*read test dataset, using read.table() function
*Check the number of columns which represent the number of features 
*Read the ytest dataset where elements in ytest represent different activities (each assigned to a number from 1 to 6)
*Read the subject ids from the subject_test file
*The subject id and the activity data frames shall then be combined with the xtest and ytest data frame
*The same previous steps are to be done with the train dataset
*Now , I shall combine the test and train datasets together using the rbind() function
*To ensure that the combination was fine, the nrow() function was used as the number of rows in the combined dataset should be the sum of number of rows in both sxytest and sxytrain datasets
*When the ncol() function is used, the number of cloumns should remain the same


2. The second part of the script extracts only the measurements on the mean and standard deviation for each measurement

*Read the features dataset and create a vector of all features
*Convert the fvect vector to the character class
*Use the colnames() function to name the variables in the combined dataset with the names in the fvect vector, plus the addition of the variable names to the first 2 columns (subject IDs and activity performed)
*To subset the dataset with the mean value columns, columns which have the word "mean" or "Mean" in their column names were extracted using the grep() function
*To subset the dataset with the standard deviation value columns, columns which have the word "std" in their column names were extracted using the grep() function
*Now, to form a combined data frame for all means and standard deviation values along with the subject ID and activity name columns, cbind() function was used in creating mean.SD.df dataset
*As, some of the columns (49:55) are actually angles of the mean values, thus they were removed from the data frame as they are not actually mean values

3. In the third part of the script, I used descriptive activity names to name the activities in the mean.SD.df dataset 

*The activity variable was first cnverted into  character strings
* the numbers which were used to indicate to certain activities in the activity variable were converted into their corresponding activity

4.  In the forth part of the script, intstead of fixing the column names(variable names), I changed them in a way to be more discriptive as discussed in the code book
* A vector (m.s.names) wih the new variable names was created
*Using the colnames() function, the names of the variables in the mean.SD.df dataset were changed into the names in the m.s.names vector


5. In the fifth part of the script, tidy.df data frame was created where each subject has the mean of each variable during the 6 different activities

*First, load the plyr and dplyr packages
*The ddply() function was used to get the mean (using numcolwise()function) of each column for each activity (6 activities) done by each subject (3o individuals)
*The new created dataset was named tidy.df
*Using the nrow(tidy.df), the result should be 180 which is the multiplication of 30*6, while ncol() function should return the same number of columns in the mean.SD.df data frame
*The final step is to write the data frame out as a text file (tidydf.txt)

