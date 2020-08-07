#### Reposiroty: EDA_elecpowconsume
*Exploratory Data Analysis on a dataset for individual household electric power consumption.*  

#### Introductory

The 'Electric power consumption' dataset of an individual household used in this course project was taken from the popular machine learning repository, UC Irvine Machine Learning Repositoty. The dataset (~20Mb) contains the electric power usage of an individual household sampled at one minute interval over 4 year period from 2006 ~ 2009.  

The dataset was first downloaded from the internet cloud, and then unzipped to  reveal a delimited text file (224Mb in memory) consist of more than 2 milion lines of observations data and 9 variables with about 29500 missing values.    

To ensure robust time-series data order in the dataset, both the date column and time column in character string data format must first be converted to POSIXlt class using strptime() function. This course project requires a 2-day period (2007-02-01 and 2007-02-02) subset of the dataset for the needs of exploratory data analysis (EDA) graph plotting.  

There are 4 EDA graph plotting scripts.
1. plot1.R -> plot1.png
2. plot2.R -> plot2.png
3. plot3.R -> plot3.png
4. plot4.R -> plot4.png

