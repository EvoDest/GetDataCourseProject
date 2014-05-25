# Getting and Cleaning Data
====================

## Course Project CodeBook

### Original data information

The original data is as described (Separated into raw data and data descriptions):

- Data Description
  
  - activity_labels.txt
    
     Description of the activity each subject performs.

  - features_info.txt
    
     Description of the various features in the data.

- Raw Data
    
  - features.txt
  
     List of all the features.
     
  - train/subject_train.txt
     
     Each row identifies the subject in the training data set who performed the activity. Its range is from 1 to 30.

  - train/X_train.txt
  
     Training data set.
     
  - train/y_train.tx
  
     Training data set activity identifiers (refer to activity_labels.txt for description)

  - test/subject_test.txt
     
     Each row identifies the subject in the test data set who performed the activity. Its range is from 1 to 30.

  - test/X_test.txt
  
     Test data set.
     
  - test/y_test.txt
  
     Test data set activity identifiers (refer to activity_labels.txt for description)

### Processes involved in generating Tidy data set

The following processes/work were done to prepare the original raw data and to subsequently generate the tidy data set

1.  Read and store the original test and training data.

2.  Read and store feature names.

3.  Merge original test and training data.
    - Set feature names as the column names of the merged data.
    
4.  Read and store test data activity identifiers.
    - Set the column names of test data activity identifiers for later processing.

5.  Read and store training data activity identifiers.
    - Set the column names of training data activity identifiers for later processing.

6.  Read and store activity names.

7.  Merge and reduce the test activity indentifier data with its names into another table.

8.  Merge and reduce the training activity indentifier data with its names into another table.
    - The activity names are set in place of the original activity identifiers in the final data set.

9.  Merge test and training activity data.

10. Read and store test and training subjects' identifier data.

11. Merge test and training subject identifier data into single table.

12. Merge subject, activity and original feature data into a single table for cleaning and tidying.

13. Process data to get independent data set with the average of each variable for each activity and each subject.

14. Reduce new data set to contain only data representing Mean and Standard Deviation.

15. Rename the final tidy data set's feature column names.

16. Write final tidy data set to working directory.

17. Remove all working data from R environment.

### Feature/Variable Information

The following table lists the features/variables in the final tidy data set and its respective description.

|      | Feature                                      	| Description                                                                                                             	|
|----	|----------------------------------------------	|-------------------------------------------------------------------------------------------------------------------------	|
| 1  	| SubjectId                                    	| Numeric identifier of the individual Subjects (Persons) from the "test" and "train" datasets whose data were collected. 	|
| 2  	| Activity                                     	| The physical activity of which the Subject was performing while data was being collected.                               	|
|    	|                                              	| There are 6 different activities: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying              	|
| 3  	| Time_BodyAcceleration_Mean_XAxis             	| Average of Time domain Body Acceleration Signals with respect to the X-Axis                                             	|
| 4  	| Time_BodyAcceleration_Mean_YAxis             	| Average of Time domain Body Acceleration Signals with respect to the Y-Axis                                             	|
| 5  	| Time_BodyAcceleration_Mean_ZAxis             	| Average of Time domain Body Acceleration Signals with respect to the Z-Axis                                             	|
| 6  	| Time_BodyAcceleration_STD_XAxis              	| Standard Deviation of Time domain Body Acceleration Signals with respect to the X-Axis                                  	|
| 7  	| Time_BodyAcceleration_STD_YAxis              	| Standard Deviation of Time domain Body Acceleration Signals with respect to the Y-Axis                                  	|
| 8  	| Time_BodyAcceleration_STD_ZAxis              	| Standard Deviation of Time domain Body Acceleration Signals with respect to the Z-Axis                                  	|
| 9  	| Time_GravityAcceleration_Mean_XAxis          	| Average of Time domain Gravity Acceleration Signals with respect to the X-Axis                                          	|
| 10 	| Time_GravityAcceleration_Mean_YAxis          	| Average of Time domain Gravity Acceleration Signals with respect to the Y-Axis                                          	|
| 11 	| Time_GravityAcceleration_Mean_ZAxis          	| Average of Time domain Gravity Acceleration Signals with respect to the Z-Axis                                          	|
| 12 	| Time_GravityAcceleration_STD_XAxis           	| Standard Deviation of Time domain Gravity Acceleration Signals with respect to the X-Axis                               	|
| 13 	| Time_GravityAcceleration_STD_YAxis           	| Standard Deviation of Time domain Gravity Acceleration Signals with respect to the Y-Axis                               	|
| 14 	| Time_GravityAcceleration_STD_ZAxis           	| Standard Deviation of Time domain Gravity Acceleration Signals with respect to the Z-Axis                               	|
| 15 	| Time_BodyAcceleration_JerkMean_XAxis         	| Average of Time domain Body Acceleration Jerk Signals with respect to the X-Axis                                        	|
| 16 	| Time_BodyAcceleration_JerkMean_YAxis         	| Average of Time domain Body Acceleration Jerk Signals with respect to the Y-Axis                                        	|
| 17 	| Time_BodyAcceleration_JerkMean_ZAxis         	| Average of Time domain Body Acceleration Jerk Signals with respect to the Z-Axis                                        	|
| 18 	| Time_BodyAcceleration_JerkSTD_XAxis          	| Standard Deviation of Time domain Body Acceleration Jerk Signals with respect to the X-Axis                             	|
| 19 	| Time_BodyAcceleration_JerkSTD_YAxis          	| Standard Deviation of Time domain Body Acceleration Jerk Signals with respect to the Y-Axis                             	|
| 20 	| Time_BodyAcceleration_JerkSTD_ZAxis          	| Standard Deviation of Time domain Body Acceleration Jerk Signals with respect to the Z-Axis                             	|
| 21 	| Time_BodyGyroscope_Mean_XAxis                	| Average of Time domain Body Gyroscope Signals with respect to the X-Axis                                                	|
| 22 	| Time_BodyGyroscope_Mean_YAxis                	| Average of Time domain Body Gyroscope Signals with respect to the Y-Axis                                                	|
| 23 	| Time_BodyGyroscope_Mean_ZAxis                	| Average of Time domain Body Gyroscope Signals with respect to the Z-Axis                                                	|
| 24 	| Time_BodyGyroscope_STD_XAxis                 	| Standard Deviation of Time domain Body Gyroscope Signals with respect to the X-Axis                                     	|
| 25 	| Time_BodyGyroscope_STD_YAxis                 	| Standard Deviation of Time domain Body Gyroscope Signals with respect to the Y-Axis                                     	|
| 26 	| Time_BodyGyroscope_STD_ZAxis                 	| Standard Deviation of Time domain Body Gyroscope Signals with respect to the Z-Axis                                     	|
| 27 	| Time_BodyGyroscope_JerkMean_XAxis            	| Average of Time domain Body Gyroscope Jerk Signals with respect to the X-Axis                                           	|
| 28 	| Time_BodyGyroscope_JerkMean_YAxis            	| Average of Time domain Body Gyroscope Jerk Signals with respect to the Y-Axis                                           	|
| 29 	| Time_BodyGyroscope_JerkMean_ZAxis            	| Average of Time domain Body Gyroscope Jerk Signals with respect to the Z-Axis                                           	|
| 30 	| Time_BodyGyroscope_JerkSTD_XAxis             	| Standard Deviation of Time domain Body Gyroscpoe Signals with respect to the Y-Axis                                     	|
| 31 	| Time_BodyGyroscope_JerkSTD_YAxis             	| Standard Deviation of Time domain Body Gyroscpoe Signals with respect to the Y-Axis                                     	|
| 32 	| Time_BodyGyroscope_JerkSTD_ZAxis             	| Standard Deviation of Time domain Body Gyroscpoe Signals with respect to the Y-Axis                                     	|
| 33 	| Time_BodyAcceleration_Magnitude_Mean         	| Average of Time domain Body Acceleration Signal magnitudes                                                              	|
| 34 	| Time_BodyAcceleration_Magnitude_STD          	| Standard Deviation of Time domain Body Acceleration Signal magnitudes                                                   	|
| 35 	| Time_GravityAcceleration_Magnitude_Mean      	| Average of Time domain Gravity Acceleration Signal magnitudes                                                           	|
| 36 	| Time_GravityAcceleration_Magnitude_STD       	| Standard Deviation of Time domain Gravity Acceleration Signal magnitudes                                                	|
| 37 	| Time_BodyAcceleration_JerkMagnitude_Mean     	| Average of Time domain Body Acceleration Jerk Signal magnitudes                                                         	|
| 38 	| Time_BodyAcceleration_JerkMagnitude_STD      	| Standard Deviation of Time domain Body Acceleration Jerk Signal magnitudes                                              	|
| 39 	| Time_BodyGyroscope_Magnitude_Mean            	| Average of Time domain Body Gyroscope Signal magnitudes                                                                 	|
| 40 	| Time_BodyGyroscope_Magnitude_STD             	| Standard Deviation of Time domain Body Gyroscope Signal magnitudes                                                      	|
| 41 	| Time_BodyGyroscope_JerkMagnitude_Mean        	| Average of Time domain Body Gyroscope Jerk Signal magnitudes                                                            	|
| 42 	| Time_BodyGyroscope_JerkMagnitude_STD         	| Standard Deviation of Time domain Body Gyroscope Jerk Signal magnitudes                                                 	|
| 43 	| Freq_BodyAcceleration_Mean_XAxis             	| Average of Frequency domain Body Acceleration Signals with respect to the X-Axis                                        	|
| 44 	| Freq_BodyAcceleration_Mean_YAxis             	| Average of Frequency domain Body Acceleration Signals with respect to the Y-Axis                                        	|
| 45 	| Freq_BodyAcceleration_Mean_ZAxis             	| Average of Frequency domain Body Acceleration Signals with respect to the Z-Axis                                        	|
| 46 	| Freq_BodyAcceleration_STD_XAxis              	| Standard Deviation of Frequency domain Body Acceleration Signals with respect to the X-Axis                             	|
| 47 	| Freq_BodyAcceleration_STD_YAxis              	| Standard Deviation of Frequency domain Body Acceleration Signals with respect to the X-Axis                             	|
| 48 	| Freq_BodyAcceleration_STD_ZAxis              	| Standard Deviation of Frequency domain Body Acceleration Signals with respect to the X-Axis                             	|
| 49 	| Freq_BodyAcceleration_JerkMean_XAxis         	| Average of Frequency domain Body Acceleration Jerk Signals with respect to the X-Axis                                   	|
| 50 	| Freq_BodyAcceleration_JerkMean_YAxis         	| Average of Frequency domain Body Acceleration Jerk Signals with respect to the Y-Axis                                   	|
| 51 	| Freq_BodyAcceleration_JerkMean_ZAxis         	| Average of Frequency domain Body Acceleration Jerk Signals with respect to the Z-Axis                                   	|
| 52 	| Freq_BodyAcceleration_JerkSTD_XAxis          	| Standard Deviation of Frequency domain Body Acceleration Jerk Signals with respect to the X-Axis                        	|
| 53 	| Freq_BodyAcceleration_JerkSTD_YAxis          	| Standard Deviation of Frequency domain Body Acceleration Jerk Signals with respect to the Y-Axis                        	|
| 54 	| Freq_BodyAcceleration_JerkSTD_ZAxis          	| Standard Deviation of Frequency domain Body Acceleration Jerk Signals with respect to the Z-Axis                        	|
| 55 	| Freq_BodyGyroscope_Mean_XAxis                	| Average of Frequency domain Body Gyroscope Signals with respect to the X-Axis                                           	|
| 56 	| Freq_BodyGyroscope_Mean_YAxis                	| Average of Frequency domain Body Gyroscope Signals with respect to the Y-Axis                                           	|
| 57 	| Freq_BodyGyroscope_Mean_ZAxis                	| Average of Frequency domain Body Gyroscope Signals with respect to the Z-Axis                                           	|
| 58 	| Freq_BodyGyroscope_STD_XAxis                 	| Standard Deviation of Frequency domain Body Gyroscope Signals with respect to the X-Axis                                	|
| 59 	| Freq_BodyGyroscope_STD_YAxis                 	| Standard Deviation of Frequency domain Body Gyroscope Signals with respect to the Y-Axis                                	|
| 60 	| Freq_BodyGyroscope_STD_ZAxis                 	| Standard Deviation of Frequency domain Body Gyroscope Signals with respect to the Z-Axis                                	|
| 61 	| Freq_BodyAcceleration_Magnitude_Mean         	| Average of Frequency domain Body Acceleration Signal magnitudes                                                         	|
| 62 	| Freq_BodyAcceleration_Magnitude_STD          	| Standard Deviation of Frequency domain Body Acceleration Signal magnitudes                                              	|
| 63 	| Freq_BodyBodyAcceleration_JerkMagnitude_Mean 	| Average of Frequency domain BodyBody Acceleration Jerk Signal magnitudes                                                	|
| 64 	| Freq_BodyBodyAcceleration_JerkMagnitude_STD  	| Standard Deviation of Frequency domain BodyBody Acceleration Jerk Signal magnitudes                                     	|
| 65 	| Freq_BodyBodyGyroscope_Magnitude_Mean        	| Average of Frequency domain BodyBody Gyroscope Signal magnitudes                                                        	|
| 66 	| Freq_BodyBodyGyroscope_Magnitude_STD         	| Standard Deviation of Frequency domain BodyBody Gyroscope Signal magnitudes                                             	|
| 67 	| Freq_BodyBodyGyroscope_JerkMagnitude_Mean    	| Average of Frequency domain BodyBody Gyroscope Jerk Signal magnitudes                                                   	|
| 68 	| Freq_BodyBodyGyroscope_JerkMagnitude_STD     	| Standard Deviation of Frequency domain BodyBody Gyroscope Jerk Signal magnitudes                                        	|

---

This is the end of the CodeBook, thanks!