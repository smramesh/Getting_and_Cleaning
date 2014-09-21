When the code reads in the from the files, it reads from 'rootdirectory'/UCI Har Dataset/...

Step 1 reads in all of the files and then combines them into one data frame called final_data

Step 2 reshapes the final_data data frame into mean_and_std_data, which only retains relevant info from the
original data frame

Step 3 renames the indexes in the activity column into the activity names from the activities vector, also provided

Step 4 renames the columns so only alphanumeric characters remain

Step 5 creates the final data frame - "tidy_data", which consists of the average of each variable for each activity
and each subject

The "tidy_data" frame is written to the root directory as "tidydaya.txt" which contains the same data. 
