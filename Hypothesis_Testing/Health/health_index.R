
library(ggplot2)
library(scales)
library(readr)
library(ggplot2)

#https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/QoL/QoL.csv
#https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/Mask_Req_Length/JL_by_state.csv 
QoL <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/QoL/QoL.csv")
JL <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/Mask_Req_Length/JL_by_state.csv")

analysis_qol <- merge(JL, QoL, by.x = "state_name", by.y = "state")  
cor.test(analysis_qol$ProportionOfJobLossIndexToLowIncomeJobs, analysis_qol$healthCareRank_21)
