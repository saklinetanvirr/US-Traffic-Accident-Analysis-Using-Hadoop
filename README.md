# US Traffic Accident Analysis Using Hadoop

## Project Overview

This project focuses on analyzing the **US Traffic Accidents Dataset** using the Hadoop ecosystem. The main goal of this project is to process a large-scale traffic accident dataset and extract meaningful insights using distributed data processing technologies.

The project demonstrates the use of:

- Hadoop Distributed File System (HDFS) for storing large datasets
- Hadoop MapReduce for low-level distributed data processing
- Apache Pig for high-level data analysis and query processing

The analysis provides insights into accident patterns based on location, time, weather conditions, severity, and accident characteristics.

---

# Dataset

The dataset used in this project is the **US Accidents Dataset** collected by Sobhan Moosavi.

## Original Dataset Source

Kaggle Dataset Link:

https://www.kaggle.com/datasets/sobhanmoosavi/us-accidents?resource=download

The dataset contains millions of traffic accident records collected from the United States.

The dataset includes attributes such as:

- Accident ID
- Severity Level
- Start Time
- Year
- Month
- Hour
- City
- State
- Weather Condition
- Temperature
- Visibility
- Distance
- Latitude
- Longitude

Due to GitHub's maximum file size limitation (100 MB), the complete dataset is not uploaded to this repository.

A smaller sample dataset is provided inside the `dataset` folder for demonstration purposes.

The complete dataset can be downloaded from the Kaggle link above and used for full-scale Hadoop processing.

---

# Technologies Used

- Apache Hadoop
- Hadoop HDFS
- Hadoop MapReduce
- Apache Pig
- Java
- Git & GitHub
- Windows Environment

---

# Project Structure

```
US-Traffic-Accident-Analysis-Using-Hadoop
│
├── dataset
│   └── US_Traffic_Accidents_Sample.csv
│
├── hdfs
│   └── HDFS related operations and files
│
├── mapreduce
│   │
│   ├── MR1_StateCount
│   │   ├── StateCountDriver.java
│   │   ├── StateCountMapper.java
│   │   ├── StateCountReducer.java
│   │   ├── StateCountDriver.class
│   │   ├── StateCountMapper.class
│   │   ├── StateCountReducer.class
│   │   ├── MR1_StateCount.jar
│   │   └── MR1_State_Result.txt
│   │
│   ├── MR2_WeatherAnalysis
│   │   ├── WeatherCountDriver.java
│   │   ├── WeatherCountMapper.java
│   │   ├── WeatherCountReducer.java
│   │   ├── MR2_WeatherAnalysis.jar
│   │   └── MR2_Weather_Result.txt
│   │
│   └── MR3_SeverityAnalysis
│       ├── SeverityCountDriver.java
│       ├── SeverityCountMapper.java
│       ├── SeverityCountReducer.java
│       ├── MR3_SeverityAnalysis.jar
│       └── MR3_Severity_Result.txt
│
├── pig
│   │
│   ├── Pig_Task1_City_Analysis.pig
│   ├── Pig_Task2_Monthly_Trend.pig
│   ├── Pig_Task3_Weather_Analysis.pig
│   ├── Pig_Task4_Hour_Analysis.pig
│   ├── Pig_Task5_Distance_Analysis.pig
│   │
│   └── results
│       ├── Task1 City Result
│       ├── Task2 Monthly Result
│       ├── Task3 Weather Result
│       ├── Task4 Hour Result
│       └── Task5 Distance Result
│
├── report
│   └── Project Report
│
└── README.md
```

---

# Hadoop MapReduce Analysis

## MapReduce Task 1: State-wise Accident Analysis

### Objective

To calculate the total number of accidents occurring in each state.

### Processing

The MapReduce program reads accident records and groups them based on the state attribute.

### Output

The result provides:

- State name
- Total accident count

---

## MapReduce Task 2: Weather Condition Analysis

### Objective

To analyze accident occurrence based on different weather conditions.

### Processing

The program groups accident records according to weather conditions and calculates the frequency of each condition.

### Output

The result provides:

- Weather condition
- Number of accidents

---

## MapReduce Task 3: Severity Analysis

### Objective

To analyze accident distribution according to severity levels.

### Processing

The program counts accidents for each severity category.

### Output

The result provides:

- Severity level
- Total accidents

---

# Apache Pig Analysis

## Pig Task 1: City-wise Accident Analysis

### Objective

To identify accident frequency based on different cities.

### Processing

The dataset is grouped according to city names and accident counts are calculated.

### Output

- City
- Total number of accidents

---

## Pig Task 2: Monthly Accident Trend

### Objective

To analyze accident patterns across different months.

### Processing

The dataset is grouped by month and total accident occurrences are calculated.

### Output

- Month
- Total accidents

---

## Pig Task 3: Weather Analysis

### Objective

To analyze accident distribution based on weather conditions.

### Processing

Pig groups records according to weather conditions and calculates accident frequency.

### Output

- Weather condition
- Accident count

---

## Pig Task 4: Hour-wise Accident Analysis

### Objective

To analyze accident occurrence according to different hours of the day.

### Processing

The dataset is grouped using the accident hour attribute.

### Output

- Hour
- Total accidents

---

## Pig Task 5: Distance-based Accident Analysis

### Objective

To analyze accident distribution based on accident distance.

### Processing

The accident records are categorized according to distance ranges and analyzed.

### Output

- Distance category
- Number of accidents

---

# How to Run the Project

## Step 1: Start Hadoop Services

Start HDFS:

```bash
start-dfs.cmd
```

Start YARN:

```bash
start-yarn.cmd
```

---

## Step 2: Upload Dataset to HDFS

Example:

```bash
hdfs dfs -mkdir /traffic_accidents

hdfs dfs -put US_Traffic_Accidents_Sample.csv /traffic_accidents/
```

---

## Step 3: Run MapReduce Programs

Compile Java files with Hadoop libraries and execute the generated JAR files.

Example:

```bash
hadoop jar MR1_StateCount.jar StateCountDriver
```

---

## Step 4: Run Apache Pig Scripts

Navigate to the Pig folder:

```bash
cd pig
```

Run a Pig script:

```bash
pig Pig_Task1_City_Analysis.pig
```

---

# Results Generated

The project generates analytical results including:

- State-wise accident statistics
- Weather-based accident patterns
- Severity distribution
- City-wise accident frequency
- Monthly accident trends
- Hourly accident patterns
- Distance-based accident analysis

These results help understand traffic accident patterns and identify important trends.

---

# Key Learning Outcomes

Through this project, the following concepts were implemented:

- Large-scale data processing using Hadoop
- Distributed storage using HDFS
- Writing MapReduce programs using Java
- Data analysis using Apache Pig
- Handling large datasets in a distributed environment
- Extracting meaningful insights from real-world data

---

# Dataset Citation

Moosavi, Sobhan, Mohammad Hossein Samavatian, Srinivasan Parthasarathy, and Rajiv Ramnath.

**"A Countrywide Traffic Accident Dataset."**

2019.

Dataset available at:

https://www.kaggle.com/datasets/sobhanmoosavi/us-accidents?resource=download

---

# Author

**Md. Sakline Hossen**

GitHub:

https://github.com/saklinetanvirr
