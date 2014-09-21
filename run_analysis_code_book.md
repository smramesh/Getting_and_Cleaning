##Variables
features - a table that is read into R from "features.txt"

activity_labels - a table that is read into R from "activity_labels.txt"

subject_train - a table that is read into R from "subject_train.txt"

x_train - a table that is read into R from "x_train.txt"

y_train - a table that is read into R from "y_train.txt"

subject_test - a table that is read into R from "subject_test.txt"

x_test - a table that is read into R from "x_test.txt"

y_test - a table that is read into R from "y_test.txt"

final_data - The data frame that is created from merging the test and training sets

features - a table that is read into R from "features.txt"

mean_and_std data - modifies final data so it calculates the mean and standard deviation of the activities

tidy_data - the final data frame that is 2 columns - one with the activity names and the other with the mean of the samples. This is the frame that gets written to tidydata.txt. 

##Tranformations

The first transformation is when the data read in from the various files - features through y_test is merged into final data.

Most of the reshaping of data involves changing the names of columns and accessing the activity names to replace them the the indexes that are there by default in the activity column of final_data.  

The next transformation is mean_and_std data which calculates the mean and standard deviation of the activities

The final transformation is tidy_data, which extracts only the relevant data from mean_and_std data, and creates 2 columns of only the information that was asked for. 

