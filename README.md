#### Reposiroty: EDA_elecpowconsume
*Exploratory Data Analysis on a dataset for individual household electric power consumption.*  

#### Introductory

The 'Electric power consumption' dataset of an individual household used in this course project was taken from the popular machine learning repository, UC Irvine Machine Learning Repositoty. The dataset (~20Mb) contains the electric power usage of an individual household sampled at one minute interval over 4 year period from 2006 ~ 2009.  

The dataset was first downloaded from the internet cloud, and then unzipped to  reveal a delimited text file (224Mb computer memory size) consisting more than 2 milion lines of observations data and 9 variables with about 29500 missing values.    

To ensure robust time-series data order in the dataset, both the date column and time column stored in character string format must be converted to POSIXlt class using strptime() function. This course project requires a 2-day period (2007-02-01 and 2007-02-02) subset of the dataset will be extracted for the needs of exploratory data analysis graph plotting.

