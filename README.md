#### Reposiroty: EDA_elecpowconsum  
*Exploratory Data Analysis on a dataset for individual household electric power consumption.*  
  
##### Introductory  
  
The 'Electric power consumption' dataset of an individual household used in this course project was taken from the popular machine learning repository, UC Irvine Machine Learning Repositoty. The dataset (~20Mb) consists of an individual household electric power usage measurement data sampled at one minute interval over 4 year period from 2006/12 ~ 2010/11.  
  
The dataset was first downloaded from the internet cloud, and then uncompressed to reveal a flat delimited text file (224Mb RAM footprint) with slightly more than 2 million lines of observations data and 9 variables with about 29500 missing values.  
  
To ensure robust time-series data sort order in the dataset, both the date and time columns in character string data type must first be converted to POSIXlt class using strptime() function. This course project requires a 2-day period (2007-02-01 and 2007-02-02, yyyy-mm-dd) subset of the dataset for the needs of exploratory data analysis (EDA) graph plotting.  
  
##### Brief description of pseudo-logic of graphs plotting scripts  
1. test existence of "household power consumption" working data subset  
2. if existed goto step 10 else goto step 3  
3. set fileurl to the internet download link where the dataset file is located  
4. establish a temporary place holder for the downloaded dataset file  
5. download the dataset file from the URL link into temporary place holder  
6. uncompress the downloaded dataset file  
7. load dataset file as data frame (auto type-conversion where possible)  
8. convert Date & Time variables from character string to date-time class  
9. extract a working data subset where Date == c("2007-02-01" , "2007-02-02")  
10.plot EDA graph  
  
  
There are 4 EDA graph plotting scripts and corresponding plots output.  
1. plot1.R -> plot1.png  
2. plot2.R -> plot2.png  
3. plot3.R -> plot3.png  
4. plot4.R -> plot4.png  

