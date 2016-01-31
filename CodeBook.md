#Code Book

##Raw data collection

Raw data are obtained from UCI Machine Learning repository. The experiments have been carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been
video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the
volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and
body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational
force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window,
a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The original dataset includes the following files:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

##Data transformation

The raw data sets are processed with run_analisys.R script to create a final tidy data set.

###Merge training and test sets

Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity ids (y_train.txt, y_test.txt) are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors (features.txt).

###Extract mean and standard deviation variables

From the merged data set is extracted and intermediate data set with only the values of estimated mean (variables with labels that contain "mean") 
and standard deviation (variables with labels that contain "std").

###Use descriptive activity names

A new column is added to intermediate data set with the activity description. Activityid column is used to look up 
descriptions in activity_labels.txt.

###Label variables appropriately

Labels given from the original collectors were changed: to obtain valid R names without parentheses and to obtain more descriptive labels.

###Create a tidy data set

From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and each subject.

The tidy data set contains 10299 observations with 81 variables divided in:
- an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- an identifier of the subject who carried out the experiment (Subject): 1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30
- a 79-feature vector with time and frequency domain signal variables (numeric)

Transformations: 

f - > frequency
t - > time
Acc - > Acceleration
GyroJerk - > AngularAcceleration
Gyro - > AngularSpeed
Mag - > Magnitude

Final names: 

 [1] "timeBodyAcceleration-mean-X"                                
 [2] "timeBodyAcceleration-mean-Y"                                
 [3] "timeBodyAcceleration-mean-Z"                                
 [4] "timeBodyAcceleration-std-X"                                 
 [5] "timeBodyAcceleration-std-Y"                                 
 [6] "timeBodyAcceleration-std-Z"                                 
 [7] "timeGravityAcceleration-mean-X"                             
 [8] "timeGravityAcceleration-mean-Y"                             
 [9] "timeGravityAcceleration-mean-Z"                             
[10] "timeGravityAcceleration-std-X"                              
[11] "timeGravityAcceleration-std-Y"                              
[12] "timeGravityAcceleration-std-Z"                              
[13] "timeBodyAccelerationJerk-mean-X"                            
[14] "timeBodyAccelerationJerk-mean-Y"                            
[15] "timeBodyAccelerationJerk-mean-Z"                            
[16] "timeBodyAccelerationJerk-std-X"                             
[17] "timeBodyAccelerationJerk-std-Y"                             
[18] "timeBodyAccelerationJerk-std-Z"                             
[19] "timeBodyAngularSpeed-mean-X"                                
[20] "timeBodyAngularSpeed-mean-Y"                                
[21] "timeBodyAngularSpeed-mean-Z"                                
[22] "timeBodyAngularSpeed-std-X"                                 
[23] "timeBodyAngularSpeed-std-Y"                                 
[24] "timeBodyAngularSpeed-std-Z"                                 
[25] "timeBodyAngularAcceleration-mean-X"                         
[26] "timeBodyAngularAcceleration-mean-Y"                         
[27] "timeBodyAngularAcceleration-mean-Z"                         
[28] "timeBodyAngularAcceleration-std-X"                          
[29] "timeBodyAngularAcceleration-std-Y"                          
[30] "timeBodyAngularAcceleration-std-Z"                          
[31] "timeBodyAccelerationMagnitude-mean"                         
[32] "timeBodyAccelerationMagnitude-std"                          
[33] "timeGravityAccelerationMagnitude-mean"                      
[34] "timeGravityAccelerationMagnitude-std"                       
[35] "timeBodyAccelerationJerkMagnitude-mean"                     
[36] "timeBodyAccelerationJerkMagnitude-std"                      
[37] "timeBodyAngularSpeedMagnitude-mean"                         
[38] "timeBodyAngularSpeedMagnitude-std"                          
[39] "timeBodyAngularAccelerationMagnitude-mean"                  
[40] "timeBodyAngularAccelerationMagnitude-std"                   
[41] "frequencyBodyAcceleration-mean-X"                           
[42] "frequencyBodyAcceleration-mean-Y"                           
[43] "frequencyBodyAcceleration-mean-Z"                           
[44] "frequencyBodyAcceleration-std-X"                            
[45] "frequencyBodyAcceleration-std-Y"                            
[46] "frequencyBodyAcceleration-std-Z"                            
[47] "frequencyBodyAcceleration-meanFreq-X"                       
[48] "frequencyBodyAcceleration-meanFreq-Y"                       
[49] "frequencyBodyAcceleration-meanFreq-Z"                       
[50] "frequencyBodyAccelerationJerk-mean-X"                       
[51] "frequencyBodyAccelerationJerk-mean-Y"                       
[52] "frequencyBodyAccelerationJerk-mean-Z"                       
[53] "frequencyBodyAccelerationJerk-std-X"                        
[54] "frequencyBodyAccelerationJerk-std-Y"                        
[55] "frequencyBodyAccelerationJerk-std-Z"                        
[56] "frequencyBodyAccelerationJerk-meanFreq-X"                   
[57] "frequencyBodyAccelerationJerk-meanFreq-Y"                   
[58] "frequencyBodyAccelerationJerk-meanFreq-Z"                   
[59] "frequencyBodyAngularSpeed-mean-X"                           
[60] "frequencyBodyAngularSpeed-mean-Y"                           
[61] "frequencyBodyAngularSpeed-mean-Z"                           
[62] "frequencyBodyAngularSpeed-std-X"                            
[63] "frequencyBodyAngularSpeed-std-Y"                            
[64] "frequencyBodyAngularSpeed-std-Z"                            
[65] "frequencyBodyAngularSpeed-meanFreq-X"                       
[66] "frequencyBodyAngularSpeed-meanFreq-Y"                       
[67] "frequencyBodyAngularSpeed-meanFreq-Z"                       
[68] "frequencyBodyAccelerationMagnitude-mean"                    
[69] "frequencyBodyAccelerationMagnitude-std"                     
[70] "frequencyBodyAccelerationMagnitude-meanFrequency"           
[71] "frequencyBodyBodyAccelerationJerkMagnitude-mean"            
[72] "frequencyBodyBodyAccelerationJerkMagnitude-std"             
[73] "frequencyBodyBodyAccelerationJerkMagnitude-meanFrequency"   
[74] "frequencyBodyBodyAngularSpeedMagnitude-mean"                
[75] "frequencyBodyBodyAngularSpeedMagnitude-std"                 
[76] "frequencyBodyBodyAngularSpeedMagnitude-meanFrequency"       
[77] "frequencyBodyBodyAngularAccelerationMagnitude-mean"         
[78] "frequencyBodyBodyAngularAccelerationMagnitude-std"          
[79] "frequencyBodyBodyAngularAccelerationMagnitude-meanFrequency"

The data set is written to the file tidyFinalData.txt.
