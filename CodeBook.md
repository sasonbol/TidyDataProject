#Code Book

##(tidydf.txt) dataset

**General description of the experiment and measured signals:**

The experiments have been carried out with a group of 30 volunteers.

Each person performed six  different activities  wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured.
 
The sensor acceleration signal, which has gravitational and body motion components, was separated into body acceleration and gravity. The gravitational force is assumed to have only low frequency components; therefore, a filter with 0.3 Hz cutoff frequency was used.
 
The body linear acceleration and angular velocity were derived in time to obtain Jerk signals.
  
The magnitudes of these three-dimensional signals were calculated using the Euclidean norm.

A Fast Fourier Transform (FFT) was applied to some of these signals , indicated as(f) prefix.

Features are normalized, thus no units are shown

**Variables in (tidydf) dataset:**

•	subjectId

The number of the volunteer contributed in the experiment (1-30)

•	activity

The name of the activity performed by the subject (walking, walking upstairs, walking downstairs, sitting, standing & lying)

•	All other variables are either the mean or the standard deviation (with the suffix: (.mean) or (.std) , respectively) for the measured features

	* The (t) and (f) prefixes indicate time and frequency components, respectively
	* X, Y and Z indicates the axis of the 3D signal
	* Abbreviations for each component are shown between brackets in the figure below
	* The mean &/or the standard deviation were measured for the following features (to understand the relations and abbreviations of the these features, refer to figure1 below):

tAcclBody-XYZ

tAcclGravity-XYZ

tAcclBodyJerk-XYZ

tGyroBody-XYZ

tGyroBodyJerk-XYZ

tAcclBodyMag

tAcclGravityMag

tAcclBodyJerkMag

tGyroBodyMag

tGyroBodyJerkMag

fAcclBody-XYZ

fAcclBodyJerk-XYZ

fGyroBody-XYZ

fAcclBodyMag

fAcclBodyJerkMag

fGyroBodyMag

fGyroBodyJerkMag


	* For each measured feature, the number of (*) symbol in figure1 indicates the variables presented in (tidydf) dataset
	* For better understanding of the variable names, walk through figure1 from left to right

![Figure1](https://raw.githubusercontent.com/sasonbol/TidyDataProject/master/fig1.png)


Figure 1. Variable components present in (tidydf) dataset
