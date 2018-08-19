CodeBook

run_analysis.R manipulates data in 5 steps.

Measurements have been made with accelerometer and gyroscope.
Vector of features have been obtained by calculating variables
in the sensor signals.

Mean() and std() are selected features in this dataset.

Measurements have been made during 6 activities: walking, walking upstairs, walking downstairs, sitting standing and laying. The obtained dataset has been randomly partioned into two sets, that are called: training data and test data.

Transformations to the original data by run_analysis.R:

Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement.

Uses descriptive activity names to name the activities in the data set.

Appropriately labels the data set with descriptive variable names: feat_id, feat_name.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables:

Each variable is the mean value of all measurements recorded for that variable for each subject and activity. The values are bounded between -1 and 1.

Subject ID: 1-30

Activity: Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying

Measurement Variables can be seen at the beginning of the tidy_averige.txt file in this repository.
